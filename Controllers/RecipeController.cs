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
 
    }
}
