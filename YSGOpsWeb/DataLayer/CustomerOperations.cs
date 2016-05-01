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
    public class CustomerOperations
    {
        private string ConnectionString = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;
        public CustomerDetails GetCustomer(int id)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<CustomerDetails>("Get_CustomerInfoById", param: new { Customer_no = id }, commandType: CommandType.StoredProcedure).FirstOrDefault<CustomerDetails>();
        }

        public int AddOrUpdateCustomer(CustomerDetails Customer)
        {
            if (Customer.Customer_no == -1)
            {
               
                Customer.Action = 'A';
            }
            else
            {
                Customer.Action = 'U';
            }
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<int>("ADD_YSG_Customer_Info", param: Customer, commandType: CommandType.StoredProcedure).FirstOrDefault();

        }

     
    }
}