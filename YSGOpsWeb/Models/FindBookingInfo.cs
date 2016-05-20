using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    public class FindBookingInfo
    {
 
        public DateTime Search_Booking_FromDate { get; set; }
        public DateTime Search_Booking_ToDate { get; set; }

        public static FindBookingInfo SearchBooking(IFindBooking Searchview)
        {
            FindBookingInfo info = new FindBookingInfo();

            info.Search_Booking_FromDate = Searchview.Search_Booking_FromDate;
            info.Search_Booking_ToDate = Searchview.Search_Booking_ToDate;

            return info;
        }

    }
}