using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaMedico.Views
{
    public partial class DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }

        }

        protected void gridLeads_SelectedIndexChanged(object sender, EventArgs e)
        {
            string consultaId = gridConsultas.SelectedRow.Cells[1].Text;

            Response.Redirect("InformacionPaciente.aspx?id=" + consultaId);
        }



        protected void gridLeads_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gridConsultas.PageIndex = e.NewPageIndex;
                BindGrid();
            }
            catch (Exception)
            {
                Session.Abandon();
                Response.Redirect("DashBoard.aspx");

            }
        }


        //================METODOS==========================


        public void BindGrid()
        {
            Datos.Repository.ConsultasRepository.LlenarGridConsultas(ref gridConsultas);
        }


    }
}