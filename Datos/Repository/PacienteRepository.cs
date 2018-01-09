using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Datos.Repository
{
    public static class PacienteRepository
    {
        static Datos.Entities.ServicioMedicoEntities db = new Entities.ServicioMedicoEntities();


        /// <summary>
        /// Inserta un nuevo paciente y retorna el Paciente_Id
        /// </summary>
        /// <param name="paciente"></param>
        /// <returns></returns>
        public static int? InsertarPaciente(Datos.Entities.Paciente paciente)
        {
            try
            {                             
                db.Paciente.Add(paciente);
                db.SaveChanges();

                return paciente.Paciente_Id;
            }
            catch (Exception ex)
            {
                return null;
                throw;
            }

        }

    }
}
