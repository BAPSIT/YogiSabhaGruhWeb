using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Interfaces;

using YSGOpsWeb.Models;

namespace YSGOpsWeb
{
    public class FindBookingManager
    {
        private IFindBooking _view;

        public FindBookingManager()
        {

        }

        public FindBookingManager(IFindBooking view)
        {
            _view = view;
        }

        public DataSet Search(DateTime fromdate, DateTime todate)
        {
            //FindBookingInfo info = FindBookingInfo.SearchBooking(_view);
            FindBookingOperations bOps = new FindBookingOperations();
            return bOps.SearchBooking(fromdate,todate);
        }

        public void Cancel(Double BookingNo, string Cancellation_Reason, string Cancellation_Description, Double Cancellation_Refunded_Amt, DateTime Cancellation_Datetime)
        {
            //FindBookingInfo info = FindBookingInfo.SearchBooking(_view);
            FindBookingOperations bOps = new FindBookingOperations();
            bOps.CancelBooking(BookingNo, Cancellation_Reason, Cancellation_Description, Cancellation_Refunded_Amt, Cancellation_Datetime);
        }
    }
}