using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    public class MPrivado : Mensaje
    {
        DateTime fechaCaducidad;

        public DateTime FechaCaducidad
        {
            get { return fechaCaducidad; }
            set
            {
                fechaCaducidad = value;
            }
        }

        public MPrivado(string pasunto, string ptexto, int pnumIdenti, DateTime pfyhEnvio, Usuario punUsuario, List<Usuario> pcolUsu, DateTime pfechaCaducidad)
            : base(pasunto, ptexto, pnumIdenti, pfyhEnvio, punUsuario, pcolUsu)
        {
            FechaCaducidad = pfechaCaducidad;
        }
    }
}
