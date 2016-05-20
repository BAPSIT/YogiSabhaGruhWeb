using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;
using DapperExtensions;
using DapperExtensions.Mapper;
using DapperAttribute = Dapper.Contrib.Extensions;
namespace YSGOpsWeb.Models
{
 [Serializable]
    public class BookingFacilityInfo
    {
        public int Booking_Facility_No { get; set; }
        public int Booking_No { get; set; }
        public int Item_no { get; set; }
        public int Required_Qty { get; set; }
        public float Calculated_Amount { get; set; }
        public string Remarks { get; set; }
        public char IsActive { get; set; }
        public int created_By { get; set; }
        public char Action { get; set; }


       [DapperAttribute.Write(false)]
        public InventoryInfo InventoryInfo { get; set; }

        public static BookingFacilityInfo fromICustomerDetails(IBooking view)
        {
            BookingFacilityInfo info = new BookingFacilityInfo();
            info.Booking_No = view.Booking_No;
            info.Item_no = view.Item_no;
            //info.Item_name = view.Item_name;
            //info.Related_Dept_No = view.Related_Dept_No;
            info.Required_Qty = view.Required_Qty;
            info.Calculated_Amount = view.Calculated_Amount;
            info.Remarks = view.Remarks;           
            //info.Created_By = view.Created_By;


            return info;
        }
    }


    public class BookingFacilityInfoParam
    {
       // public int Booking_Facility_No { get; set; }
        public int Booking_No { get; set; }
        public int Item_no { get; set; }
        public int Required_Qty { get; set; }
        public float Calculated_Amount { get; set; }
        public string Remarks { get; set; }
      //  public char IsActive { get; set; }
        public int created_By { get; set; }
        //public char Action { get; set; }

       
    }
    
}