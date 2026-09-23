using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    public class MRecordatorio : Mensaje
    {
        string tipoRecordatorio;

        public string TipoRecordatorio
        {
            get { return tipoRecordatorio; }
            set
            {
                if (value != "Laboral" && value != "Estudio" && value != "Personal")
                    throw new Exception("Solo puede haber 3 tipos de Mensajes de Recordatorio: 'Laboral', 'Estudio' o 'Personal'");
                else
                    tipoRecordatorio = value;
            }
        }

        public MRecordatorio(string pasunto, string ptexto, int pnumIdenti, DateTime pfyhEnvio, Usuario punUsuario, List<Usuario> pcolUsu, string ptipoRecordatorio)
            : base(pasunto, ptexto, pnumIdenti, pfyhEnvio, punUsuario, pcolUsu)
        {
            TipoRecordatorio = ptipoRecordatorio;
        }
    }
}
