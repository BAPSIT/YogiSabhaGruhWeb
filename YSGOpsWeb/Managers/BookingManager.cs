using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Interfaces;
using YSGOpsWeb.Models;

namespace YSGOpsWeb
{
    public class BookingManager
    {

        private IBooking _bookingView;

        public BookingManager(IBooking bookingView)
        {
            this._bookingView = bookingView;
        }

        public BookingInfo GetBookingInfoById()
        {
            BookingOperations bOps = new BookingOperations();
            return bOps.GetBooking(_bookingView.Booking_Id);
        }

        public BookingInfo GetBookingInfoByNo()
        {
            BookingOperations bOps = new BookingOperations();
            return bOps.GetBookingByNo(_bookingView.Booking_No);
        }

        private SBooking sview;
        public CustomerOperations Ops { get; set; }

        public BookingManager(SBooking Searchbooking)
        {
            this.sview = Searchbooking;
        }

        public CustomerDetails GetCustomerInfoById()
        {
            CustomerOperations cOps = new CustomerOperations();
            return cOps.GetCustomer(_bookingView.Customer_no);
        }

        public IEnumerable<BookingFacilityInfo> BindBookingFacilities(int bookingNo)
        {           
            var bookingFacilityList = new BookingFacilityOperations().GetBookingFacilities(bookingNo).ToList();
           
            _bookingView.FacilityGrid.DataSource = bookingFacilityList;
            _bookingView.FacilityGrid.DataBind();
          
            return bookingFacilityList;
        }

        public void Save()
        {
            CustomerDetails customerDetails = CustomerDetails.fromICustomerDetails(_bookingView);
            CustomerOperations cOps = new CustomerOperations();
            var customerNo = cOps.AddOrUpdateCustomer(customerDetails);

            BookingInfo info = BookingInfo.fromIBooking(_bookingView);
            info.Customer_No = customerNo;
            BookingOperations bOps = new BookingOperations();
            _bookingView.Booking_No = bOps.AddOrUpdateBooking(info);

            // Add booking facilities

            //FOREACH row
            foreach (GridViewRow row in _bookingView.FacilityGrid.Rows)
            {
                Label Item_no = (Label)row.Cells[0].FindControl("lblItemNo");
                _bookingView.Item_no = Convert.ToInt32(Item_no.Text);

                TextBox Required_Qty = (TextBox)row.Cells[0].FindControl("txtRequiredQty");
                _bookingView.Required_Qty = Convert.ToInt32(Required_Qty.Text);

                TextBox Calculated_Amount = (TextBox)row.Cells[0].FindControl("txtAmount");
                if (Calculated_Amount.Text != string.Empty)
                {
                    _bookingView.Calculated_Amount = Convert.ToInt64(Calculated_Amount.Text);
                }
                else
                {
                    _bookingView.Calculated_Amount = 0;
                }

                TextBox Remarks = (TextBox)row.Cells[0].FindControl("txtRemarks");
                _bookingView.Remarks = Convert.ToString(Remarks.Text);

                BookingFacilityInfo bookingFacilityInfo = BookingFacilityInfo.fromICustomerDetails(_bookingView);
                bOps.AddOrUpdateBookingFacility(bookingFacilityInfo);
            }
            SaveFooterRowData(bOps);
        }

        private void SaveFooterRowData(BookingOperations bOps)
        {
            var footerRow = _bookingView.FacilityGrid.FooterRow;
           
           
            TextBox txtRequiredQty = (TextBox)footerRow.Cells[0].FindControl("txtRequiredQty");
            var requiredQty = Convert.ToInt32(txtRequiredQty.Text.Trim().Equals(string.Empty) ? "0" : txtRequiredQty.Text.Trim());
            if (requiredQty > 0)
            {
                var bookingFacilityInfo = new BookingFacilityInfo { Booking_No = _bookingView.Booking_No, InventoryInfo = new InventoryInfo() };
                DropDownList ddlFacility = (DropDownList)footerRow.Cells[0].FindControl("ddlFacility");
                bookingFacilityInfo.InventoryInfo.Item_name = ddlFacility.SelectedItem.Text.Trim();
                bookingFacilityInfo.Item_no = Convert.ToInt32(ddlFacility.SelectedValue.Trim().Equals(string.Empty) ? "0" : ddlFacility.SelectedValue.Trim());

                bookingFacilityInfo.Required_Qty = requiredQty;

                TextBox Calculated_Amount = (TextBox)footerRow.Cells[0].FindControl("txtAmount");
                bookingFacilityInfo.Calculated_Amount = Convert.ToInt64(Calculated_Amount.Text.Trim().Equals(string.Empty) ? "0" : Calculated_Amount.Text.Trim());

                TextBox Remarks = (TextBox)footerRow.Cells[0].FindControl("txtRemarks");
                bookingFacilityInfo.Remarks = Convert.ToString(Remarks.Text);
              
                bOps.AddOrUpdateBookingFacility(bookingFacilityInfo);
            }
        }

        public void ConfirmBooking()
        {
            BookingInfo info = BookingInfo.fromIBooking(_bookingView);
            info.Booking_Status = 'F';
            BookingOperations bOps = new BookingOperations();
            bOps.AddOrUpdateBooking(info);
        }

        public void Search()
        {
            BookingInfo info = BookingInfo.SearchBooking(sview);
            BookingOperations bOps = new BookingOperations();
            bOps.SearchBooking(info);
        }

        public List<InventoryInfo> GetInventoryMaster()
        {
            InventoryOperations bOps = new InventoryOperations();
            return bOps.GetInventoryMaster();
        }

        public List<EventTypeInfo> GetEventTypeMaster()
        {
            BookingOperations bOps = new BookingOperations();
            return bOps.GetEventTypeMaster();
        }

        public List<HallInfo> GetHallMaster()
        {
            BookingOperations bOps = new BookingOperations();
            return bOps.GetHallMaster();
        }
    }
}