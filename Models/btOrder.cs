using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;



namespace SLTest.Models
{
    public static class btOrder
    {
        private static coffeeEntities db = new coffeeEntities();
        public static int? totOrdNum;
        public static int? notPaidOrdNum;
        public static bool active;
        public static string userName;

          static btOrder()
        {
            totOrdNum = null;
            notPaidOrdNum = null;
            active = false;
            userName = null;
        }

         public static string Refresh(this System.Web.Mvc.ViewMasterPage parPage)
        {
            string parUser = parPage.Page.User.Identity.Name;//.User.Identity.Name;
            
            if (parUser != null && parUser.Length > 0)
            {
                var result = from i in db.shipTo
                             where i.userName == parUser
                             group i by i.flPaid
                             //into iGr
                             //where iGr.Key==true
                             //select iGr.Count()
                             ;
                totOrdNum = (from i in db.shipTo
                             where i.userName == parUser
                             select i).Count();
                             //into iGr
                             //where iGr.Key==true
                             //select iGr.Count()
                             ;

                notPaidOrdNum = (from i in db.shipTo
                                where i.userName == parUser
                                group i by i.flPaid
                                    into iGr
                                    where iGr.Key == false
                                    select iGr.Count()).FirstOrDefault();
                   
                
                active = true;
                userName = parUser;
            }
            else
            {
                totOrdNum = null;
                notPaidOrdNum = null;
                active = false;
                userName = null;
            }

            return "";
        }

    }


}