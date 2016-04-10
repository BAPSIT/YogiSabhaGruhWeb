using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Interfaces;
using YSGOpsWeb.Models;

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
            BookingInfo info = BookingInfo.fromIBooking(view);
            BookingOperations bOps = new BookingOperations();
            bOps.AddOrUpdateBooking(info);
        }

        public void ConfirmBooking()
        {
            BookingInfo info = BookingInfo.fromIBooking(view);
            info.Booking_Status = 'F';
            BookingOperations bOps = new BookingOperations();
            bOps.AddOrUpdateBooking(info);
        }
    }
}