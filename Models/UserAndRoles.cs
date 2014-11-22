using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SLTest.Models.Interface;

namespace SLTest.Models
{
    public class UserAndRoles:IBase
    {
        public string uName;
        public string[] roles;

        public bool CanBeDeleted()
        {
            return true;
        }
    }
}