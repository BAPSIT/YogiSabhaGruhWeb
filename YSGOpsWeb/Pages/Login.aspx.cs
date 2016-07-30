using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;
namespace YSGOpsWeb.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["YogiSabhaGruhConnectionString"].ToString();
            cn.Open();
            string cmd = "select user_name,User_password from YSG_User_Master where user_login_id=@user_name and User_password=@User_password";
            SqlCommand cmd2 = new SqlCommand(cmd, cn);
            cmd2.Parameters.AddWithValue("@user_name", txtusername.Text);
            cmd2.Parameters.AddWithValue("@User_password", txtpassword.Text);
            SqlDataReader dr = cmd2.ExecuteReader();
            if (dr.Read())
            {
                Response.Redirect("~/Pages/Home.aspx");
            }
            else {
                Response.Write("Invalid attempt to login");
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Alert", "<script>alert('Invalid attempt to login')</script>", false);
            }
        }
    }
}