using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    class MPrivado : Mensaje
    {
        DateTime fechaCaducidad;

        public DateTime FechaCaducidad
        {
            get { return fechaCaducidad; }
            set
            {
                fechaCaducidad = value;
            }
        }
    }
}
