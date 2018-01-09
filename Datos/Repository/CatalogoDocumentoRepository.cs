using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Repository
{
    public static class CatalogoDocumentoRepository
    {
        static Datos.Entities.ServicioMedicoEntities db = new Entities.ServicioMedicoEntities();


        /// <summary>
        /// Retorna la Url de la plantilla del documento
        /// </summary>
        /// <returns></returns>
        public static Datos.Entities.CatalogoDocumento GetCatalogoDocumento()
        {
            try
            {
                var x = (from i in db.CatalogoDocumento
                         select i).First();

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
