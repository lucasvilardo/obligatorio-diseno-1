using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistencia
{
    public interface IPersistenciaCategoria
    {
        EC.Categoria Buscar(string codCli);
        List<EC.Categoria> ListarCategorias();
    }
}
