using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using SLTest.Models.Interface;

namespace SLTest.Models
{


    public class NaviModel<K>
        where K : class,new()
    {
        public IEnumerable<K> items;

    }

    public class SearchTerm<T>
        where T : class, new()
        
    {
        public struct stItemStru { public bool cbItem; public string nmItem; }// структура с критерием 
        public List<stItemStru> stList;// список критериев для данной модели
        public IEnumerable<T> model; //модель
    
        public string stDescr;
        public string stField;

        public SearchTerm(IEnumerable<T> m, string f, string d)
        {
            model = m;
            stField = f;
            stDescr = d;
            stList = new List<stItemStru>();
            var stL = from l in model    
                     group l by l.GetType().GetProperty(stField).GetValue(l,null).ToString();
            foreach (var i in stL)
                stList.Add(new stItemStru { cbItem = false,
                                            nmItem = i.Key.ToString() });
                
            
        }
        public List<stItemStru> GetContent()
        {
            var r = (from a in stList
                    select a).ToList();
            return r;
        }
        

        public IEnumerable<T> GetFiltered()
        {
            var r = from a in model 
                  join it in stList
                  on a.GetType().GetProperty(stField).GetValue(a,null).ToString() equals it.nmItem.ToString()
                  where !it.cbItem
                  select a;
            return r;
        }

    }
    public class Navigator<T>
    where T : class, new()
    {
        public string test{get;set;}
        public List<string> tl;
        public List<SearchTerm<T>> list;
        public Navigator()
        {
            list = new List<SearchTerm<T>>();
            tl = new List<string>();
            tl.Add("раз");
            tl.Add("два");
            tl.Add("три");
        }

        public void Add(SearchTerm<T> st)
        {
            list.Add(st);
            
        }
        public void Add(IEnumerable<T> m, string f, string d)
        {

            list.Add(new SearchTerm<T> ( m ,f,d));

        }

    }
}