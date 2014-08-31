using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;
using System.Reflection;
using System.Data.Objects.DataClasses;
using System.Web.UI;

namespace SLTest.Controllers
{
    
    public class ShippingController : Controller
    {
        //
        // GET: /Shipping/
        coffeeEntities db = new coffeeEntities();

        public ActionResult pvIndex()
        {
            
            
            shipTo st = new shipTo();
            var t=(from i in db.formOfP select i).ToList() ;
            ViewBag.stList = t;

            return View(st);
        }
       
        public ActionResult pvCashOrCart()
        {

            return View();
        }


        public ActionResult pvKorzina()
        {
            List<KeyValuePair<SLTest.Models.itCart, int>> a;
            a = (Session["sKorzina"] as Dictionary<itCart, int>).ToList();
            return View(a);
        }
        [HttpPost]
        [MultiButton(MatchFormKey = "sendCart", MatchFormValue = "Пересчитать")]
        public ActionResult CartSubmit(int? a)
        {
            Dictionary<itCart, int> par = new Dictionary<itCart, int>();
            TryUpdateModel(par);
            if (ModelState.IsValid)
            {
                Session["sKorzina"] = par;
                if (Request.IsAjaxRequest())
                {

                    return RedirectToAction("pvKorzina");
                }
                else
                    return RedirectToAction("Korzina", "Home");
            }
            else
            {
                return View("pvKorzina",par);
            }
        }

        [HttpPost]
        [MultiButton(MatchFormKey = "sendCart", MatchFormValue = "Оформить заказ")]
        public ActionResult CartSubmit(int? a, int? b)
        {
            Dictionary<itCart, int> par = new Dictionary<itCart, int>();
            UpdateModel(par);
            Session["sKorzina"] = par;
            return RedirectToAction("pvIndex", "Shipping");
        }

        [HttpPost]
        [Authorize]
        [MultiButton(MatchFormKey = "sendCart", MatchFormValue = "Оправить")]


        public ActionResult CartSubmit([Bind(Exclude = "flPaid,dtPaid,WaiterID")]int? a, int? b, int? с, FormCollection fc)
        {
            //shipTo par = new shipTo(Session["sKorzina"] as Dictionary<itCart, int>);
            shipTo par = new shipTo();
            TryUpdateModel(par);
            
            if (ModelState.IsValid)
            {
                
                db.AddToshipTo(par);
                db.SaveChanges();

                Dictionary<itCart, int> itCarts = Session["sKorzina"] as Dictionary<itCart, int>;
                foreach (var i in itCarts)
                {
                    i.Key.num = (short)i.Value;
                    i.Key.shipToID = par.ID;
                    db.AddToitCart(i.Key);
                    db.SaveChanges();
                }
                
                return RedirectToAction("pvCashOrCart", "Shipping");
            }
            else
            {
                var t = (from i in db.formOfP select i).ToList();
                ViewBag.stList = t;
                return View("pvIndex",par);
            }
        }


    }
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class MultiButtonAttribute : ActionNameSelectorAttribute
    {
        public string MatchFormKey { get; set; }
        public string MatchFormValue { get; set; }
        public override bool IsValidName(ControllerContext controllerContext, string actionName, MethodInfo methodInfo)
        {
            bool x = controllerContext.HttpContext.Request[MatchFormKey] != null &&
                controllerContext.HttpContext.Request[MatchFormKey] == MatchFormValue;

            return x;
        }
    }
}
