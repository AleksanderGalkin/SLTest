using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;

namespace SLTest.Controllers
{
    public class OrderController : Controller
    {
        private coffeeEntities db = new coffeeEntities();
        [Authorize]
        public ActionResult Index(string parUser)
        {
            var v_order = (from i in db.shipTo
                           where i.userName == parUser
                           orderby i.OrderDateTime descending
                           select i).ToList();
            return View(v_order);
        }
        public ActionResult Detail(int id)
        {
            var v_order = (from i in db.shipTo
                           where i.ID == id
                           select i).FirstOrDefault();

            return View(v_order);
        }

        public ActionResult Payment(int id)
        {
            var t = (from i in db.formOfP select i).ToList();
            ViewBag.stList = t;

            var v_order = (from i in db.shipTo
                           where i.ID == id
                           select i).FirstOrDefault();
            return View(v_order);
        }
        [HttpPost]
        public ActionResult Payment([Bind(Exclude="tableNum")] FormCollection fc)
        {
            shipTo2 obj = new shipTo2();
            TryUpdateModel(obj, fc);
            if (ModelState.IsValid)
            {
                obj.dtPaid = DateTime.Now;
                obj.flPaid = true;
                return View("Success");
            }
            else
            {
                var t = (from i in db.formOfP select i).ToList();
                ViewBag.stList = t;
                return View(obj);
            }

            
        }
    }//---------public class OrderController : Controller

}
