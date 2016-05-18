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
    public partial class FindBooking : System.Web.UI.Page, IFindBooking
    {
        private FindBookingManager manager = new FindBookingManager();

        #region #Public Properties
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
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region #Event Handlers

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Search_Booking_FromDate = DateTime.ParseExact(inpBookingFromDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            Search_Booking_ToDate = DateTime.ParseExact(inpBookingToDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            grdList.DataSource = manager.Search(Search_Booking_FromDate, Search_Booking_ToDate);
            grdList.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Cancellation_Reason, Cancellation_Description;
            Double BookingNo, Cancellation_Refunded_Amt;
            DateTime Cancellation_Datetime;

            BookingNo = 4;
            Cancellation_Reason = inpReason.Value;
            Cancellation_Description = inpDescription.Value;
            Cancellation_Refunded_Amt = Convert.ToDouble(inpAmountRefunded.Value);
            Cancellation_Datetime = DateTime.ParseExact(inpCancellationdate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            manager.Cancel(BookingNo, Cancellation_Reason, Cancellation_Description, Cancellation_Refunded_Amt, Cancellation_Datetime);
            msg.Visible = true;
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            ImageButton btnSchedule = (ImageButton)sender;
            GridViewRow grdRow = (GridViewRow)btnSchedule.Parent.Parent;
            if (grdRow != null)
            {
                string Booking_No = grdRow.Cells[1].Text;
            }
        }

        #endregion

        public DateTime Search_Booking_FromDate
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

        public DateTime Search_Booking_ToDate
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

    }
}