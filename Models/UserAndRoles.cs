using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SLTest.Models.Interface;

namespace SLTest.Models
{
    public class UserAndRoles:IBase
    {
        public string id;
        public string roleName;
        public string[] users;

        public bool CanBeDeleted()
        {
            return true;
        }
    }
}