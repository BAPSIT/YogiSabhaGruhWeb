using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSGOpsWeb.Interfaces;
using YSGOpsWeb.Models;
//using YSGOpsWeb.Class;


namespace YSGOpsWeb.Pages
{
    public partial class FindBooking : System.Web.UI.Page
    {
        private BookingManager manager;

        public DateTime Booking_FromDate
        {
            get
            {
                return DateTime.ParseExact(inpBookingFromDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingFromDate.Value = value.ToString("dd/MM/yyyy");
            }
        }

        public DateTime Booking_ToDate
        {
            get
            {
                return DateTime.ParseExact(inpBookingToDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingToDate.Value = value.ToString("dd/MM/yyyy");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            manager.Search();
        }
    }
}