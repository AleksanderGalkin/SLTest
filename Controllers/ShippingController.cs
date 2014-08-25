using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;

namespace SLTest.Controllers
{
    public class ShippingController : Controller
    {
        //
        // GET: /Shipping/

        public ActionResult pvIndex()
        {
            
            shipTo st = new shipTo(Session["sKorzina"] as Dictionary<itCart,int>);
            return View(st);
        }
        [HttpPost]
        public ActionResult pvCashOrCart()
        {

            return View();
        }
    }
}
