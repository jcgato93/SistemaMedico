//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Datos.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Prescripciones
    {
        public int Prescripciones_Id { get; set; }
        public Nullable<int> Consultas_Id { get; set; }
        public string Nombre_Documento { get; set; }
        public string Url_Documento { get; set; }
        public string fecha_Generado { get; set; }
        public string Json_Consulta { get; set; }
    
        public virtual Consultas Consultas { get; set; }
    }
}