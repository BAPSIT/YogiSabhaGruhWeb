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
    public class BookingOperations
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;
        public BookingInfo GetBooking(int id)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<BookingInfo>("Get_BookingInfoById", param: new { booking_id = id }, commandType: CommandType.StoredProcedure).FirstOrDefault<BookingInfo>();
        }

        public BookingInfo GetBookingByNo(int id)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<BookingInfo>("Get_BookingInfoByNo", param: new { booking_no = id }, commandType: CommandType.StoredProcedure).FirstOrDefault<BookingInfo>();
        }

        public int AddOrUpdateBooking(BookingInfo booking)
        {

            if (booking.Booking_Id == -1)
            {
                booking.Booking_Id = int.Parse(booking.Booking_Date.ToString("yyMMdd") + DateTime.Now.ToString("hhmm"));
                booking.Action = 'A';
            }
            else
            {
                booking.Action = 'U';
            }


            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<int>("AUD_YSG_Booking_Info", param: booking, commandType: CommandType.StoredProcedure).FirstOrDefault();

        }

        public IEnumerable<BookingInfo> GetBookingByDate(DateTime From, DateTime to)
        {
            IDbConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString);

            var bookingList = conn.Query<BookingInfo, EventDetails, BookingInfo>("Get_BookingInfoByDate",
                (a, s) =>
                {
                    a.EventDetails = s;
                    return a;
                },
                new { StartDate = From, EndDate = to }, null, true,
                splitOn: "Event_no", commandTimeout: null, commandType: CommandType.StoredProcedure
                   ).AsQueryable();

            return bookingList;
        }

        public void SearchBooking(BookingInfo Searchbooking)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            db.Query("LIST_YSG_Booking_Info", param: Searchbooking, commandType: CommandType.StoredProcedure);


        }

        public void AddOrUpdateBookingFacility(BookingFacilityInfo bookingFacilityInfo)
        {

            if (bookingFacilityInfo.Booking_Facility_No < 1)
            {
                bookingFacilityInfo.Action = 'A';
            }
            else
            {
                bookingFacilityInfo.Action = 'U';
            }

            BookingFacilityInfoParam param1 = new BookingFacilityInfoParam();

          
            param1.Calculated_Amount = bookingFacilityInfo.Calculated_Amount;
            param1.Booking_No = bookingFacilityInfo.Booking_No;
            param1.Item_no = bookingFacilityInfo.Item_no;
            param1.Required_Qty = bookingFacilityInfo.Required_Qty;
            param1.Remarks = bookingFacilityInfo.Remarks;
         


            IDbConnection db = new SqlConnection(this.ConnectionString);
            db.Query("AUD_YSG_Booking_Facilities", param: param1, commandType: CommandType.StoredProcedure);

        }

        public List<InventoryInfo> GetInventoryMaster()
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<InventoryInfo>("Get_Inventory_Master", param: null, commandType: CommandType.StoredProcedure).ToList<InventoryInfo>();
        }
    }
}