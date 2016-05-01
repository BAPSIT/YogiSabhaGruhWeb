using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    public class InventoryInfo
    {
        public int Item_no { get; set; }
        public string Item_name { get; set; }
        //public int Related_Dept_No { get; set; }
        public int Available_Qty { get; set; }
        public float Rent_per_Qty { get; set; }
        //public string Description { get; set; }       
        //public int created_By { get; set; }   
        //public char IsActive { get; set; }
        //public bool IsDefault  { get; set; }


        //public static InventoryInfo fromICustomerDetails(IBooking view)
        //{
        //    InventoryInfo info = new InventoryInfo();
        //    //info.Item_no = view.Item_no;
        //    //info.Item_name = view.Item_name;
        //    //info.Related_Dept_No = view.Related_Dept_No;
        //    //info.Available_Qty = view.Available_Qty;
        //    //info.Rent_per_Qty = view.Rent_per_Qty;
        //    //info.Description = view.Description;           
        //    //info.Created_By = view.Created_By;
            

        //    return info;
        //}
    }
}