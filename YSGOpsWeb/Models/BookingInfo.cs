using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    public class BookingInfo
    {
        public int Booking_No { get; set; }
        public int Booking_Id { get; set; }
        public DateTime Booking_Date { get; set; }
        public DateTime Booking_FromTime { get; set; }
        public DateTime Booking_ToTime { get; set; }
        public int Customer_No { get; set; }
        public char Booking_Status { get; set; }
        public int No_Of_Invitees { get; set; }
        public int Booking_Calculated_Amt { get; set; }
        public int Discount { get; set; }
        public string Discount_Reason { get; set; }
        public int Booking_final_Amt { get; set; }
        public string RemarkOrComments { get; set; }
        public int Paid_Amt { get; set; }
        public int Balance_Amt { get; set; }
        public int Event_No { get; set; }
        public string Event_Class { get; set; }
        public char Action { get; set; }
        public int Created_By { get; set; }
        public int Hall_no { get; set; }
        public string Referred_By { get; set; }
        public string Discount_By { get; set; }

        public int Extra_Hour_Charges { get; set; }
        public EventDetails EventDetails;

        public DateTime Search_Booking_FromDate;
        public DateTime Search_Booking_ToDate;
      


        public static BookingInfo fromIBooking(IBooking view)
        {
            BookingInfo info = new BookingInfo();
            info.Booking_No = view.Booking_No;
            info.Booking_Id = view.Booking_Id;
            info.Booking_Date = view.Booking_Date;
            info.Booking_FromTime = view.Booking_FromTime;
            info.Booking_ToTime = view.Booking_ToTime;
            //info.Event_Details           
            info.Booking_Status = view.Booking_Status;
            info.No_Of_Invitees = view.No_Of_Invitees;
            info.Booking_Calculated_Amt = view.Booking_Calculated_Amt;
            info.Discount = view.Discount;
            info.Discount_Reason = view.Discount_Reason;
            info.Booking_final_Amt = view.Booking_final_Amt;
            info.RemarkOrComments = view.RemarkOrComments;
            info.Paid_Amt = view.Paid_Amt;
            info.Balance_Amt = view.Balance_Amt;
            info.Event_No = view.Event_No;
            info.Event_Class = view.Event_Class;
            info.Created_By = view.Created_By;
            info.Hall_no = view.Hall_no;
            info.Referred_By = view.Referred_By;
            info.Extra_Hour_Charges = view.Extra_Hour_Charges;
            info.Discount_By = view.Discount_By;
            return info;
        }

        public static BookingInfo SearchBooking(SBooking Searchview)
        {
            BookingInfo info = new BookingInfo();

            info.Search_Booking_FromDate = Searchview.Search_Booking_FromDate;
            info.Search_Booking_ToDate = Searchview.Search_Booking_ToDate;

            return info;
        }

    }
}