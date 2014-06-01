using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;

namespace SLTest.Controllers
{
    
    public class TestController : Controller
    {
        private coffeeEntities db = new coffeeEntities();

        public ActionResult Index()
        {
            var order = (from o in db.Order
                           join or in db.OrderRecipe
                           on o.OrderID equals or.OrderID
                           join oo in db.OrderOptions
                           on o.OrderID equals oo.OrderID
                           join op in db.Options
                           on oo.OptID equals op.OptID
                           join re in db.Recipe
                           on or.RecID equals re.RecID
                           select new VMOrder { OrderID = o.OrderID,
                               ClientID=o.ClientID,
                               NumTable=o.NumTable,
                               OrderDataTime=o.OrderDateTime,
                               Comment=o.Comment,
                               OrderRecID=or.OrderRecID,
                               RecID = or.RecID,
                               RecName=re.RecName,
                               OrderOptID=oo.OrderOptID,
                               OptID=oo.OptID,
                               OptionName=op.OptionName
                           }).ToList();
                
            return View(order);
        }

        //
        // GET: /Test/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Test/Create

        public ActionResult Create()
        {
            var recipe = new VMOrder();
            return View(recipe);
        } 

        //
        // POST: /Test/Create

        [HttpPost]
        public ActionResult Create(VMOrder recipe)
        {
            try
            {
                if (ModelState.IsValid)
                {
                   var orr=new OrderRecipe();
                    orr.OrderID=recipe.OrderID;
                    orr.RecID=recipe.RecID;
                    db.AddToOrderRecipe(orr);
                    db.SaveChanges();
               
                    return RedirectToAction("Index");
                }

                
            }
            catch(Exception ex)
            {
                ModelState.AddModelError(string.Empty, ex);
                
            }
            return View(recipe);
        }
        
        //
        // GET: /Test/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Test/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Test/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Test/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
