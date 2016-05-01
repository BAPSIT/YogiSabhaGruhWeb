using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YSGOpsWeb.Models
{
    public interface ICustomerDetails
    {
         int Customer_no { get; set; }
         string Customer_name { get; set; }
         string Customer_Address { get; set; }
         string Landline_No { get; set; }
         string Fax_No { get; set; }
         string Mobile_No { get; set; }
         string Email_id { get; set; }
         string Customer_Status { get; set; }
         string Referred_By { get; set; }
         string Customer_Type { get; set; }
         string Comments { get; set; }
         int Created_By { get; set; }
        // DateTime created_datetime { get; set; }
        // int? Updated_By { get; set; }
        // DateTime? Updated_Datetime { get; set; }
        // char Action { get; set; }
    }
}