 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;

namespace SLTest.Controllers
{
    

    [HandleError]
    public class HomeController : Controller
    {
        private coffeeEntities db = new coffeeEntities();
        private int itemsPerPage = 3;
        VMMenu<VMMenuItems> vmmenu=new VMMenu<VMMenuItems>();
        
        public ActionResult Index(int pageNum=1)
        {
            
            vmmenu.paginginfo.CurrentPage = pageNum;
            vmmenu.paginginfo.ItemsPerPage = itemsPerPage;
            vmmenu.paginginfo.ItemsToView = 4;
            vmmenu.paginginfo.TotalItems = db.Recipe.Count();
            ViewData["Message"] = "Добро пожаловать в нашу кофейню";
            
            OptionsDropDownList();

            var recipes = (from recipe in db.Recipe
                           orderby recipe.RecName
                           select new VMMenuItems
                           {
                               cb = false,
                               RecID = recipe.RecID,
                               RecName = recipe.RecName,
                               Price = recipe.Price,
                               OptID = 0
                           }).
                Skip(itemsPerPage * (pageNum - 1)).Take(itemsPerPage);
            VMMenuItems.spr = from sprOpt in db.Options
                              select sprOpt;
            vmmenu.items = recipes;
            return View(vmmenu);

          
        }


        [HttpPost]
        public ActionResult Index(FormCollection menu)
        {
            
                try
                {
                    if (ModelState.IsValid)
                    {
                        Dictionary<int, int> sKorzina = Session["sKorzina"] as Dictionary<int, int>;
                        if (sKorzina == null) sKorzina = new Dictionary<int, int>();
                        Session["sKorzina"] = sKorzina;
                        for (int i = 0; i < menu.Count; i++)
                        {   
                            var v = menu[i].Split(new char[] { ',' })[0];
                            if (v == "true")
                            {
                                var intI = Convert.ToInt32(menu.AllKeys[i]);
                                if (sKorzina.ContainsKey(intI)) sKorzina[intI] = sKorzina[intI] + 1;
                                else sKorzina[intI] = 1;
                            }

                        }
                        Session["sKorzina"] = sKorzina;
                        return RedirectToAction("Index");
                    }


                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty, ex);
                }

            OptionsDropDownList();
            return View(menu);
        }
 


        [Authorize(Roles = "Administrators")]
        public ActionResult Administration(string modName = "Recipe", string metName = "PVIndex", int pageNum = 1,int id=0)
        {
            ViewBag.mn = modName;
            ViewBag.mtn = metName;
            ViewBag.pn = pageNum;
            ViewBag.id = id;

            return View();
        }

        public ActionResult Korzina()
        {

            return View(Session["sKorzina"] as Dictionary<int,int>);
        }

        public ActionResult About()
        {
            return View();
        }


        private void OptionsDropDownList(object selectedoptions = null)
        {
            var recipeQuery = from d in db.Options
                              orderby d.OptionName
                              select d;
            ViewData["RecList"] = new SelectList(recipeQuery, "OptID", "OptionName", selectedoptions);
        }

        //ActionResult PVIndex()
        //{
        //    return View(
        //};
    }
}
