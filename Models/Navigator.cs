﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using SLTest.Models.Interface;

namespace SLTest.Models
{




    public class SearchTerm<T> //Критерии фильтрации для одной модели
        where T : INavigator, new()
        
    {
        public class stItemStru { public bool cbItem; public string nmItem; }// структура с критерием 
        public List<stItemStru> stList;// список критериев для данной модели
        public IEnumerable<T> model; //модель
    
        public string stDescr;
        public string stField;

        public SearchTerm( IEnumerable<T> m, string f, string d)
        {

            model = m;
            stField = f;
            stDescr = d;
            stList = new List<stItemStru>();
            var stL = from l in model
                      group l by (l.GetType().GetProperty(stField).GetValue(l, null) ?? "Пусто").ToString();
            foreach (var i in stL)
                stList.Add(new stItemStru { cbItem = false,
                                            nmItem = i.Key.ToString() });
                
            
        }
        public List<stItemStru> GetContent()  //полностью список критериев по модели
        {
            var r = (from a in stList
                    select a).ToList();
            return r;
        }
        

        public IEnumerable<T> GetFiltered() // модель отфильтрованная по всем критериям
        {
            var cntSel = (from it in stList
                          where it.cbItem
                          select it).Count();

            if (cntSel > 0)
            {
                var r = from a in model
                        join it in stList
                        on (a.GetType().GetProperty(stField).GetValue(a, null) ?? "Пусто").ToString() equals it.nmItem.ToString()
                        where it.cbItem
                        select a;
                return r;
            }
            else
            {
                var r = from a in model
                        join it in stList
                        on (a.GetType().GetProperty(stField).GetValue(a, null) ?? "Пусто").ToString() equals it.nmItem.ToString()
                        select a;
                return r;
            }
            
        }

    }
    public class Navigator<T>
    where T :  INavigator, new()
    {
        public string test{get;set;}
        //public List<string> tl;
        public List<SearchTerm<T>> list;
        public Navigator()
        {
            list = new List<SearchTerm<T>>();
            //tl = new List<string>();
            //tl.Add("раз");
            //tl.Add("два");
            //tl.Add("три");
        }

        public void Add(SearchTerm<T> st)
        {
            list.Add(st);
            
        }
        public void Add( IEnumerable<T> m, string f, string d)
        {
            list.Add(new SearchTerm<T> (  m ,f,d));

        }

    }
}