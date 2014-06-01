using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;
using SLTest.Service.Factory;
using SLTest.Service.Interface;
using SLTest.Controllers.Abstract;

namespace SLTest.Controllers
{
    public class OptionsController : BaseController1DL<Options, IBaseService<Options>, Recipe, IBaseService<Recipe>>
    {
        public OptionsController(IBaseService<Options> _service, IBaseService<Recipe> _serviceDL) : base(_service, _serviceDL) { }
        public OptionsController() : this(OptionsServiceFactory.Create(), RecipeServiceFactory.Create()) { }

        /*       #region oldcode
        private coffeeEntities db = new coffeeEntities();
        IBaseService<Options> ServiceO = OptionsServiceFactory.Create();
        IBaseService<Recipe> ServiceR = RecipeServiceFactory.Create();
        private int itemsPerPage = 10;

        [Authorize(Roles = "Administrators")]
        public ActionResult Index(int pageNum = 0)
        {
            ViewData["PageNum"] = pageNum;
            ViewData["itemsPerPage"] = itemsPerPage;
            ViewData["recordCount"] = db.Options.Count();
            var options = ServiceO.Get();
            //var options = (from option in db.Options orderby option.OptionName select option).
            //    Skip(itemsPerPage * pageNum).Take(itemsPerPage).ToList();
         
            return View(options);
        }



        [Authorize(Roles = "Administrators")]
        public ActionResult Create()
        {
          //  var option = new Options();

            RecipeDropDownList();
            return View();
        } 

        //
        // POST: /Options/Create

        [HttpPost]
        [Authorize(Roles = "Administrators")]
        public ActionResult Create(Options option)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ServiceO.Create(option);
                   // db.AddToOptions(option);
                   // db.SaveChanges();

                    return RedirectToAction("Index");
                }

                
            }
            catch(Exception ex)
            {
                ModelState.AddModelError(string.Empty, ex);
            }

            RecipeDropDownList(option.Recipe);
            return View(option);
        }
        
        //
        // GET: /Options/Edit/5

        [Authorize(Roles = "Administrators")]
        public ActionResult Edit(int id)
        {
            var optionEdit = ServiceO.Get(id);
            //var optionEdit = (from option in db.Options
           //                   where option.OptID == id
           //                   select option).First();
            RecipeDropDownList(optionEdit.Recipe);
            return View(optionEdit);
        }

      

        [HttpPost]
        [Authorize(Roles = "Administrators")]
        public ActionResult Edit(int id, FormCollection collection)
        {
            //var optionEdit = (from option in db.Options
            //                  where option.OptID == id
            //                  select option).First();
            var optionEdit = ServiceO.Get(id);
            try
            {
                UpdateModel(optionEdit);
               // db.SaveChanges();
                ServiceO.Edit(optionEdit);
 
                return RedirectToAction("Index");
            }
            catch
            {
                RecipeDropDownList(optionEdit.Recipe);
                return View(optionEdit);
            }
        }

        //
        // GET: /Options/Delete/5

        [Authorize(Roles = "Administrators")]
        public ActionResult Delete(int id)
        {
            //var optionDelete = (from option in db.Options
            //                  where option.OptID == id
            //                  select option).First();
            var optionDelete = ServiceO.Get(id);
            return View(optionDelete);
        }

        //
        // POST: /Options/Delete/5

        [HttpPost]
        [Authorize(Roles = "Administrators")]
        public ActionResult Delete(int id, FormCollection collection)
        {
            //var optionDelete = (from option in db.Options
            //                    where option.OptID == id
            //                    select option).First();
            var optionDelete = ServiceO.Get(id);
            try
            {

                //db.DeleteObject(optionDelete);
                //db.SaveChanges();
                ServiceO.Delete(optionDelete);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(optionDelete);
            }
        }
        private void RecipeDropDownList(object selectedRecipe = null)
        {
            //var recipeQuery = from d in db.Recipe
            //                       orderby d.RecName
            //                       select d;
            var recipeQuery = ServiceR.Get();
            ViewData["RecList"] = new SelectList(recipeQuery, "RecID", "RecName", selectedRecipe);
        }
          #endregion oldcode
        */
    }
}
