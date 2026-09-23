using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public interface ILogicaUsuario
    {
        EC.Usuario Logueo(string pUsu, string pPass);
        void AltaUsuario(EC.Usuario unUsu);
        void BajaUsuario(EC.Usuario unUSU);
        void ModificarContra(EC.Usuario unUsu);
        EC.Usuario Buscar(string nomUsuario);
        
        List<EC.Usuario> ListadoUsuariosAct();
    }
}
