using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSGOpsWeb.Interfaces;
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
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int Booking_Id
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
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
                return DateTime.ParseExact(inpBookingDate.Value+" "+inpBookingFrom.Value, "dd/MM/yyyy h:mm tt", CultureInfo.InvariantCulture);
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

        public Models.EventDetails Event_Details
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public char Booking_Status
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
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

        public int Booking_Calculated_Amount
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int Discount
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public string Discoutn_Reason
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int Booking_final_Amt
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public string RemarksOrComments
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int Paid_Amt
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public int Balance_Amt
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
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
    }
}