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
            shipTo obj = new shipTo();
            TryUpdateModel(obj, fc);
            if (ModelState.IsValid)
            {
                Console.WriteLine(obj.PSystem);
                Console.WriteLine(obj.formOfP);
            }

            return View("Success");
        }
    }//---------public class OrderController : Controller

}
