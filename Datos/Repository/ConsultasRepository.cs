using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Datos.Repository
{
    public static class ConsultasRepository
    {
        static Datos.Entities.ServicioMedicoEntities db = new Entities.ServicioMedicoEntities();


        /// <summary>
        /// Llena un gridView con todas las consultas
        /// </summary>
        /// <param name="grid"></param>
        public static void LlenarGridConsultas(ref GridView grid)
        {
            try
            {
                var data = (from con in db.Consultas
                            join patient in db.Paciente on con.Paciente_Id equals patient.Paciente_Id
                            select new
                            {
                                ID = con.Consultas_Id,
                                Nombres = patient.PrimerNombre + " " + patient.SegundoNombre,
                                Apellidos = patient.ApellidoPaterno + " " + patient.ApellidoMaterno,
                                Fecha = con.Fecha_Consulta,
                                Calificacion_Examen = con.Calificacion_Medica
                            }).ToList();

                grid.DataSource = data;
                grid.DataBind();
            }
            catch (Exception ex)
            {

                throw;
            }
        }



        /// <summary>
        /// Inserta una nueva consulta y retorna el Consulta_Id
        /// </summary>
        /// <param name="consulta"></param>
        /// <returns></returns>
        public static int? InsertarConsulta(Datos.Entities.Consultas consulta)
        {
            try
            {
                db.Consultas.Add(consulta);
                db.SaveChanges();

                return consulta.Consultas_Id;
            }
            catch (Exception ex)
            {
                return null;
                throw;
            }

        }



        /// <summary>
        /// Retorna un Object Paciente segun 
        /// la Consulta_Id
        /// </summary>
        /// <param name="consultaId"></param>
        /// <returns></returns>
        public static Datos.Entities.Paciente ObtenerPacientePorConsultaId(int consultaId)
        {

            try
            {
                var x = (from con in db.Consultas
                         join paciente in db.Paciente on con.Paciente_Id equals paciente.Paciente_Id
                         where con.Consultas_Id==consultaId
                         select paciente).First();

                return x;
            }
            catch (Exception ex)
            {
                return null;
                throw;
            }

        }



        /// <summary>
        /// Retorna Los datos de una consulta
        /// por la Consulta_Id
        /// </summary>
        /// <param name="consultaId"></param>
        /// <returns></returns>
        public static Datos.Entities.Consultas GetConsultasPorConsultaId(int consultaId)
        {
            try
            {
                var x = db.Consultas.Find(consultaId);

                return x;
            }
            catch (Exception ex)
            {
                return null;
                throw;
            }

        }

    }
}
