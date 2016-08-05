using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using YSGOpsWeb.Models;
using Dapper;
using System.Data;
using System.Data.SqlClient;
namespace YSGOpsWeb.DataLayer
{
    public class HallOperations
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;
        public void AddOrUpdateHallInfo(HallInfo hallInfo)
        {
            IDbConnection db = new SqlConnection(ConnectionString);
            db.Query("AUD_YSG_Hall_Info", param: new
            {
                Hall_no=hallInfo.Hall_No,
                Hall_name = hallInfo.Hall_Name,
                Capacity_Seating = hallInfo.Capacity_Seating,
                Capacity_chairs = hallInfo.Capacity_chairs,
                Rent_Per_hour = hallInfo.Rent_Per_Hour,
                Action = hallInfo.Hall_No == -1 ? 'A' : 'U'
            }, commandType: CommandType.StoredProcedure);

        }

        public void DeleteHallInfo(HallInfo hallInfo)
        {
            IDbConnection db = new SqlConnection(ConnectionString);
            db.Query("AUD_YSG_Hall_Info", param: new
            {
                Hall_no = hallInfo.Hall_No,
                Hall_name = hallInfo.Hall_Name,
                Capacity_Seating = hallInfo.Capacity_Seating,
                Capacity_chairs = hallInfo.Capacity_chairs,
                Rent_Per_hour = hallInfo.Rent_Per_Hour,
                Action = 'D'
            }, commandType: CommandType.StoredProcedure);
        }
    }
}