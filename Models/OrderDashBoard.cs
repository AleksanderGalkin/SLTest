using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SLTest.Models
{
    public class OrderDashBoard
    {
        public int shipToID { get; set; }
        public int stageID1 { get; set; }
        public int stageID2 { get; set; }
        public DateTime stageDT { get; set; }
        public string user { get; set; }


    }
    public class OrderStage
    {
        public int ID { get; set; }
        public string Descr { get; set; }
        public string style { get; set; }

    }
}