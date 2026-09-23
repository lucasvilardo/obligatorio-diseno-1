using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public interface IPersistenciaUsuario
    {

        EC.Usuario Logueo(string Usu, string Contra);
        void AltaUsuario(EC.Usuario usuario);
        void BajaUsuario(EC.Usuario unUsuario);
        void ModificarContra(EC.Usuario unUsu);
        EC.Usuario Buscar(string nomUsuario);
        List<EC.Usuario> ListadoUsuariosAct();
    }
}
