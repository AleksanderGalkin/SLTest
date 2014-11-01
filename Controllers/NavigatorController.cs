using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;
using SLTest.Models.Interface;

namespace SLTest.Controllers
{
    public class NavigatorController : Controller
    {
        private coffeeEntities db = new coffeeEntities();
        public Navigator<INavigator> nav;
        public Navigator<INavigator> navSes;

        public NavigatorController()
        {
            nav = new Navigator<INavigator>();
            nav.Add(GetModel(), "Sort", "напитки");
        }

        
        public ActionResult PVIndex(int pageNum=1)
        {
            OptionsDropDownList();

            navSes = Session["SFModel"] as Navigator<INavigator>;
            if (navSes != null)
            nav = navSes;

           // ViewBag.pn = pageNum;
                 return View(nav);
        }
        [HttpPost]
        public ActionResult PVIndexPost(FormCollection fc)
        {


            
            foreach (var i in nav.list)
            {
                foreach (var j in i.GetContent())
                {
                        if (fc[j.nmItem].ToString().Contains("true"))
                        {
                            j.cbItem = true;

                        }
                }
            }

            var r = nav.list.ElementAt(0).GetFiltered();
            Session["SFModel"] = nav;
        
            return RedirectToAction("Index", "Home");
        }

        private void OptionsDropDownList(object selectedoptions = null)
        {
            var recipeQuery = from d in db.Options
                              orderby d.OptionName
                              select d;
            ViewData["RecList"] = new SelectList(recipeQuery, "OptID", "OptionName", selectedoptions);
        }

        private IEnumerable<INavigator> GetModel()
        {
            return  from recipe in db.Recipe
                      orderby recipe.RecName
                      select new VMMenuItem
                      {
                          cb = false,
                          RecID = recipe.RecID,
                          RecName = recipe.RecName,
                          Sort = recipe.Sort,
                          Price = recipe.Price,
                          OptID = 0
                      };
        }
        //private IEnumerable<INavigator> GetModelHot()
        //{
        //    return from h in db.Hot
        //          // orderby h.Name
        //           select h;
        //}

    }
}
