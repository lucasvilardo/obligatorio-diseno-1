using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public interface IPersistenciaPrivado
    {
        void AltaMPrivado(EC.MPrivado unMCom);
        List<EC.MPrivado> ListarPrivado();
        List<EC.MPrivado> ListadoBandejaEntrPriv(EC.Usuario unUsu);
        List<EC.MPrivado> ListadoBandejaSalPriv(EC.Usuario unUsu);
    }
}
