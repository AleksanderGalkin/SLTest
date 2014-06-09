using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SLTest.Models
{

    public class SearchTerm<T>
        where T:class,new()
    {
        public struct stItemStru { public bool cbItem; public string nmItem; }
    
        public IEnumerable<T> model;
    
        public string stDescr;
        public string stField;
        public List<stItemStru> stList;
        public  SearchTerm(IEnumerable<T> m,string f,string d)
        {
            model = m;
            stField = f;
            stDescr = d;
            var stL = from l in model
                     group l by l.GetType().GetProperty(stField);
        }
        public IEnumerable<T> GetFiltered()
        {
            var r=from a in model
                  join it in stList
                  on a.GetType().GetProperty(stField).GetValue(a,null).ToString() equals it.nmItem
                  where it.cbItem
                  select a;
            return r;
        }

    }
    public class Navigator
    {
    }
}