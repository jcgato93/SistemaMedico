using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Datos.Repository
{
    

    public static class EPSRepository
    {
        static Datos.Entities.ServicioMedicoEntities db = new Entities.ServicioMedicoEntities();



        /// <summary>
        /// Llena un DropDownList con el listado de las EPS
        /// </summary>
        /// <param name="ddl"></param>
        public static void llenarDropDownConEPS(ref DropDownList ddl)
        {
            try
            {
                var data = (from i in db.EPS
                            select new
                            {
                                text=i.Nombre_EPS,
                                value=i.EPS_Id

                            }).ToList();

                ddl.DataSource = data;
                ddl.DataTextField = "text";
                ddl.DataValueField = "value";
                ddl.DataBind();

                ddl.Items.Insert(0, new ListItem("Seleccione EPS", "-1"));

            }
            catch (Exception ex)
            {

                throw;
            }
        }


    }
}
