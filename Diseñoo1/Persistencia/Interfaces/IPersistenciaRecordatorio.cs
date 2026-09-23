using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public interface IPersistenciaRecordatorio
    {
        void AltaMRecordatorio(EC.MRecordatorio unMRec);
        List<EC.MRecordatorio> ListarRecordatorio();
        List<EC.MRecordatorio> ListadoBandejaEntrRec(EC.Usuario unUsu);
        List<EC.MRecordatorio> ListadoBandejaSalRec(EC.Usuario unUsu);
    }
}
