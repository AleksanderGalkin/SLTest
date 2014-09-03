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
        

        public void Create(OrderDashBoards obj)
        {
            db.AddToOrderDashBoards(obj);
            db.SaveChanges();
        }
        public void Edit(OrderDashBoards obj)
        {
            
            db.SaveChanges();
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

        public void SetOrderState(int orderId, string Descr)
        {
            shipTo obj = (from i in db.shipTo
                       where i.ID == orderId
                       select i).FirstOrDefault();
            
        }

        public void SetPayState(int orderId, string Descr)
        {

        }

        public string GetOrderState(int orderId)
        {

        }
        public string GetPayState(int orderId)
        {

        }
    }
}