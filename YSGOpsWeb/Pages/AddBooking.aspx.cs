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
    public partial class AddBooking : System.Web.UI.Page, IBooking
    {
        private BookingManager manager;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = new BookingManager(this);
            if (this.IsPostBack)
            {
            }
            else
            {
                inpName.Value = "Jigar";
                inpPrimaryPhone.Value = "9619003784";
            }
        }

        public int Booking_No
        {
            get
            {
                return Int32.Parse(hdnBookingId.Value);
            }
            set
            {
                hdnBookingId.Value = value.ToString();
            }
        }

        public int Booking_Id
        {
            get
            {
                return Int32.Parse(hdnBookingId.Value);
            }
            set
            {
                hdnBookingId.Value = value.ToString();
            }
        }

        public DateTime Booking_Date
        {
            get
            {
                return DateTime.ParseExact(inpBookingDate.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingDate.Value = value.ToString("dd/MM/yyyy");
            }
        }

        public DateTime Booking_FromTime
        {
            get
            {
                return DateTime.ParseExact(inpBookingDate.Value + " " + inpBookingFrom.Value, "dd/MM/yyyy h:mm tt", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingFrom.Value = value.ToString("hh:mm");
            }
        }

        public DateTime Booking_ToTime
        {
            get
            {
                return DateTime.ParseExact(inpBookingDate.Value + " " + inpBookingTo.Value, "dd/MM/yyyy h:mm tt", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingTo.Value = value.ToString("hh:mm");
            }
        }

        public char Booking_Status
        {
            //I - Inquiry / F - Confirmed / C - Cancelled / R - Refused / M - Completed
            get
            {
                return hdnBookingStatus.Value[0];
            }
            set
            {
                hdnBookingStatus.Value = value.ToString();
                toggleBookingBtn(value);
            }
        }

        private void toggleBookingBtn(char Status)
        {
            switch (Status)
            {
                case 'R':
                case 'C':
                case 'I':
                    btnConfirmBooking.Visible = true;
                    btnCancel.Visible = false;
                    break;
                case 'F':
                    btnConfirmBooking.Visible = false;
                    btnCancel.Visible = true;
                    break;
                case 'M':
                    btnConfirmBooking.Visible = false;
                    btnCancel.Visible = false;
                    break;
                default:
                    break;
            }

        }

        public int No_Of_Invitees
        {
            get
            {
                return Int32.Parse(inpNGuests.Value);
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int Booking_Calculated_Amt
        {
            get
            {
                return Int32.Parse(inpBookingFinal.Value);
            }
            set
            {
                inpBookingFinal.Value = value.ToString();
            }
        }

        public int Discount
        {
            get
            {
                return Int32.Parse(inpDiscount.Value);
            }
            set
            {
                inpDiscount.Value = value.ToString();
            }
        }

        public string Discount_Reason
        {
            get
            {
                return inpDiscountReason.Value;
            }
            set
            {
                inpDiscountReason.Value = value;
            }
        }

        public int Booking_final_Amt
        {
            get
            {
                return Booking_Calculated_Amt - Discount;
            }
            set
            {

            }
        }

        public string RemarkOrComments
        {
            get
            {
                return inpRemarks.Value;
            }
            set
            {
                inpRemarks.Value = value;
            }
        }

        public int Paid_Amt
        {
            get
            {
                return Int32.Parse(inpPaidAmt.Value);
            }
            set
            {
                inpPaidAmt.Value = value.ToString();
            }
        }

        public int Balance_Amt
        {
            get
            {
                return Booking_final_Amt - Paid_Amt;
            }
            set
            {

            }
        }

        public int Event_No
        {
            get
            {
                return Int32.Parse(ddlEventType.SelectedItem.Value);
            }
            set
            {
                ddlEventType.SelectedValue = value.ToString();
            }

        }

        public string Event_Class
        {
            get
            {
                return ddlEventType.SelectedItem.Text;
            }
            set
            {
                //do Nothing
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            manager.Save();
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/pages/home.aspx");
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {

        }







        public int Created_By
        {
            get
            {
                return 1;
            }
            set
            {

            }
        }
    }
}