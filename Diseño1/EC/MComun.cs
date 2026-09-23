using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EC
{
    class MComun : Mensaje
    {
        Categoria unaCate;

        public Categoria UnaCate
        {
            get { return unaCate; }
            set
            {
                unaCate = value;
            }
        }
    }
}
