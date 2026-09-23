using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace EC
{
    public class Usuario
    {
        string nomUsuario, mail, nomCompleto, contraseña;
        DateTime fechaNacimiento;
        

        public string NomUsuario
        {
            get { return nomUsuario; }
            set
            {
                if (value.Length >= 8)
                    nomUsuario = value;
                else
                    throw new Exception("El nombre de Usuario debe ser de mínimo 8 letras.");
            }
        }

        public string Mail
        {
            get { return mail; }
            set
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(value, "[a-zA-Z0-9]{3,40}[@][a-zA-Z]{3,10}[.][a-zA-Z]{3,10}"))
                    mail = value;
                else
                    throw new Exception("El formato del mail es incorrecto.");
            }
        }

        public string NomCompleto
        {
            get { return nomCompleto; }
            set
            {
                if (value.Length > 30)
                    throw new Exception("Se debe ingresar el nombre completo del Usuario.");
                nomCompleto = value;
            }
        }

        public string Contraseña
        {
            get { return contraseña; }
            set
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(value.Trim(), @"^[a-zA-Z]{3}[0-9]{3}[^a-zA-Z0-9]{2}$"))
                    contraseña = value;
                else
                    throw new Exception("La contraseña debe ser de 8 caracteres con el formato correcto.");
            }
        }
        public DateTime FechaNacimiento
        {
            get { return fechaNacimiento; }
            set
            {
                if (value < DateTime.Now)
                    fechaNacimiento = value;
                else
                    throw new Exception("La fecha de nacimiento debe ser menor a la de hoy.");
            }
        }

        
        public Usuario(string pnomUsuario, string pmail, string pnomCompleto, string pcontraseña, DateTime pfechaNacimiento)
        {
            NomUsuario = pnomUsuario;
            Mail = pmail;
            NomCompleto = pnomCompleto;
            Contraseña = pcontraseña;
            FechaNacimiento = pfechaNacimiento;
        }
    }
}
