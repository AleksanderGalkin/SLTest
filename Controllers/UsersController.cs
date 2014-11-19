using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SLTest.Models;

namespace SLTest.Controllers
{
    public class UsersController : Controller
    {
        //
        // GET: /Users/

        private coffeeEntities db = new coffeeEntities();
        private int itemsPerPage = 10;

        public ActionResult PVIndex(int pageNum=1)
        {
           
            var res = (from i in db.aspnet_Users
                       select i.UserName).Skip(pageNum - 1 * itemsPerPage).Take(itemsPerPage);
            return View(res);
        }

    }
}
