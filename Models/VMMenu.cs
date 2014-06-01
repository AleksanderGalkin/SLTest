using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Web.Mvc;

namespace SLTest.Models
{
    public class VMMenuItems
    {
        public bool cb { get; set; }
        public Int64 RecID { get; set; }
        public string RecName { get; set; }
        public Decimal Price { get; set; }
        public Int64 OptID { get; set; }
        public static IEnumerable<Options> spr;

        public IEnumerable<Options> GetSprOpt()
        {
            var sprOpt = (from s in spr
                         orderby s.OptionName
                         where s.Recipe.RecID == RecID
                         select s);

            return sprOpt;
        }
        //public SelectList GetSprList(IEnumerable<Options> i)
        //{
        //    var sprList=new SelectList(i, "OptID", "OptionName");
        //    return sprList;
        //}
   
    }
    public class VMMenu<T>
        where T:class,new()
    {
        public IEnumerable<T> items;

        public PagingInfo paginginfo;

         public  VMMenu()
        {
            paginginfo = new PagingInfo();
            
        }
       
    }
}