using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    public class Mensaje
    {
        string asunto, texto;
        int numIdenti;
        DateTime fyhEnvio;
        Usuario unUsuario;
        List<Usuario> colUsu;

        public string Asunto
        {
            get { return asunto; }
            set
            {
                if (value.Length > 80)
                    throw new Exception("El asunto debe ser menor a 80 caracteres.");
                asunto = value;
            }
        }

        public string Texto
        {
            get { return texto; }
            set
            {
                if (value.Length > 8000)
                    throw new Exception("El texto no puede estar vacío.");
                texto = value;
            }
        }

        public Usuario UnUsuario
        {
            get { return unUsuario; }
            set
            {
                if (value == null)
                    throw new Exception("El mensaje debe tener un Usuario asociado.");
                unUsuario = value;
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

        public List<Usuario> ColUsu
        {
            get { return colUsu; }
            set
            {
                if (value == null)
                    throw new Exception("No puede ser nula la colección de usuarios.");
                
                if (value.Count == 0)
                    throw new Exception("La colección de usuarios no puede ser 0");

                colUsu = value;
            }
        }



        public Mensaje(string pasunto, string ptexto, int pnumIdenti, DateTime pfyhEnvio, Usuario punUsuario, List<Usuario> pcolUsu)
        {
            Asunto = pasunto;
            Texto = ptexto;
            NumIdenti = pnumIdenti;
            FyhEnvio = pfyhEnvio;
            UnUsuario = punUsuario;
            ColUsu = pcolUsu;
        }
    }
}
