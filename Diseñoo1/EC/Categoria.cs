using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace EC
{
    public class Categoria
    {
        string codCat, nomCat;

        public string CodCat
        {
            get { return codCat; }
            set
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(value, "[a-zA-Z]{3}"))
                    codCat = value;
                else
                    throw new Exception("El código de la categoría debe ser de 3 Letras.");
            }
        }

        public string NomCat
        {
            get { return nomCat; }
            set
            {
                if (value == null || value.Length > 30)
                    throw new Exception("La Categoría debe tener un nombre.");
                nomCat = value;
            }
        }

        public Categoria(string pcodCat, string pnomCat)
        {
            CodCat = pcodCat;
            NomCat = pnomCat;
        }
    }
}
