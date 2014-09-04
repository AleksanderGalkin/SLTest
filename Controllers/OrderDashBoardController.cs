using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;

namespace SLTest.Controllers
{
    public class OrderDashBoardController : Controller
    {
        coffeeEntities db = new coffeeEntities();

        public ActionResult DachBoardView()
        {
            return View();
        }
        public ActionResult pvIndex()
        {
            var obj = from i in db.shipTo
                       orderby i.OrderDateTime descending
                       select i;
            return View(obj);
        }

    }
}
