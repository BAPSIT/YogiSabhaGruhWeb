using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;
using Dapper;
using YSGOpsWeb.Models;
namespace YSGOpsWeb.DataLayer
{
    public class FacilityOperations
    {
        private string conn = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;
        public IEnumerable<BookingFacilityInfo> GetBookingFacilities(int bookingNo)
        {
            IDbConnection db = new SqlConnection(this.conn);
            //var bookingFacilityList = db.Query<BookingFacilityInfo>("Get_Booking_Facilities", param: new { Booking_No = bookingNo }, commandType: CommandType.StoredProcedure);

            var bookingFacilityList = db.Query<BookingFacilityInfo, InventoryInfo, BookingFacilityInfo>("Get_Booking_Facilities",
              (a, s) =>
              {
                  a.InventoryInfo = s;
                  return a;
              },
              new { Booking_No = bookingNo }, null, true,
              splitOn: "Item_no",
               commandTimeout: null, commandType: CommandType.StoredProcedure
                 ).AsQueryable();


            //var bookingList = conn.Query<BookingInfo, EventDetails, BookingInfo>("Get_BookingInfoByDate",
            //  (a, s) =>
            //  {
            //      a.EventDetails = s;
            //      return a;
            //  },
            //  new { StartDate = From, EndDate = to }, null, true,
            //  splitOn: "Event_no", commandTimeout: null, commandType: CommandType.StoredProcedure
            //     ).AsQueryable();


            return bookingFacilityList;
        }

        public int AddOrUpdateFaciltiy(CustomerDetails Customer)
        {
            if (Customer.Customer_no == -1)
            {

                Customer.Action = 'A';
            }
            else
            {
                Customer.Action = 'U';
            }
            IDbConnection db = new SqlConnection(this.conn);
            return db.Query<int>("ADD_YSG_Customer_Info", param: Customer, commandType: CommandType.StoredProcedure).FirstOrDefault();

        }


    }
}