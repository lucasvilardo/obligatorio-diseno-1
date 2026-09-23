using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using Persistencia;


namespace Logica
{
    internal class LUsuario : ILogicaUsuario
    {
        private static LUsuario _instancia = null;
        private LUsuario() { }
        public static LUsuario GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LUsuario();
            return _instancia;
        }

        public Usuario Logueo(string pUsu, string pContra)
        {
            return PFabrica.GetPUsuario().Logueo(pUsu, pContra);
        }

        public void AltaUsuario(Usuario unUsu)
        {
            PFabrica.GetPUsuario().AltaUsuario(unUsu);
        }

        public void BajaUsuario(Usuario unUsu)
        {
            PFabrica.GetPUsuario().BajaUsuario(unUsu);
        }

        public void ModificarContra(Usuario unUsu)
        {
            PFabrica.GetPUsuario().ModificarContra(unUsu);
        }

        public EC.Usuario Buscar(string nomUsuario)
        {
            return PFabrica.GetPUsuario().Buscar(nomUsuario);
        }

        
        public List<EC.Usuario> ListadoUsuariosAct()
        {
            return PFabrica.GetPUsuario().ListadoUsuariosAct();
        }


    }
}
