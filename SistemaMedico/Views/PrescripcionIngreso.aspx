<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Home.Master" AutoEventWireup="true" CodeBehind="PrescripcionIngreso.aspx.cs" Inherits="SistemaMedico.Views.PrescripcionIngreso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <script>      
        $(document).ready(function () {
            var date = new Date();

            var day = date.getDate();
            var month = date.getMonth() + 1;
            var year = date.getFullYear();

            if (month < 10) month = "0" + month;
            if (day < 10) day = "0" + day;

            var today = year + "-" + month + "-" + day;
            $("#ContentPlaceHolder1_txtFechaConsulta").attr("value", today);
        });


        function calculaFecha()
        {
            var fecha = $('#ContentPlaceHolder1_txtDOB').val();
            var hoy = new Date();
            var cumpleanos = new Date(fecha);
            var edad = hoy.getFullYear() - cumpleanos.getFullYear();
            var m = hoy.getMonth() - cumpleanos.getMonth();

            if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
                edad--;
            }

            $('#ContentPlaceHolder1_txtEdad').val(edad);
        }
        


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
        <div class="row">
             <div class="col-md-6">
                 <h4>
                 <center>
                    CERTIFICADO DE APTITUD MEDICO
                 </center>
                 </h4>
            </div>     
            <div class="col-md-6">
                Codigo: <br />
                Version:<br />
                Fecha:
            </div>
            
        </div>
       
        <div class="row">
            <div class="col-md-2"><h4><center>TIPO DE EXAMEN</center></h4></div>           

            <div class="col-md-6"> 
           
                <asp:RadioButton ID="rbIngreso"  runat="server" Text="INGRESO" GroupName="Examen" Checked="True" />
                &nbsp; &nbsp;
                 <asp:RadioButton ID="rbPeriodico"  runat="server"  Text="PERIODICO" GroupName="Examen" />
                &nbsp; &nbsp;
                 <asp:RadioButton ID="rbRetiro"  runat="server" Text="RETIRO" GroupName="Examen" />
                &nbsp; &nbsp;
                <asp:RadioButton ID="rbOtro" runat="server" Text="OTRO" GroupName="Examen"  />
            </div>
            
           <div class="col-md-4">            
                 FECHA 
                <asp:TextBox ID="txtFechaConsulta" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
            </div>

        </div> 
          
        <%-- FINAL DE SEPTIMO PANEL --%>
        <div class="panel panel-primary"> 
          <div class="panel-footer" ><h5><center>INFORMACIÓN PERSONAL</center></h5></div>
            <div class="panel-body">
                <div class="row" style="margin-top:1em"> 
                    <div class="col-md-6" style="margin-top:1em"> PRIMER NOMBRE        
                        <asp:TextBox ID="txtPrimerNombre" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="margin-top:1em">SEGUNDO NOMBRE   
                        <asp:TextBox ID="txtSegundoNombre" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6" style="margin-top:1em">APELLIDO PATERNO            
                        <asp:TextBox ID="txtPrimerApellido" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6" style="margin-top:1em">APELLIDO MATERNO            
                        <asp:TextBox ID="txtSegundoApellido" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-6" style="margin-top:1em">CC           
              
                        <asp:TextBox ID="txtIdentificacion" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox> 
                    </div>

                    <div class="col-md-6" style="margin-top:1em"> 
                        FECHA DE NACIMIENTO 
                        <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" TextMode="Date" onchange="calculaFecha()"></asp:TextBox>
                    </div>
            
                 </div>         

                <div class="row" style="margin-top:1em">        
                    
               
                    <div class="col-md-3"> 
                        <div>
                            GENERO
                        </div>            
                        <asp:RadioButton ID="rbFemenino" runat="server"  GroupName="genero" Text="Femenino" Checked="True"/>
                        <asp:RadioButton ID="rbMasculino" runat="server" GroupName="genero" Text="Masculino" />
                    </div>
              
                    <div class="col-md-1">
                        <div>
                        EDAD
                            </div>
                        <asp:TextBox ID="txtEdad" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    </div>

                    <div class="col-md-2">
                        <div>
                        ESTADO CIVIL 
                        </div>
                        <asp:DropDownList ID="ddlEstadoCivil" runat="server" CssClass="form-control">
                            <asp:ListItem>Soltero</asp:ListItem>
                            <asp:ListItem>Casado</asp:ListItem>
                            <asp:ListItem>Divorciado</asp:ListItem>
                            <asp:ListItem>Viudo</asp:ListItem>
                            <asp:ListItem>Union Libre</asp:ListItem>

                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3"> 
                        TELÉFONO  
                        <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
          
                </div>   

                <div class="row" style="margin-top:1em">

                    <div class="col-md-3"> 
                        EMPRESA: 
                        <asp:TextBox ID="txtEmpresa" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-2"> 
                        CARGO:  
                        <asp:TextBox ID="txtCargo" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>

                    <div class="col-md-2"> 
                        EPS  
                        <asp:DropDownList ID="ddlEPS" runat="server" CssClass="form-control">
                            <asp:ListItem>Coomeva</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                     <div class="col-md-2"> 
                        RH: <asp:DropDownList ID="ddlRH" runat="server" CssClass="form-control">
                            <asp:ListItem>AB+</asp:ListItem>
                            <asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>A+</asp:ListItem>
                            <asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem>
                            <asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem>
                            <asp:ListItem>O-</asp:ListItem>
                        </asp:DropDownList> 
                         
                    </div>

                     <div class="col-md-3"> 
                        DIRECCION:  
                         <asp:TextBox ID="txtDireccion" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                </div>        
            </div>       
        </div>  <%-- SEPTIMO PANEL --%><%-- FINAL DE SEPTIMO PANEL --%>
        <div class="panel panel-primary"> 
          <div class="panel-footer" ><h5><center>PACIENTE OCUPACIONAL</center></h5></div>
          <div class="panel-body">
              <div class="row">
                  <div class="col-md-3">
              <p>
                  <center>
                    <asp:RadioButton ID="rbAPTO" runat="server" GroupName="Radio" Checked="True"></asp:RadioButton>
                    <br />
                    APTO <br />
                      Para trabajar no presenta 
                      ninguna patologia susceptible del 
                      ser agravada por los riesgos ocupacionales 
                      propios del cargo.
                  </center>
              </p>
              </div>

               <div class="col-md-3">
              <p>
               <center>
                <asp:RadioButton ID="rbAPTO_CON_RESTRICCIONES" runat="server" GroupName="Radio"></asp:RadioButton>
                 <br />
                   APTO CON RESTRINCCIONES <br />
                  Por presentar alguna(s) patologia(s)
                  susceptible(s) de ser agravada(s) por los 
                  riesgos ocupacionales propios del cargo.
               </center>
 
              </p>
              </div>

               <div class="col-md-3">
              <p>
                  <center>
                    <asp:RadioButton ID="rbRESTRICCION_TEMPORAL" runat="server" GroupName="Radio"></asp:RadioButton><br />
                     RESTRINCCION TEMPORAL <br />
                   Requiere valoracion adicional por EPS.
                  </center>
                
              </p>
              </div>

               <div class="col-md-3">
              <p>
                  <center>
                    <asp:RadioButton ID="rbRESTRICCION_DEFINITIVA" runat="server" GroupName="Radio"></asp:RadioButton><br />
                      RESTRICCION <br /> DEFINITIVA
                  </center>
                
                  
              </p>
              </div>

              </div>             
              
         </div>
         </div>  <%-- SEPTIMO PANEL --%><%-- FINAL DE SEPTIMO PANEL --%>
        <div class="panel panel-primary"> 
          <div class="panel-footer" ><h5><center>CONCEPTO DE RETIRO</center></h5></div>
          <div class="panel-body">
              <div class="row">
                  <div class="col-md-12">
                      
                      <asp:CheckBox ID="rbConceptoRetiro" runat="server" Text="Sin Enfermedad Aparente Relacionada con ATEL"/>  
                  </div>
              </div>

          </div>
        </div>  <%-- SEPTIMO PANEL --%><%-- FINAL DE SEPTIMO PANEL --%>        
        <div class="panel panel-primary">
               <div class="panel-footer"><h5><center>SISTEMA DE VIGILANCIA  EPIDEMIOLOGICA AL QUE DEBE PERTENECER </center></h5> </div>
                <div class="panel-body">
                   <div class="row">
                  <div class="col-md-3">
                      
                      <asp:CheckBox ID="chkAuditivo" runat="server" Text="AUDITIVO"/>  
                  </div>
                  <div class="col-md-3">
                      
                      <asp:CheckBox ID="chkErgonomico" runat="server" Text="ERGONOMICO"/>  
                  </div>

                  <div class="col-md-3">
                      
                      <asp:CheckBox ID="chkRespiratorio" runat="server" Text="RESPIRATORIO"/>  
                  </div>

                  <div class="col-md-3">
                      
                      <asp:CheckBox ID="chkPsicolaboral" runat="server" Text="PSICOLABORAL"/>  
                  </div>
              </div>

                    <br />

              <div class="row">
                    <div class="col-md-3">
                      
                      <asp:CheckBox ID="chkVisual" runat="server" Text="VISUAL"/>  
                   </div>

                  <div class="col-md-3">
                       
                      <asp:CheckBox ID="chkQuimico" runat="server" Text="QUIMICO"/>  
                   </div>

                  <div class="col-md-3">
                       
                      <asp:CheckBox ID="chkBiologico" runat="server" Text="BIOLOGICO"/>  
                   </div>
               </div>

               </div>

           </div>  <%-- SEPTIMO PANEL --%><%-- FINAL DE SEPTIMO PANEL --%>

         <div class="panel panel-primary">
             <div class="panel panel-footer"> <h5><center>RECOMENDACIONES Y MEDIDAS DE CONTROL</center></h5></div>
                 <div class="panel-body">
                     <div class="row">
                                          
                     
                       
                         
                     </div>
                     <br />
                     <div class="row">
                         <div class="col-md-4">
                             <div class="row">
                             <div class="col-md-12">
                                  Remitido a EPS
                                 &nbsp; &nbsp; 
                                 <asp:RadioButton ID="EPSSI" runat="server" GroupName="EPS" Text="Si"/>                              
                                
                                 <asp:RadioButton ID="EPSNO" runat="server" GroupName="EPS" Text="No" Checked="True"/>
                             </div>

                               <div class="col-md-12">
                                  Remitido a ARL
                                  &nbsp; &nbsp; 
                                 <asp:RadioButton ID="ARLSI" runat="server" GroupName="ARL" Text="Si"/>                              
                                 
                                 <asp:RadioButton ID="ARLNO" runat="server" GroupName="ARL" Text="No" Checked="True"/>
                             </div>
                             </div>
                          </div>

                         <div class="col-md-8">
                             <div class="row">
                                     <div class="col-md-6">                                          
                                          <asp:CheckBox ID="chkAutocuidado" runat="server"  Text="Autocuidado"/>                                                                                                                  
                                     </div>
                                     <div class="col-md-6">                                          
                                          <asp:CheckBox ID="chkRecomendaciones" runat="server" Text="Seguir Recomendaciones de S.I"/> 
                                    </div>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="chkEPP" runat="server" Text="Uso de EPP"/> 
                                    </div>
                                 <div class="col-md-6">
                                        <asp:CheckBox ID="chkPausasActivas" runat="server" Text="Pausas Activas"/> 
                                    </div>
                                 <div class="col-md-6">
                                        <asp:CheckBox ID="chkHigienePostural" runat="server" Text="Higiene Postural"/> 
                                    </div>
                                 <div class="col-md-6">
                                        <asp:CheckBox ID="chkEstiloVidaSaludable" runat="server" Text="Estilo de Vida Saludable"/> 
                                    </div>
                             </div>
                     </div>
                 </div>
             
         </div>
