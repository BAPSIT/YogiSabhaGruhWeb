using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;
using Dapper;
namespace YSGOpsWeb.DataLayer
{
    public class BookingOperations
    {
        private string ConnectionString = ConfigurationManager.AppSettings["YogiSabhaGruhConnectionString"];
        public IBooking GetBooking(int id)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<IBooking>("", param: new { }, commandType: CommandType.StoredProcedure).FirstOrDefault<IBooking>();
        }

        public IBooking AddOrUpdateBooking(IBooking booking)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<IBooking>("", param: new { }, commandType: CommandType.StoredProcedure).FirstOrDefault<IBooking>();

        }
    }
}