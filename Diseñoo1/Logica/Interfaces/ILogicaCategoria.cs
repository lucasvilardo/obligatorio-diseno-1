using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logica
{
    public interface ILogicaCategoria
    {
        EC.Categoria Buscar(string codCli);
        List<EC.Categoria> ListarCategorias();
    }
}
