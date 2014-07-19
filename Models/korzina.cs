using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SLTest.Models
{
    public class korzina
    {
        public struct zakaz {public int drink; public int opt;
            public zakaz(int d, int o)
                {
                    drink = d; opt = o;
                }
        }
        public Dictionary<zakaz, int> diZakaz;

        public korzina(Dictionary<zakaz, int> parZakaz)
        {
            diZakaz = parZakaz;
        }

        

    }
}