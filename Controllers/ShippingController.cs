using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;
using System.Reflection;

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
        [MultiButton(MatchFormKey = "sendCart", MatchFormValue = "Оплатить")]
        public ActionResult CartSubmit(int? a, int? b, int? с)
        {
            shipTo par = new shipTo(Session["sKorzina"] as Dictionary<itCart, int>);
            TryUpdateModel(par);
            if (ModelState.IsValid)
            {
                Session["sKorzina"] = par;
                return RedirectToAction("pvCashOrCart", "Shipping");
            }
            else
            {
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
