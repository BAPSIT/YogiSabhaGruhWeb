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

        public void AddOrUpdateBooking(BookingInfo booking)
        {

            if (booking.Booking_Id == -1)
            {
                booking.Booking_Id = booking.Booking_Date.Year * 10000 + booking.Booking_Date.Month * 100 + booking.Booking_Date.Day;
                booking.Action = 'A';
            }
            else
            {
                booking.Action = 'U';
            }


            IDbConnection db = new SqlConnection(this.ConnectionString);
            db.Query("AUD_YSG_Booking_Info", param: booking, commandType: CommandType.StoredProcedure);

        }

        public IEnumerable<BookingInfo> GetBookingByDate(DateTime From, DateTime to)
        {
            IDbConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString);
            //var bookingList = conn.Query<BookingInfo>(sql: "Get_BookingInfo", param: new { StartDate = From, EndDate = to }, commandType: CommandType.StoredProcedure);
            //var bookingList = conn.Query<BookingInfo>(sql: "Get_BookingInfo", param: new { StartDate = From, EndDate = to }, commandType: CommandType.StoredProcedure);

            //            var resultList = conn.Query<BookingInfo, EventDetails, BookingInfo>(@"
            //                    SELECT b.*, e.*   FROM YSG_Booking_Info b JOIN YSG_Event_Master e ON b.Event_no = e.Event_no                   
            //                    ", (a, s) =>
            //                     {
            //                         a.EventDetails = s;
            //                         return a;
            //                     },
            //                     splitOn: "Event_no"
            //                     ).AsQueryable();


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
    }
}