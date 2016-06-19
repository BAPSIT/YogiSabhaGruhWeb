using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
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
        int Extra_Hour_Charges { get; set; }
        GridView FacilityGrid { get; }
        //List<BookingFacilityInfo> bookingFacility { get; set; }

        int Item_no { get; set; }
        int Required_Qty { get; set; }
        float Calculated_Amount { get; set; }
        string Remarks { get; set; }
        int Hall_no { get; set; }
        string Discount_By { get; set; }
    }

    public interface SBooking
    {
        DateTime Search_Booking_FromDate { get; set; }
        DateTime Search_Booking_ToDate { get; set; }
    }
}
