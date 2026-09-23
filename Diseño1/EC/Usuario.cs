using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    class Usuario
    {
        string nomUsuario, mail, nomCompleto, contraseña;
        DateTime fechaNacimiento;

        public string NomUsuario
        {
            get { return nomUsuario; }
            set
            {
                nomUsuario = value;
            }
        }

        public string Mail
        {
            get { return mail; }
            set
            {
                mail = value;
            }
        }

        public string NomCompleto
        {
            get { return nomCompleto; }
            set
            {
                nomCompleto = value;
            }
        }

        public string Contraseña
        {
            get { return contraseña; }
            set
            {
                contraseña = value;
            }
        }
        public DateTime FechaNacimiento
        {
            get { return fechaNacimiento; }
            set
            {
                fechaNacimiento = value;
            }
        }
    }
}
