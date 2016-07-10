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
    public class InventoryOperations
    {

        private string ConnectionString = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;

        public InventoryInfo GetFacility(int facilityId)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<InventoryInfo>("Get_Inventory", param: null, commandType: CommandType.StoredProcedure).ToList<InventoryInfo>()
                .Where(f => f.Item_no == facilityId).FirstOrDefault();
        }
        public void DeleteInventoryInfo(InventoryInfo facility)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            db.Query("AUD_YSG_Inventory_Master", param: new
            {
                Item_No = facility.Item_no,
                Item_name = facility.Item_name,
                Available_Qty = facility.Available_Qty,
                Rent_per_Qty = facility.Rent_per_Qty,
                Related_Dept_No = facility.Related_Dept_no,
                Description = facility.Description,
                Created_By = facility.CreatedBy,
                Action = 'D'
            }, commandType: CommandType.StoredProcedure);
        }

        public void AddOrUpdateFacility(InventoryInfo facility)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            db.Query("AUD_YSG_Inventory_Master", param: new
            {
                Item_No = facility.Item_no,
                Item_name = facility.Item_name,
                Available_Qty = facility.Available_Qty,
                Rent_per_Qty = facility.Rent_per_Qty,
                Related_Dept_No= -1,
                Description = facility.Description,
                Created_By = facility.CreatedBy,
                Action = facility.Item_no == -1 ? 'A' : 'U'
            }, commandType: CommandType.StoredProcedure);
        }

        public List<InventoryInfo> GetInventoryMaster()
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<InventoryInfo>("Get_Inventory_Master", param: null, commandType: CommandType.StoredProcedure).ToList<InventoryInfo>();
        }


    }
}