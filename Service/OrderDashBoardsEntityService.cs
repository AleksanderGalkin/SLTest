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

        public  void SetOrderState(int orderId, string Descr,string user)
        {
            OrderDashBoards obj = new OrderDashBoards();
            OrderStages obj_os = (from i in db.OrderStages
                                  where i.Descr == Descr
                                   select i).FirstOrDefault();
            if (obj_os != null)
            {
                obj.stageID1 = obj_os.ID;
            }
            
            obj.shipToID = orderId;
            obj.stageDT = DateTime.Now;
            obj.username = user;
            db.AddToOrderDashBoards(obj);
            db.SaveChanges();
            
        }

        public void SetPayState(int orderId, string Descr, string user)
        {
            OrderDashBoards obj = new OrderDashBoards();
            OrderStages obj_os = (from i in db.OrderStages
                                  where i.Descr == Descr
                                  select i).FirstOrDefault();
            if (obj_os != null)
            {
                obj.stageID2 = obj_os.ID;
            }

            obj.shipToID = orderId;
            obj.stageDT = DateTime.Now;
            obj.username = user;
            db.AddToOrderDashBoards(obj);
            db.SaveChanges();

        }
        public OrderStages GetOrderState(int orderId)
        {
            OrderStages result = (from i in db.OrderDashBoards
                          where i.shipToID == orderId && i.stageID1 != null
                          orderby i.stageDT descending
                          select i.OrderStages
                             ).FirstOrDefault();

            return result;
        }
        public OrderStages GetPayState(int orderId)
        {
            OrderStages result = (from i in db.OrderDashBoards
                             where i.shipToID == orderId && i.stageID2 != null
                             orderby i.stageDT descending
                             select i.OrderStages1
                             ).FirstOrDefault();
            return result;
        }
    }
}