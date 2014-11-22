using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using SLTest.Models;
using SLTest.Controllers.Abstract;
using SLTest.Service.Interface;
using SLTest.Service.Factory;

namespace SLTest.Controllers
{

    public class UsersController : BaseController<UserAndRoles, IBaseService<UserAndRoles>>
    {
        
        public UsersController(IBaseService<UserAndRoles> service) : base(service) { }
        public UsersController() : this(UserAndRolesServiceFactory.Create()) { }
        
    }
}
