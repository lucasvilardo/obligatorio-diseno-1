using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public class FabricaLogica
    {

        public static ILogicaUsuario GetLogicaUsuario()
        {
            return (LUsuario.GetInstancia());
        }

        public static ILogicaMensaje GetLogicaMensaje()
        {
            return (LMensaje.GetInstancia());
        }
        public static ILogicaCategoria GetLogicaCategoria()
        {
            return (LCategoria.GetInstancia());
        }

    }
}
