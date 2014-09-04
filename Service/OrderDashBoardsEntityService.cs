using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SLTest.Service.Interface;
using SLTest.Models;



namespace SLTest.Service
{
    public class OrderDashBoardsStagesEntityService 
    {
        coffeeEntities db = new coffeeEntities();
        public IEnumerable<OrderDashBoards> Get()
        {
            IEnumerable<OrderDashBoards> obj = from a in db.OrderDashBoards select a;
            return obj;
        }
        public OrderDashBoards Get(int id)
        {
            OrderDashBoards obj = (from a in db.OrderDashBoards where a.ID == id select a).SingleOrDefault();
            return obj;
        }
        
         public void Delete(OrderDashBoards obj)
        {
            db.DeleteObject(obj);
            db.SaveChanges();
        }
        public int Count()
        {
            int cnt = (from a in db.OrderDashBoards select a).Count();
            return cnt;
        }

        public void SetState(int orderId, string Descr,string user)
        {
            OrderDashBoards obj = new OrderDashBoards();
            OrderStages obj_os = (from i in db.OrderStages
                                  where i.Descr == Descr
                                   select i).FirstOrDefault();
            if (obj_os != null)
            {
                obj.stageID1 = obj_os.ID;
            }
            else
            {
                PayStages obj_ps = (from i in db.PayStages
                                      where i.Descr == Descr
                                      select i).FirstOrDefault();
                if(obj_ps!=null)
                    obj.stageID2 = obj_ps.ID;
            }
            obj.shipToID = orderId;
            obj.stageDT = DateTime.Now;
            obj.username = user;
            db.AddToOrderDashBoards(obj);
            db.SaveChanges();
            
        }

        public string GetOrderState(int orderId)
        {
            string result = (from i in db.OrderDashBoards
                             where i.shipToID == orderId
                             let par = i.stageID1
                             from j in db.OrderStages
                             where j.ID == par
                             select j.Descr).ToString();
            return result;
        }
        public string GetPayState(int orderId)
        {
            string result = (from i in db.OrderDashBoards
                             where i.shipToID == orderId
                             let par = i.stageID2
                             from j in db.PayStages
                             where j.ID == par
                             select j.Descr).ToString();
            return result;
        }
    }
}