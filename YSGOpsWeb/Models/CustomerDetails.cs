using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    public class CustomerDetails
    {
        public int Customer_no { get; set; }
        public string Customer_name { get; set; }
        public string Customer_Address { get; set; }
        public string Landline_No { get; set; }
        public string Fax_No { get; set; }
        public string Mobile_No { get; set; }
        public string Email_id { get; set; }
        public string Customer_Status { get; set; }
        public string Referred_By { get; set; }
        public string Customer_Type { get; set; }
        public string Comments { get; set; }
        public int Created_By { get; set; }
        //public DateTime created_datetime { get; set; }
        //public int? Updated_By { get; set; }
        //public DateTime? Updated_Datetime { get; set; }
        public char Action { get; set; }


        public static CustomerDetails fromICustomerDetails(IBooking view)
        {
            CustomerDetails info = new CustomerDetails();
            info.Customer_no = view.Customer_no;
            info.Customer_name = view.Customer_name;
            info.Customer_Address = view.Customer_Address;
            info.Landline_No = view.Landline_No;
            info.Mobile_No = view.Mobile_No;
            info.Email_id = view.Email_id;
           
            info.Created_By = view.Created_By;
            

            return info;
        }
    }
}