using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;

namespace SLTest.Controllers
{
    public class NavigatorController : Controller
    {
        private coffeeEntities db = new coffeeEntities();
        private Navigator<VMMenuItems> nav;
        private NaviModel<VMMenuItems> nm ;

        public NavigatorController()
        {
              nav = new Navigator<VMMenuItems>();
              nm = new NaviModel<VMMenuItems>();
        
        }

        
        public ActionResult Index()
        {
            OptionsDropDownList();
            var recipes = from recipe in db.Recipe
                          orderby recipe.RecName
                          select new VMMenuItems
                          {
                              cb = false,
                              RecID = recipe.RecID,
                              RecName = recipe.RecName,
                              Sort=recipe.Sort,
                              Price = recipe.Price,
                              OptID = 0
                          };

            
            nm.items = recipes;
            nav.Add(nm, "Sort", "Тратата");
            nav.test = "dsdsds";
            //SearchTerm<VMMenuItems> search = new SearchTerm<VMMenuItems>(nm, "Sort", "Тратата");

            
           // nav.Add(search);


            return View(nav);
        }
        [HttpPost]
        public ActionResult Index(FormCollection fc,Navigator<VMMenuItems> model)
        {
            if (ModelState.IsValid)
            {
                //var t=new List<bool>();
                //t.Add(false);
                //t.Add(true);
                //t.Add(false);

                int count=0;
                foreach (var i in model.list)
                {
                    foreach(var j in i.GetContent())
                        if (fc[j.nmItem].ToString().Contains("true"))
                            count++;
                }



                UpdateModel(nav);
                var r = nav.list.ElementAt(0).GetFiltered();
                return View(fc);
            }
            return View(fc);
        }

        private void OptionsDropDownList(object selectedoptions = null)
        {
            var recipeQuery = from d in db.Options
                              orderby d.OptionName
                              select d;
            ViewData["RecList"] = new SelectList(recipeQuery, "OptID", "OptionName", selectedoptions);
        }

    }
}
