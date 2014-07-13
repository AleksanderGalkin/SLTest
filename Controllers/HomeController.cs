﻿ using System;
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
        private int itemsPerPage = 10;
        VMMenu<VMMenuItem> vmmenu=new VMMenu<VMMenuItem>();
        struct zakaz { int drink; int opt;}

        public ActionResult Index(int pageNum=1)
        {
            
            vmmenu.paginginfo.CurrentPage = pageNum;
            vmmenu.paginginfo.ItemsPerPage = itemsPerPage;
            vmmenu.paginginfo.ItemsToView = 4;
            
            ViewData["Message"] = "Добро пожаловать в нашу кофейню";
            
            OptionsDropDownList();
            Navigator<VMMenuItem> nav;
            nav = Session["SFModel"] as Navigator<VMMenuItem>;
            if (nav == null)
            {
                vmmenu.paginginfo.TotalItems = db.Recipe.Count();
                vmmenu.items = (from recipe in db.Recipe
                                orderby recipe.RecName
                                select new VMMenuItem
                                {
                                    cb = false,
                                    RecID = recipe.RecID,
                                    RecName = recipe.RecName,
                                    Price = recipe.Price,
                                    OptID = 0
                                }).
                    Skip(itemsPerPage * (pageNum - 1)).Take(itemsPerPage);

            }
            else
            {
                
                vmmenu.paginginfo.TotalItems = nav.list.ElementAt(0).GetFiltered().Count();
                vmmenu.items = (from recipe in nav.list.ElementAt(0).GetFiltered()
                                 orderby recipe.RecName
                                 select new VMMenuItem
                                 {
                                     cb = false,
                                     RecID = recipe.RecID,
                                     RecName = recipe.RecName,
                                     Price = recipe.Price,
                                     OptID = 0
                                 }).
                                    Skip(itemsPerPage * (pageNum - 1)).Take(itemsPerPage);

            }
            

            VMMenuItem.spr = from sprOpt in db.Options
                              select sprOpt;
            

            
            
            return View(vmmenu);

          
        }




        [HttpPost]
        public ActionResult Index(FormCollection menu)
        {
            
                try
                {
                    if (ModelState.IsValid)
                    {
                        Dictionary<zakaz, int> sKorzina = Session["sKorzina"] as Dictionary<zakaz,int>;
                        if (sKorzina == null) sKorzina = new Dictionary<zakaz, int>();
                        Session["sKorzina"] = sKorzina;
                        for (int i = 0; i < menu.Count; i++)
                        {   
                            var v = menu[i].Split(new char[] { ',' })[0];
                            
                            if (v == "true")
                            {
                                var o = menu["item.OptID"][i];
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


        public ActionResult PVIndex(int pageNum = 1)
        {

            vmmenu.paginginfo.CurrentPage = pageNum;
            vmmenu.paginginfo.ItemsPerPage = itemsPerPage;
            vmmenu.paginginfo.ItemsToView = 4;
            vmmenu.paginginfo.TotalItems = db.Recipe.Count();
            ViewData["Message"] = "Добро пожаловать в нашу кофейню";

            OptionsDropDownList();

            if (TempData["FModel"] == null)
            {
                vmmenu.paginginfo.TotalItems = db.Recipe.Count();
                vmmenu.items = (from recipe in db.Recipe
                                orderby recipe.RecName
                                select new VMMenuItem
                                {
                                    cb = false,
                                    RecID = recipe.RecID,
                                    RecName = recipe.RecName,
                                    Price = recipe.Price,
                                    OptID = 0
                                }).
                    Skip(itemsPerPage * (pageNum - 1)).Take(itemsPerPage);

            }
            else
            {
                vmmenu.items = TempData["FModel"] as IEnumerable<VMMenuItem>;
                vmmenu.paginginfo.TotalItems = vmmenu.items.Count();
            }


            VMMenuItem.spr = from sprOpt in db.Options
                             select sprOpt;




            return View("PVIndex",vmmenu);


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

        public ActionResult About3()
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
