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
    public class UserOperations
    {

        private string ConnectionString = ConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ConnectionString;

        public UserInfo GetUser(int userNo)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<UserInfo>("Get_UserInfo", param: new { user_no = userNo }, commandType: CommandType.StoredProcedure).FirstOrDefault<UserInfo>();              
        }

        public void AddOrUpdateUser(UserInfo user)
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            db.Query("AUD_YSG_User_Master", param: new
            {
                Action = user.user_no == -1 ? 'A' : 'U',
                user_no = user.user_no,
                user_name = user.user_name,
                user_login_id = user.user_login_id,
                User_password = user.User_password,
                Mobile_No = user.Mobile_No,
                Email_id = user.Email_id,
                created_By = user.created_By,
                
            }, commandType: CommandType.StoredProcedure);
        }

        public List<UserInfo> GetUserList()
        {
            IDbConnection db = new SqlConnection(this.ConnectionString);
            return db.Query<UserInfo>("Get_User_List", param: null, commandType: CommandType.StoredProcedure).ToList<UserInfo>();
        }


    }
}