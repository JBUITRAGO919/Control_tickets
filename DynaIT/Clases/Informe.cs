using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DynaIT.Clases
{
    public class Informe
    {
        public int id_usuario { get; set; }
        public string nombre_usuario { get; set; }
        public int n_casos_inicio_jornada { get; set; }
        public int n_ticket_nuevos_dia { get; set; }
        public int n_ticket_Resueltos_hoy { get; set; }
        public int n_ticket_cerrados_hoy { get; set; }
        public int n_ticket_nuevos_cierre_jornada { get; set; }
        public int n_creditos_hoy { get; set; }
        public int n_ticket_desarrollo { get; set; }
        public int n_ticket_proyecto { get; set; }
           
    }
}