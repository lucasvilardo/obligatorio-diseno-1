using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using Persistencia;


namespace Logica
{
    internal class LMensaje : ILogicaMensaje
    {
        private static LMensaje _instancia = null;
        private LMensaje() { }
        public static LMensaje GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LMensaje();
            return _instancia;
        }

        public void AltaMensaje(EC.Mensaje unMen)
        {
            if (unMen is MComun)
            {
                PFabrica.GetPComun().AltaMComun((MComun)unMen);
            }
            else if (unMen is MPrivado)
            {
               PFabrica.GetPPrivado().AltaMPrivado((MPrivado)unMen);
            }
            else
            {
                PFabrica.GetPRecordatorio().AltaMRecordatorio((MRecordatorio)unMen);
            }
            
        }

        
        public List<Mensaje> ListarTodos()
        {
            List<Mensaje> _lista = new List<Mensaje>();
            _lista.AddRange(PFabrica.GetPComun().ListarComun());
            _lista.AddRange(PFabrica.GetPPrivado().ListarPrivado());
            _lista.AddRange(PFabrica.GetPRecordatorio().ListarRecordatorio());

            return _lista;
        }

        public List<Mensaje> ListadoBandejaEntr(Usuario unUsu)
        {
            List<Mensaje> _lista = new List<Mensaje>();
            _lista.AddRange(PFabrica.GetPComun().ListadoBandejaEntrCom(unUsu));
            _lista.AddRange(PFabrica.GetPPrivado().ListadoBandejaEntrPriv(unUsu));
            _lista.AddRange(PFabrica.GetPRecordatorio().ListadoBandejaEntrRec(unUsu));

            return _lista;
        }

        public List<Mensaje> ListadoBandejaSal(Usuario unUsu)
        {
            List<Mensaje> _lista = new List<Mensaje>();
            _lista.AddRange(PFabrica.GetPComun().ListadoBandejaSalCom(unUsu));
            _lista.AddRange(PFabrica.GetPPrivado().ListadoBandejaSalPriv(unUsu));
            _lista.AddRange(PFabrica.GetPRecordatorio().ListadoBandejaSalRec(unUsu));

            return _lista;
        }

       

       


    }
}
