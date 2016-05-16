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
            try
            {
                manager = new BookingManager(this);
                pnlMessage.Visible = false;

                if (!this.IsPostBack)
                {
                    if (Request.QueryString["booking_id"] != null)
                    {
                        hdnBookingId.Value = Request.QueryString["booking_id"].ToString();
                        SetBookingDetails();
                        SetCustomerDetails();
                        SetBookingFacility();
                    }
                    else
                    {
                        SetBookingFacility();
                    }
                }
            }
            catch (Exception)
            {
                pnlMessage.Visible = true;
                lblMessage.Text = "Sorry! Something went wrong while loading the page. Please refresh the page or try again later.";
            }

        }

        private void SetBookingFacility()
        {
            manager.BindBookingFacilities(Booking_No);
        }


        #region #Public Properties
        public int Booking_No
        {
            get
            {
                return Int32.Parse(hdnBookingNo.Value);
            }
            set
            {
                hdnBookingNo.Value = value.ToString();
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
                inpBookingID.Value =  value.ToString();
            }
        }

        public DateTime Booking_Date
        {
            get
            {
                return DateTime.ParseExact(inpBookingDate.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture);
            }
            set
            {
                //inpBookingDate.Value = value.ToString("MM/dd/yyyy");
                inpBookingDate.Value =  value.ToString("MM/dd/yyyy").Replace('-', '/');
            }

        }

        public DateTime Booking_FromTime
        {
            get
            {
                return DateTime.ParseExact(inpBookingDate.Value + " " + inpBookingFrom.Value, "MM/dd/yyyy h:mm tt", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingFrom.Value = value.ToString("hh:mm tt");
            }
        }

        public DateTime Booking_ToTime
        {
            get
            {
                return DateTime.ParseExact(inpBookingDate.Value + " " + inpBookingTo.Value, "MM/dd/yyyy h:mm tt", CultureInfo.InvariantCulture);
            }
            set
            {
                inpBookingTo.Value = value.ToString("hh:mm tt");
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
                switch (value)
                {
                    case 'I':
                        inpBookingStatus.Value = "Inquiry";
                        break;

                    case 'F':
                        inpBookingStatus.Value = "Confirmed";
                        break;

                    case 'C':
                        inpBookingStatus.Value = "Cancelled";
                        break;                  

                    default:
                        inpBookingStatus.Value = string.Empty;
                        break;
                }


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
                inpNGuests.Value = value.ToString();
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
                return Int32.Parse(ddlEventType.SelectedItem.Value.Trim());
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
                return ddlEventCategory.SelectedValue.Trim();
            }
            set
            {
                ddlEventCategory.SelectedValue = value.ToString();
            }
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

        public int Customer_no
        {
            get
            {
                return Int32.Parse(hdnCustomerNo.Value);
            }
            set
            {
                hdnCustomerNo.Value = value.ToString();
            }
        }

        public string Customer_name
        {
            get
            {
                return inpName.Value;
            }
            set
            {
                inpName.Value = value.ToString();
            }
        }
        public string Customer_Address
        {
            get
            {
                return textAreaAddress.Value;
            }
            set
            {
                textAreaAddress.Value = value;
            }
        }
        public string Landline_No { get; set; }
        public string Fax_No { get; set; }
        public string Mobile_No
        {
            get
            {
                return inpPrimaryPhone.Value;
            }
            set
            {
                inpPrimaryPhone.Value = value;
            }
        }
        public string Email_id
        {
            get
            {
                return inpEmail.Value;
            }
            set
            {
                inpEmail.Value = value;
            }
        }
        public string Customer_Status { get; set; }
        public string Referred_By { get; set; }
        public string Customer_Type { get; set; }
        public string Comments { get; set; }
        // public int Created_By { get; set; }


        public GridView FacilityGrid
        {
            get { return gridFacilty; }
        }

        public int Item_no { get; set; }
        public int Required_Qty { get; set; }
        public float Calculated_Amount { get; set; }
        public string Remarks { get; set; }
        public int Hall_no
        {
            get
            {
                return Int32.Parse(ddlHall.SelectedItem.Value.Trim());
            }
            set
            {
                ddlHall.SelectedValue = value.ToString();
            }

        }
        #endregion

        #region #Event Handlers
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                manager.Save();
                Response.Redirect("~/Pages/Home.aspx?transactionStatus=success");
                pnlMessage.Visible = false;
                lblMessage.Text = string.Empty;
            }
            catch (Exception)
            {
                pnlMessage.Visible = true;
                lblMessage.Text = "Sorry! something went wrong. Please try again later.";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/pages/home.aspx");
        }

        protected void btnConfirmBooking_Click(object sender, EventArgs e)
        {
            Booking_Status = 'F';
            manager.Save();
        }

        protected void btnCancelBooking_Click(object sender, EventArgs e)
        {

        }

        #endregion

        #region #Private Methods
        private void SetBookingDetails()
        {
            var booking = manager.GetBookingInfoById();
            if (booking != null)
            {
                Booking_Id = booking.Booking_Id;
                Booking_No = booking.Booking_No;

               
                Booking_Date = booking.Booking_Date;
                Booking_FromTime = booking.Booking_FromTime;
                Booking_ToTime = booking.Booking_ToTime;
                Booking_Status = booking.Booking_Status;

                Event_No = booking.Event_No;
                Event_Class = booking.Event_Class;
                No_Of_Invitees = booking.No_Of_Invitees;

                Booking_Calculated_Amt = booking.Booking_Calculated_Amt;
                Discount = booking.Discount;
                Discount_Reason = booking.Discount_Reason;
                Booking_final_Amt = booking.Booking_final_Amt;
                RemarkOrComments = booking.RemarkOrComments;
                Paid_Amt = booking.Paid_Amt;
                Balance_Amt = booking.Balance_Amt;
                Created_By = booking.Created_By;

                Customer_no = booking.Customer_No;
                Hall_no = booking.Hall_no;
            }
        }

        private void SetCustomerDetails()
        {
            var customer = manager.GetCustomerInfoById();
            if (customer != null)
            {
                Customer_no = customer.Customer_no;
                Customer_name = customer.Customer_name;
                Customer_Address = customer.Customer_Address;
                Landline_No = customer.Landline_No;
                Mobile_No = customer.Mobile_No;
                Email_id = customer.Email_id;
            }
        }
        #endregion



    }
}