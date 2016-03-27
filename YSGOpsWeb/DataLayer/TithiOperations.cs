using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using YSGOpsWeb.Models;
using Dapper;
namespace YSGOpsWeb.DataLayer
{
    public class TithiOperations
    {
        public IEnumerable<Tithi> GetCurrentMonthTithi()
        {
            DateTime date = DateTime.Now;
            var firstDayOfMonth = new DateTime(date.Year, date.Month, 1);
            var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);
            return GetTithiFor(firstDayOfMonth, lastDayOfMonth);
        }
        /// <summary>
        /// "Initial Catalog=YogiSabhaGruh;Data Source=192.168.0.101;User ID=sa;Password=Pass@123"
        /// </summary>
        /// <param name="From"></param>
        /// <param name="to"></param>
        /// <returns></returns>

        public IEnumerable<Tithi> GetTithiFor(DateTime From, DateTime to)
        {
            IDbConnection conn = new SqlConnection(ConfigurationManager.AppSettings["YogiSabhaGruhConnectionString"]);
            return conn.Query<Tithi>(sql: "GetTithiInfo", param: new { StartDate = From, EndDate = to }, commandType: CommandType.StoredProcedure);
        }
    }
}