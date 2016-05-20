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
    public class FindBookingOperations
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;

        public void SearchBooking(FindBookingOperations Searchbooking)
        {
           
        }

        public DataSet SearchBooking(DateTime fromdate, DateTime todate)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);

            FindBookingInfo info = new FindBookingInfo();
            
            DataSet ds = new DataSet();
            
            IDataReader reader;

            info.Search_Booking_FromDate = fromdate;
            info.Search_Booking_ToDate = todate;
            reader = db.ExecuteReader("LIST_YSG_Booking_Info", param: new { Booking_From = fromdate, Booking_To = todate }, commandType: CommandType.StoredProcedure);

            ds.Load(reader, LoadOption.OverwriteChanges, "tbl");

            return ds;

        }

        public void CancelBooking(Double BookingNo, string Cancellation_Reason, string Cancellation_Description, Double Cancellation_Refunded_Amt, DateTime Cancellation_Datetime)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            db.Query("AUD_YSG_Booking_Info", param: new { Booking_No = BookingNo, Action = "C", Cancellation_Reason = Cancellation_Reason, Cancellation_Description = Cancellation_Description, Cancellation_Refunded_Amt = Cancellation_Refunded_Amt, Cancellation_Datetime = Cancellation_Datetime }, commandType: CommandType.StoredProcedure);
        }
    }
}