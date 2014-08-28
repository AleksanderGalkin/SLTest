using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Service;
using SLTest.Service.Factory;
using System.ComponentModel.DataAnnotations;

namespace SLTest.Models
{
    public partial class itCart
    {
            //public int ID { get; set;}
            //public int shipToID { get; set; }
            
            //public int drink{get;set;}
            //public int opt {get; set;}
        private RecipeEntityService rs;
        private OptionsEntityService os;

            //public virtual shipTo ShipTo { get; set; }
        public itCart()
        {
            drink = 0; opt = null;
            rs = (RecipeEntityService)RecipeServiceFactory.Create();
            os = (OptionsEntityService)OptionsServiceFactory.Create();
        }
        public itCart(int d, int? o)
        {
            drink = d; opt = o;
            rs = (RecipeEntityService)RecipeServiceFactory.Create();
            os = (OptionsEntityService)OptionsServiceFactory.Create();
        }

            public string drinkName()
            {
                return rs.Get((int)drink).RecName;
            }
            public string optName()
            {
                if (opt != null)
                    return os.Get((int)opt).OptionName;
                else
                    return "";
            }
            public decimal drinkPrice()
            {
                return rs.Get((int)drink).Price;
            }
            public decimal optPrice()
            {
                if (opt != null)
                    return os.Get((int)opt).Price;
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
                { return (int)(x.drink ^ (x.opt==null?0:x.opt)); }
            }
    }



        [MetadataType(typeof(shipToValidation))]
           public partial class shipTo // оформление заказа
    {
           // public enum tPay{ Наличные, Карта } ;
           // public tPay typeOfPay { get; set; }
            [Bind(Exclude = "ID")]
            public class shipToValidation
            {
                
                public Int64 ID { get; set; }
                [Display(Name="Номер столика",Prompt = "Посмотрте на табличке", Description = "Номер столика за которым сидите")]
                [Required(ErrorMessage="Надо заполнить, а не то заказ уйдёт на другой столик")]
                [Range(1, 12, ErrorMessage = "Надо правильно заполнить, а не то заказ уйдёт на другой столик")]
                public int? tableNum { get; set; }
                public DateTime OrderDateTime { get; set; }
                [Display(Name="Комментарий")]
                [DisplayFormat(ConvertEmptyStringToNull = false)]
                [StringLength(50)]
                public string comment { get; set; }
                [Display(Name = "Способ оплаты")]
                public int formOfP { get; set; }
               // public Dictionary<itCart, int> Cart;
                [Display(Name = "Счёт сразу")]
                public bool flImmediateBill{ get; set; }
  
            }
            public shipTo()
            {
                formOfP = 1;
                flImmediateBill = false;
                OrderDateTime = DateTime.Now;
            }

            
    }


}