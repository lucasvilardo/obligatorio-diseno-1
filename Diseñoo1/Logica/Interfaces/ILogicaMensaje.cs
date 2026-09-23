using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public interface ILogicaMensaje
    {
        void AltaMensaje(EC.Mensaje unMen);
        
        List<EC.Mensaje> ListarTodos();
        
        List<EC.Mensaje> ListadoBandejaEntr(EC.Usuario unUsu);
        
        List<EC.Mensaje> ListadoBandejaSal(EC.Usuario unUsu);
        


    }
    
}
