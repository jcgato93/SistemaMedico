using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaMedico.Views
{
    public partial class PrescripcionIngreso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillForm();
            }

        }



        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            ValidacionFormulario();

        }




        /// <summary>
        /// Valida con campos del formulario
        /// </summary>
        public void ValidacionFormulario()
        {
            int faltaInfo = 0;
            string datosFaltantes="Faltan los siguientes Datos: ";
            if (string.IsNullOrEmpty(txtFechaConsulta.Text)) { faltaInfo++; datosFaltantes = datosFaltantes + "Fecha Consulta, "; }
            if (string.IsNullOrEmpty(txtPrimerNombre.Text)) { faltaInfo++; datosFaltantes = datosFaltantes + "Primer Nombre, "; }
            if (string.IsNullOrEmpty(txtPrimerApellido.Text)) { faltaInfo++; datosFaltantes = datosFaltantes + "Primer Apellido,"; }
            if (string.IsNullOrEmpty(txtIdentificacion.Text)) { faltaInfo++; datosFaltantes = datosFaltantes + "Numero de identificacion, "; }
            if (string.IsNullOrEmpty(txtDOB.Text)) { faltaInfo++; datosFaltantes = datosFaltantes + "Fecha de Nacimiento, "; }
            if (string.IsNullOrEmpty(txtFechaConsulta.Text)) { faltaInfo++; datosFaltantes = datosFaltantes + "Fecha de la Consulta, "; }
            if (ddlEPS.SelectedValue.Equals("-1")) { faltaInfo++; datosFaltantes = datosFaltantes + "EPS"; }

            if (faltaInfo > 0)
            {
                Response.Write("<script>alert('" + datosFaltantes + "')</script>");
            }
            else {
                int? datosGuardados=SaveAndSubmit();                
                if (datosGuardados != null)
                {
                    fillPDF((int)datosGuardados);
                    btnGenerar.Enabled = false;
                }

               
            }
        }


        /// <summary>
        /// Guarda los Datos en la Base de Datos
        /// </summary>
        /// <returns></returns>
        public int? SaveAndSubmit()
        {
            Datos.Entities.Paciente paciente = new Datos.Entities.Paciente();
            Datos.Entities.Consultas consulta = new Datos.Entities.Consultas();


            paciente.PrimerNombre = txtPrimerNombre.Text;
            paciente.SegundoNombre = txtSegundoNombre.Text;
            paciente.ApellidoPaterno = txtPrimerApellido.Text;
            paciente.ApellidoMaterno = txtSegundoApellido.Text;
            paciente.Numero_de_Documento =int.Parse (txtIdentificacion.Text);
            DateTime timeDOB = Convert.ToDateTime(txtDOB.Text);
            paciente.DOB = timeDOB.ToString("yyyy-MM-dd");
            paciente.Genero=(rbFemenino.Checked)? "Femenino" : "Masculino";
            paciente.Telefono = Convert.ToInt64(txtTelefono.Text);
            paciente.RH = ddlRH.SelectedValue;
            paciente.Direccion = txtDireccion.Text;

            int? pacienteId = Datos.Repository.PacienteRepository.InsertarPaciente(paciente);

            if (pacienteId != null)
            {
                consulta.Paciente_Id = (int)pacienteId;
                consulta.EPS_Id = int.Parse(ddlEPS.SelectedValue);
                consulta.Cargo = txtCargo.Text;
                consulta.Empresa = txtEmpresa.Text;

                string tipoExamen = "";

                if (rbIngreso.Checked) tipoExamen = "INGRESO";
                if (rbPeriodico.Checked) tipoExamen = "PERIODICO";
                if (rbRetiro.Checked) tipoExamen = "RETIRO";
                if (rbOtro.Checked) tipoExamen = "OTRO";

                consulta.Tipo_de_Examen = tipoExamen;
                consulta.Estado_Civil = ddlEstadoCivil.SelectedValue;

                string calificacionmedica = "";

                if (rbAPTO.Checked) calificacionmedica = "APTO";
                if (rbAPTO_CON_RESTRICCIONES.Checked) calificacionmedica = "APTO CON RESTRICCIONES";
                if (rbRESTRICCION_TEMPORAL.Checked) calificacionmedica = "RESTRICCION TEMPORAL";
                if (rbRESTRICCION_DEFINITIVA.Checked) calificacionmedica = "RESTRICCION DEFINITIVA";

                DateTime timeFechaConsulta = Convert.ToDateTime(txtFechaConsulta.Text);
                consulta.Fecha_Consulta = timeFechaConsulta.ToString("yyyy-MM-dd");
                consulta.Calificacion_Medica = calificacionmedica;
                consulta.Observaciones = txtObservaciones.Text;


                int? consultaId = Datos.Repository.ConsultasRepository.InsertarConsulta(consulta);

                if (consultaId != null)
                {
                    return consultaId;
                }
                else
                {
                    return null;
                }

            }
            else
            {
                return null;
            }
            
        }


        /// <summary>
        /// Llena el pdf 
        /// guarda la informacion en la base de datos
        /// y descarga el documento generado
        /// </summary>
        /// <param name="consultaId"></param>
        public void  fillPDF(int consultaId)
        {
            try
            {
                var paciente = Datos.Repository.ConsultasRepository.ObtenerPacientePorConsultaId(consultaId);
                var consulta = Datos.Repository.ConsultasRepository.GetConsultasPorConsultaId(consultaId);

                var catalogoDocumento = Datos.Repository.CatalogoDocumentoRepository.GetCatalogoDocumento();

                if (catalogoDocumento != null)
                {
                    //Template
                    string pdfTemplate = @catalogoDocumento.Url_Documetno;//Ruta y nombre de la platilla del PDF

                    string newName = catalogoDocumento.NombreDocumento;//Nombre del pdf Plantilla

                    //Retorna el numero de prescripciones previas de la consulta
                    int? numeroPrescripciones = Datos.Repository.PrescripcionesRepository.numeroPrescripcionesDeConsulta(consultaId);



                    newName = newName.Replace(newName, (numeroPrescripciones + 1) + "-" + newName).Replace("$FirstName", paciente.PrimerNombre + " ").Replace("$LastName", paciente.ApellidoPaterno + " Consulta# " + consultaId);//Nombre con el que se guardara el PDF Modificado

                    string newFile = @catalogoDocumento.Url_Destino + newName;//Ruta y Nombre Donde se guardara el PDF Modificado

                    PdfReader pdfReader = new PdfReader(pdfTemplate);
                    PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileStream(newFile, FileMode.Create));

                    AcroFields pdfFormFields = pdfStamper.AcroFields;


                    if (rbIngreso.Checked) { pdfFormFields.SetField("Tipo_Examen", "INGRESO"); }
                    if (rbPeriodico.Checked) { pdfFormFields.SetField("Tipo_Examen", "PERIODICO"); }
                    if (rbRetiro.Checked) { pdfFormFields.SetField("Tipo_Examen", "RETIRO"); }
                    if (rbOtro.Checked) { pdfFormFields.SetField("Tipo_Examen", "OTRO"); }


                    DateTime dateFechaConsulta = Convert.ToDateTime(consulta.Fecha_Consulta);
                    pdfFormFields.SetField("Dia_Consulta", dateFechaConsulta.Day.ToString());
                    pdfFormFields.SetField("Mes_Consulta", dateFechaConsulta.Month.ToString());
                    pdfFormFields.SetField("Ano_Consulta", dateFechaConsulta.Year.ToString());

                    pdfFormFields.SetField("NOMBRES Y APELLIDOS", paciente.PrimerNombre + " " + paciente.SegundoNombre + " " + paciente.ApellidoPaterno + " " + paciente.ApellidoMaterno);
                    pdfFormFields.SetField("CC", paciente.Numero_de_Documento.ToString());


                    DateTime dateFechaNacimiento = Convert.ToDateTime(paciente.DOB);
                    pdfFormFields.SetField("Dia_Nacimiento", dateFechaNacimiento.Day.ToString());
                    pdfFormFields.SetField("Mes_Nacimiento", dateFechaNacimiento.Month.ToString());
                    pdfFormFields.SetField("Ano_Nacimiento", dateFechaNacimiento.Year.ToString());


                    pdfFormFields.SetField("Genero", paciente.Genero);

                    pdfFormFields.SetField("Edad", txtEdad.Text);
                    pdfFormFields.SetField("Estado_Civil", ddlEstadoCivil.SelectedValue);
                    pdfFormFields.SetField("Telefono", paciente.Telefono.ToString());
                    pdfFormFields.SetField("EMPRESA", consulta.Empresa);
                    pdfFormFields.SetField("CARGO", consulta.Cargo);

                    if (!ddlEPS.SelectedValue.Equals("-1"))
                    {
                        pdfFormFields.SetField("EPS", ddlEPS.SelectedItem.Text);
                    }
                    pdfFormFields.SetField("RH", ddlRH.SelectedValue);
                    pdfFormFields.SetField("DIRECCION", paciente.Direccion);

                    if (rbAPTO.Checked){ pdfFormFields.SetField("CalificacionMedica", "APTO"); }
                    if (rbAPTO_CON_RESTRICCIONES.Checked) { pdfFormFields.SetField("CalificacionMedica", "APTO CON RESTRICCIONES"); }
                    if (rbRESTRICCION_TEMPORAL.Checked) { pdfFormFields.SetField("CalificacionMedica", "RESTRICCION TEMPORAL"); }
                    if (rbRESTRICCION_DEFINITIVA.Checked) { pdfFormFields.SetField("CalificacionMedica", "RESTRICCION DEFINITIVA"); }

                    if (rbConceptoRetiro.Checked) { pdfFormFields.SetField("Concepto_Retiro", "Yes"); }

                    if (chkAuditivo.Checked) { pdfFormFields.SetField("AUDITIVO", "Yes"); }
                    if (chkErgonomico.Checked) { pdfFormFields.SetField("ERGONOMICO", "Yes"); }
                    if (chkRespiratorio.Checked) { pdfFormFields.SetField("RESPIRATORIO", "Yes"); }
                    if (chkPsicolaboral.Checked) { pdfFormFields.SetField("PSICOLABORAL", "Yes"); }
                    if (chkVisual.Checked) { pdfFormFields.SetField("VISUAL", "Yes"); }
                    if (chkQuimico.Checked) { pdfFormFields.SetField("QUIMICO", "Yes"); }
                    if (chkBiologico.Checked) { pdfFormFields.SetField("BIOLOGICO", "Yes"); }

                    if (EPSSI.Checked) { pdfFormFields.SetField("Remitodo_EPS", "Yes"); } else { pdfFormFields.SetField("Remitodo_EPS", "No"); }
                    if (ARLSI.Checked) { pdfFormFields.SetField("Remitodo_ARL", "Yes"); } else { pdfFormFields.SetField("Remitodo_ARL", "No"); }

                    if (chkAutocuidado.Checked) { pdfFormFields.SetField("Autocuidado", "Yes"); }
                    if (chkRecomendaciones.Checked) { pdfFormFields.SetField("Seguir Recomendacion", "Yes"); }
                    if (chkEPP.Checked) { pdfFormFields.SetField("Uso_EPP", "Yes"); }
                    if (chkPausasActivas.Checked) { pdfFormFields.SetField("Pausas Activas", "Yes"); }
                    if (chkHigienePostural.Checked) { pdfFormFields.SetField("Higiene Postural", "Yes"); }
                    if (chkEstiloVidaSaludable.Checked) { pdfFormFields.SetField("Estilo Vida", "Yes"); }

                    if (chkAudiometria.Checked) { pdfFormFields.SetField("Audiometria", "Yes"); }
                    if (chkTSH.Checked) { pdfFormFields.SetField("TSH", "Yes"); }
                    if (chkOptometria.Checked) { pdfFormFields.SetField("Optometria", "Yes"); }
                    if (chkElectrocardiograma.Checked) { pdfFormFields.SetField("Electrocardiograma", "Yes"); }
                    if (chkVisiometria.Checked) { pdfFormFields.SetField("Visiometria", "Yes"); }
                    if (chkEspirometria.Checked) { pdfFormFields.SetField("Espirometria", "Yes"); }
                    if (chkHemograma.Checked) { pdfFormFields.SetField("Hemograma", "Yes"); }
                    if (chkGlicemia.Checked) { pdfFormFields.SetField("Glicemia", "Yes"); }

                     pdfFormFields.SetField("Observaciones",consulta.Observaciones); 

                    // Cambia la propiedad para que no se pueda editar el PDF
                    pdfStamper.FormFlattening = false;

                    // Cierra el PDF
                    pdfStamper.Close();




                    Datos.Entities.Prescripciones prescripcion = new Datos.Entities.Prescripciones();

                    prescripcion.Consultas_Id = consultaId;
                    prescripcion.Nombre_Documento = newName;
                    prescripcion.Url_Documento = newFile;
                    prescripcion.fecha_Generado = DateTime.Now.ToString("yyyy-MM-dd");

                    //Inserta los datos de la prescripcion generada
                    int? prescripcionId = Datos.Repository.PrescripcionesRepository.InsertarPrescripcion(prescripcion);


                    //Descargar el Documento
                    Response.ContentType = "text/pdf";
                    Response.ContentEncoding = System.Text.Encoding.UTF8;
                    Response.AppendHeader("NombreCabecera", "MensajeCabecera");
                    Response.AddHeader("Content-Disposition", string.Format("attachment; filename = \"{0}\"", System.IO.Path.GetFileName(newFile)));

                    Response.WriteFile(newFile, false);

                    HttpContext.Current.ApplicationInstance.CompleteRequest();

                }
                else
                {
                    Response.Write("<script>alert('No se encuentra la ruta del archivo')</script>");
                }

            }
            catch (Exception ex)
            {

                throw;
            }

        }




        /// <summary>
        //Llena el formulario con valores predeterminados   
        /// </summary>
        public void fillForm()
        {
            Datos.Repository.EPSRepository.llenarDropDownConEPS(ref ddlEPS);
            txtFechaConsulta.Text = DateTime.Now.ToString();
        }

       
    }
}