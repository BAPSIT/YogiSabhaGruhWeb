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
        public IBooking GetBooking(int id)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<IBooking>("", param: new { }, commandType: CommandType.StoredProcedure).FirstOrDefault<IBooking>();
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

    }
}