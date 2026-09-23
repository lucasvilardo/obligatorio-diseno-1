using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    public class MComun : Mensaje
    {
        Categoria unaCate;

        public Categoria UnaCate
        {
            get { return unaCate; }
            set
            {
                if (value == null)
                    throw new Exception("El mensaje común debe tener una Categoría asociada.");
                unaCate = value;
            }
        }

        public MComun(string pasunto, string ptexto, int pnumIdenti, DateTime pfyhEnvio, Usuario punUsuario, List<Usuario> pcolUsu, Categoria punaCate)
            : base( pasunto,  ptexto,  pnumIdenti,  pfyhEnvio,  punUsuario, pcolUsu)
        {
            UnaCate = punaCate;
        }
    }
}
