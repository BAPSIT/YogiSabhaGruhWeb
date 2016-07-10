using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    [Serializable]
    public class InventoryInfo
    {
        public int Item_no { get; set; }
        public string Item_name { get; set; }     
        public int Available_Qty { get; set; }
        public float Rent_per_Qty { get; set; }
        public int Related_Dept_no { get; set; }
        public string Description { get; set; }
        public int CreatedBy { get; set; }
       
    }
}