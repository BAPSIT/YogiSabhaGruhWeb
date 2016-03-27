using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb
{
    public class BookingManager
    {
        private IBooking view;
        public BookingManager(IBooking bookingView)
        {
            this.view = bookingView;
           
        }

        public void Fetch()
        {
        }

        public void Save()
        {
            DateTime DT = view.Booking_Date;
            DateTime from = view.Booking_FromTime;
            DateTime to = view.Booking_ToTime;
        }

        public void Create()
        {
        }
    }
}