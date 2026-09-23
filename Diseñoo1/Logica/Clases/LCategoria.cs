using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EC;
using Persistencia;

namespace Logica
{
    internal class LCategoria : ILogicaCategoria
    {
        private static LCategoria _instancia = null;
        private LCategoria() { }
        public static LCategoria GetInstancia()
        {
            if (_instancia == null)
                _instancia = new LCategoria();
            return _instancia;
        }
        public Categoria Buscar(string codCat)
        {
            return PFabrica.GetPCategoria().Buscar(codCat);
        }
        public List<Categoria> ListarCategorias()
        {
            return PFabrica.GetPCategoria().ListarCategorias();
        }

    }
}
