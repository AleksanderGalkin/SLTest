using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SLTest.Service;
using SLTest.Service.Factory;
using System.ComponentModel.DataAnnotations;

namespace SLTest.Models
{
    public class itCart
    {
            public int drink{get;set;}
            public int opt {get; set;}
            private RecipeEntityService rs;
            private OptionsEntityService os;
            public itCart()
            {
                drink = 0; opt = 0;
                rs = (RecipeEntityService)RecipeServiceFactory.Create();
                os = (OptionsEntityService)OptionsServiceFactory.Create();
            }
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

    
    public class shipTo // оформление заказа
    {
        public enum tPay { Наличные, Карта } ;
        [Display(Name="Номер столика",Prompt = "Посмотрте на табличке", Description = "Номер столика за которым сидите")]
        [Required(ErrorMessage="Надо заполнить, а не то заказ уйдёт на другой столик")]
        [Range(1, 12, ErrorMessage = "Надо правильно заполнить, а не то заказ уйдёт на другой столик")]
        public int? table { get; set; }
        public DateTime OrderDataTime { get; set; }
        [Display(Name="Комментарий")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        [StringLength(50)]
        public string Comment { get; set; }
        [Display(Name = "Способ оплаты")]
        public tPay typeOfPay { get; set; }
        public Dictionary<itCart, int> Cart;
        [Display(Name = "Счёт сразу")]
        public bool flImmediateBill{ get; set; }
        public shipTo( Dictionary<itCart, int> pCart)
        {
            Cart = pCart;
            typeOfPay = tPay.Наличные;
            flImmediateBill = false;
        }
    }

    public class MyAdditionalViewData
    {
        public string @class { get; set; }

        public string Sound { get; set; }
    }     
}