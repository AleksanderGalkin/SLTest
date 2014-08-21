using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SLTest.Models
{
    public class itCart
    {
            public int drink;
            public int opt;
            public itCart(int d, int o)
            {
                drink = d; opt = o;
            }
        
        public Dictionary<itCart, int>  getDictionary ()
        {
            Dictionary<itCart, int> d=new Dictionary <itCart, int>();
            d.Add(this,1);
            return d;
        }
        
    }


    #region oldRealization
    //public class korzina
    //{
    //    public struct zakaz {
    //        public int drink;
    //        public int opt;
    //        public zakaz(int d, int o)
    //            {
    //                drink = d; opt = o;
    //            }
    //    }
    //    public Dictionary<zakaz, int> diZakaz;

    //    public korzina(Dictionary<zakaz, int> parZakaz)
    //    {
    //        diZakaz = parZakaz;
    //    }



    //}
    #endregion
}