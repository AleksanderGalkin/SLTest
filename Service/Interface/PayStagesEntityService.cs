using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SLTest.Service.Interface;
using SLTest.Models;

namespace SLTest.Service
{
    public class PayEntityService : IBaseService<PayStages>
    {
        coffeeEntities db = new coffeeEntities();
        public IEnumerable<PayStages> Get()
        {
            IEnumerable<PayStages> obj = from a in db.PayStages select a;
            return obj;
        }
        public PayStages Get(int id)
        {
            PayStages obj = (from a in db.PayStages where a.ID == id select a).SingleOrDefault();
            return obj;
        }
        public IEnumerable<PayStages> GetToPage(int page, int itemsToPage)
        {
            IEnumerable<PayStages> obj = (from a in db.PayStages orderby a.Descr select a).Skip((page - 1) * itemsToPage).Take(itemsToPage);
            return obj;
        }
        public void Create(PayStages obj)
        {
            db.AddToPayStages(obj);
            db.SaveChanges();
        }
        public void Edit(PayStages obj)
        {
            
            db.SaveChanges();
        }
        public void Delete(PayStages obj)
        {
            db.DeleteObject(obj);
            db.SaveChanges();
        }
        public int Count()
        {
            int cnt = (from a in db.PayStages select a).Count();
            return cnt;
        }
        public String IdField
        {
            get
            {
                return "ID";
            }
        }
        public String NameField
        {
            get
            {
                return "Descr";
            }
        }
    }
}