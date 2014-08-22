using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SLTest.Service;
using SLTest.Service.Factory;

namespace SLTest.Models
{
    public class itCart
    {
            public int drink;
            public int opt;
            RecipeEntityService rs;
            OptionsEntityService os;
            public itCart(int d, int o)
            {
                drink = d; opt = o;
                rs = (RecipeEntityService)RecipeServiceFactory.Create();
                os = (OptionsEntityService)OptionsServiceFactory.Create();
            }

            public string drinkName()
            {
                return rs.Get(drink).RecName;
            }
            public string optName()
            {
                if (opt != 0)
                    return os.Get(opt).OptionName;
                else
                    return "";
            }
            public decimal drinkPrice()
            {
                return rs.Get(drink).Price;
            }
            public decimal optPrice()
            {
                if (opt != 0)
                    return os.Get(opt).Price;
                else
                    return  0;
            }

        public class itCartComparer : IEqualityComparer<itCart>
        {

            public bool Equals(itCart x, itCart y)
            {
                return x.drink == y.drink && x.opt == y.opt;
            }
            public int GetHashCode(itCart x)
            { return x.drink ^ x.opt; }
        }
    }



        
}