</div>
       

         <%-- SEPTIMO PANEL --%><%-- FINAL DE SEPTIMO PANEL --%>

         <div class="panel panel-primary">
             <div class="panel panel-footer">  <h5><center>EXAMENES REALIZADOS</center></h5></div>
                 <div class="panel-body">
                     <div class="row">

                         <div class="col-md-3">                              
                              <asp:CheckBox ID="chkAudiometria" runat="server" Text="Audiometria"/>                               
                         </div>

                          <div class="col-md-3">                              
                              <asp:CheckBox ID="chkOptometria" runat="server" Text="Otometria"/>                               
                         </div>

                          <div class="col-md-3">                              
                              <asp:CheckBox ID="chkEspirometria" runat="server" Text="Espirometria"/>                               
                         </div>

                          <div class="col-md-3">                              
                              <asp:CheckBox ID="chkVisiometria" runat="server" Text="Visiometria"/>                              
                         </div>
      
                         <div class="col-md-3">                              
                              <asp:CheckBox ID="chkTSH" runat="server" Text="TSH" />                              
                         </div>

                         <div class="col-md-3">                              
                              <asp:CheckBox ID="chkElectrocardiograma" runat="server" Text="Electrocardiograma"/>                              
                         </div>

                         <div class="col-md-3">                              
                              <asp:CheckBox ID="chkHemograma" runat="server" Text="Hemograma"/>                              
                         </div>

                         <div class="col-md-3">                              
                              <asp:CheckBox ID="chkGlicemia" runat="server" Text="Glicemia"/>                              
                         </div>

                     </div><%-- SEPTIMO PANEL --%>
                     

                 </div>            
         </div>

         <%-- FINAL DE SEPTIMO PANEL --%>

          <%-- SEPTIMO PANEL --%>

         <div class="panel panel-primary">
             <div class="panel panel-footer"><h5><center>OBSERVACIONES</center></h5>  </div>
                 <div class="panel-body">
                     <div class="row" style="margin-top:0em">
                         <asp:TextBox ID="txtObservaciones" runat="server" CssClass="form-control" TextMode="MultiLine" style="resize:none" placeHolder="Observaciones..." BackColor="#DBDAD5" BorderStyle="Solid" Height="250px" Rows="7" Width="100%"></asp:TextBox>    
                         
                         <br />

                         FIRMA Y SELLO MEDICO  &nbsp; &nbsp; &nbsp; &nbsp; 
                                               &nbsp; &nbsp; &nbsp; &nbsp; _____________________________ <br /><br />
                         No. LIC EPS SO        &nbsp; &nbsp; &nbsp; &nbsp;
                                               &nbsp; 
                                               &nbsp; &nbsp; &nbsp; &nbsp;
                                               &nbsp; &nbsp; &nbsp; &nbsp;
                                               &nbsp; &nbsp; &nbsp; &nbsp; _____________________________ <br /><br />
                         No. Registro Medico   &nbsp; &nbsp; &nbsp; &nbsp;
                                               &nbsp; &nbsp; &nbsp; &nbsp;
                                                
                                               &nbsp; &nbsp; &nbsp; &nbsp; _____________________________<br /><br />
                     </div>

                 </div>

            
         </div>

         <%-- FINAL DE SEPTIMO PANEL --%>

    </div>

    <div class="row" style="margin-top:2em">
        <div>
            <center>
                <asp:Button ID="btnGenerar" runat="server" Text="Generar" CssClass="btn btn-primary" OnClick="btnGenerar_Click"></asp:Button>
            </center>
        </div>
    </div>
</asp:Content>
