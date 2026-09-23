using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public interface IPersistenciaComun
    {
        void AltaMComun(EC.MComun unMCom);
        List<EC.MComun> ListarComun();
        List<EC.MComun> ListadoBandejaEntrCom(EC.Usuario unUsu);
        List<EC.MComun> ListadoBandejaSalCom(EC.Usuario unUsu);
    }
}
