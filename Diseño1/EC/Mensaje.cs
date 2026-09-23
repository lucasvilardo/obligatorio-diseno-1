using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    class Mensaje
    {
        string asunto, texto, nomUsuario;
        int numIdenti;
        DateTime fyhEnvio;

        public string Asunto
        {
            get { return asunto; }
            set
            {
                asunto = value;
            }
        }

        public string Texto
        {
            get { return texto; }
            set
            {
                texto = value;
            }
        }

        public string NomUsuario
        {
            get { return nomUsuario; }
            set
            {
                nomUsuario = value;
            }
        }
        public int NumIdenti
        {
            get { return numIdenti; }
            set
            {
                numIdenti = value;
            }
        }

        public DateTime FyhEnvio
        {
            get { return fyhEnvio; }
            set
            {
                fyhEnvio = value;
            }
        }
    }
}
