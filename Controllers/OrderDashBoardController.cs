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
        public ActionResult changeStage(int? id=null,string nextStageID="",int typeOfStage=0)
        {

            var obj = (from i in db.shipTo
                      where i.ID==id
                      select i).FirstOrDefault();
            int orderStageID = (from i in db.OrderStages
                               where i.Style.Contains(nextStageID)
                               select i.ID).FirstOrDefault();
            if (typeOfStage == 1)
                obj.setOState(nextStageID, User.Identity.Name);
            if (typeOfStage == 2)
                obj.setPState(nextStageID, User.Identity.Name);
            return RedirectToAction("pvIndex");
        }
    }
}
