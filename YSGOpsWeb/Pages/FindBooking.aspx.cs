using System;
using System.Collections.Generic;
using System.Data;
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
            //Search_Booking_FromDate = DateTime.ParseExact(inpBookingFromDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            //Search_Booking_ToDate = DateTime.ParseExact(inpBookingToDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            grdList.DataSource = manager.Search(Search_Booking_FromDate, Search_Booking_ToDate);
            grdList.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Cancellation_Reason, Cancellation_Description;
            Double Cancellation_Refunded_Amt;
            DateTime Cancellation_Datetime;
            int bookingId = -1, bookingNo = -1;
            Int32.TryParse(hdnBookingNo.Value, out bookingNo);
            Int32.TryParse(hdnBookingId.Value, out bookingId);

            Cancellation_Reason = inpReason.Value;
            Cancellation_Description = inpDescription.Value;
            Cancellation_Refunded_Amt = Convert.ToDouble(inpAmountRefunded.Value);
            Cancellation_Datetime = DateTime.ParseExact(inpCancellationdate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            manager.Cancel(bookingId, bookingNo, Cancellation_Reason, Cancellation_Description, Cancellation_Refunded_Amt, Cancellation_Datetime);
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
                //return DateTime.ParseExact(inpBookingFromDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                return DateTime.Parse(hdnBookingStartDate.Value, null, System.Globalization.DateTimeStyles.RoundtripKind);
            }
            set
            {
                inpBookingFromDate.Value = value.ToString("dd/MM/yyyy");
                hdnBookingStartDate.Value = value.ToString("yyyy-MM-ddTHH:mm:ssK");
            }
        }

        public DateTime Search_Booking_ToDate
        {
            get
            {
                return DateTime.Parse(hdnBookingEndDate.Value, null, System.Globalization.DateTimeStyles.RoundtripKind);

                //                return DateTime.ParseExact(inpBookingToDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingToDate.Value = value.ToString("dd/MM/yyyy");
                hdnBookingEndDate.Value = value.ToString("yyyy-MM-ddTHH:mm:ssK");
            }
        }

        protected void grdList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton btnCancel = e.Row.FindControl("btnEdit") as LinkButton;
                if (btnCancel != null)
                {
                    string bookingNo = (e.Row.DataItem as DataRowView).Row["Booking_No"].ToString();
                    string bookingId = (e.Row.DataItem as DataRowView).Row["Booking_Id"].ToString();

                    btnCancel.Attributes.Add("onclick", "setHiddenFields(" + bookingNo + "," + bookingId + ")");

                }
            }
        }

    }
}