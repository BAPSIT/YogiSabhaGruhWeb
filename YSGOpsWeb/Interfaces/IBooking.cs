using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using YSGOpsWeb.Models;

namespace YSGOpsWeb.Interfaces
{
    public interface IBooking
    {
        int Booking_No { get; set; }
        int Booking_Id { get; set; }
        DateTime Booking_Date { get; set; }
        DateTime Booking_FromTime { get; set; }
        DateTime Booking_ToTime { get; set; }

        int Event_No { get; set; }
        string Event_Class { get; set; }
        char Booking_Status { get; set; }
        int No_Of_Invitees { get; set; }
        int Booking_Calculated_Amt { get; set; }
        int Discount { get; set; }
        string Discount_Reason { get; set; }
        int Booking_final_Amt { get; set; }
        string RemarkOrComments { get; set; }
        int Paid_Amt { get; set; }
        int Balance_Amt { get; set; }


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

    }
}
