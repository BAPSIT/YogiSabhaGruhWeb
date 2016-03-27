using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    public class BookingInfo : IBooking
    {
        public int Booking_No { get; set; }
        public int Booking_Id { get; set; }
        public DateTime Booking_Date { get; set; }
        public DateTime Booking_FromTime { get; set; }
        public DateTime Booking_ToTime { get; set; }
        public EventDetails Event_Details { get; set; }
        public char Booking_Status { get; set; }
        public int No_Of_Invitees { get; set; }
        public int Booking_Calculated_Amount { get; set; }
        public int Discount { get; set; }
        public string Discoutn_Reason { get; set; }
        public int Booking_final_Amt { get; set; }
        public string RemarksOrComments { get; set; }
        public int Paid_Amt { get; set; }
        public int Balance_Amt { get; set; }
    }
}