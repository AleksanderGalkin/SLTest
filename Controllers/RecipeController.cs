using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SLTest.Models;
using SLTest.Service.Interface;
using SLTest.Service;
using SLTest.Service.Factory;
using SLTest.Controllers.Abstract;

namespace SLTest.Controllers
{
    public class RecipeController : BaseController<Recipe,IBaseService<Recipe>>
    {
        
        public RecipeController(IBaseService<Recipe> _service) : base(_service) { }
        public RecipeController() : this(RecipeServiceFactory.Create()) { }
 /*       #region oldcode
        private coffeeEntities db = new coffeeEntities();
        private int itemsPerPage=10;
        private IBaseService<Recipe> service; // = new RecipeEntityService();
        public RecipeController()
        {
            service = RecipeServiceFactory.Create();
        }

        [Authorize(Roles="Administrators")]
        public ActionResult Index(int pageNum=0)
        {
            ViewData["PageNum"] = pageNum;
            ViewData["itemsPerPage"] = itemsPerPage;
            ViewData["recordCount"] = db.Recipe.Count();

            var recipes = service.Get();
            return View(recipes);
        }

        //
        // GET: /Recipe/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Recipe/Create

        [Authorize(Roles="Administrators")]
        public ActionResult Create()
        {
            //var recipe = new Recipe();
            return View();
        } 

        //
        // POST: /Recipe/Create

        [HttpPost]
        [Authorize(Roles = "Administrators")]
        public ActionResult Create(Recipe recipe)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    //db.AddToRecipe(recipe);
                    //db.SaveChanges();
                    service.Create(recipe);

                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, ex);
            }
            return View(recipe);
        }
        
        //
        // GET: /Recipe/Edit/5
         [Authorize(Roles = "Administrators")]
        public ActionResult Edit(int id)
        {
            //var recipeEdit = (from recipe in db.Recipe
            //                   where recipe.RecID == id
            //                   select recipe).First();
            var recipeEdit = service.Get(id);
            return View(recipeEdit);
        }

        //
        // POST: /Recipe/Edit/5

        [HttpPost]
        [Authorize(Roles = "Administrators")]
        public ActionResult Edit(int id, FormCollection collection)
        {
            //var recipeEdit = (from recipe in db.Recipe
            //                  where recipe.RecID == id
            //                  select recipe).First();
            var recipeEdit = service.Get(id);
            try
            {
                UpdateModel(recipeEdit, collection);
                //db.SaveChanges();
                service.Edit(recipeEdit);
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View(recipeEdit);
            }
        }

        //
        // GET: /Recipe/Delete/5
         [Authorize(Roles = "Administrators")]
        public ActionResult Delete(int id)
        {
          //  var recipeDelete = (from recipe in db.Recipe
          //                    where recipe.RecID == id
          //                    select recipe).First();
            var recipeDelete = service.Get(id);
            return View(recipeDelete);
        }

        //
        // POST: /Recipe/Delete/5

        [HttpPost]
        [Authorize(Roles = "Administrators")]
        public ActionResult Delete(int id, FormCollection collection)
        {
            //var recipeDelete = (from recipe in db.Recipe
            //                    where recipe.RecID == id
            //                    select recipe).First();
            var recipeDelete = service.Get(id);
            try
            {
                //db.DeleteObject(recipeDelete);
                //db.SaveChanges();
                service.Delete(recipeDelete);

                return RedirectToAction("Index");
            }
            catch
            {
                return View(recipeDelete);
            }
        }
        #endregion oldcode
  */
    }
}
