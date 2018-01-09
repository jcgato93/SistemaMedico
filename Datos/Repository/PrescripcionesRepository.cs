using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos.Repository
{
    public static class PrescripcionesRepository
    {
        static Datos.Entities.ServicioMedicoEntities db = new Entities.ServicioMedicoEntities();


        /// <summary>
        /// Retorna el numero de prescripciones que 
        /// llena la consulta segun el Consulta_Id
        /// </summary>
        /// <param name="consultaId"></param>
        /// <returns></returns>
        public static int? numeroPrescripcionesDeConsulta(int consultaId)
        {
            try
            {
                var x = (from i in db.Prescripciones
                         where i.Consultas_Id == consultaId
                         select i).Count();

                return x;

            }
            catch (Exception ex)
            {
                return null;
                throw;
            }

        }


        /// <summary>
        /// Inserta una Prescripcion
        /// </summary>
        /// <param name="prescripcion"></param>
        /// <returns></returns>
        public static int? InsertarPrescripcion(Datos.Entities.Prescripciones prescripcion)
        {
            try
            {

                db.Prescripciones.Add(prescripcion);
                int? result= db.SaveChanges();

                return result;
            }
            catch (Exception ex)
            {
                return null;
                throw;
            }


        }

    }
}
