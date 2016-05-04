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

        public void BindBookingFacilities(int bookingNo)
        {
            if (bookingNo > 0)
            {
                var bookingFacilityList = new FacilityOperations().GetBookingFacilities(bookingNo).ToList();
                //return bookingFacilityList;
                _bookingView.FacilityGrid.DataSource = bookingFacilityList;
                _bookingView.FacilityGrid.DataBind();
            }
            else
            {
                List<BookingFacilityInfo> list = new List<BookingFacilityInfo>();
                _bookingView.FacilityGrid.DataSource = list;
                _bookingView.FacilityGrid.DataBind();
            }
        }

        public void Save()
        {
            CustomerDetails customerDetails = CustomerDetails.fromICustomerDetails(_bookingView);
            CustomerOperations cOps = new CustomerOperations();
            var customerNo = cOps.AddOrUpdateCustomer(customerDetails);

            BookingInfo info = BookingInfo.fromIBooking(_bookingView);
            info.Customer_No = customerNo;
            BookingOperations bOps = new BookingOperations();
            bOps.AddOrUpdateBooking(info);

            //TODO : set it  booking
            _bookingView.Booking_No = 1;

            // Add booking facilities

            //FOREACH row
            BookingFacilityInfo bookingFacilityInfo = BookingFacilityInfo.fromICustomerDetails(_bookingView);
            bOps.AddOrUpdateBookingFacility(bookingFacilityInfo);



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

    }

}