using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Persistencia
{
    public class PFabrica
    {

        public static IPersistenciaUsuario GetPUsuario()
        {
            return (PUsuario.GetInstancia()); 
        }

        public static IPersistenciaCategoria GetPCategoria()
        {
            return (PCategoria.GetInstancia());
        }

        public static IPersistenciaComun GetPComun()
        {
            return (PMComun.GetInstancia());
        }

        public static IPersistenciaPrivado GetPPrivado()
        {
            return (PMPrivado.GetInstancia());
        }

        public static IPersistenciaRecordatorio GetPRecordatorio()
        {
            return (PMRecordatorio.GetInstancia());
        }
    }
}
