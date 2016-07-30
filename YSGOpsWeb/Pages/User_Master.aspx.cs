using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSGOpsWeb.Common;
using YSGOpsWeb.Managers;

namespace YSGOpsWeb.Pages
{
    public partial class User_Master : System.Web.UI.Page, IUserForm
    {
        private int User_No = -1;
        private UserManager mgr;

        public Models.UserInfo UserInfo
        {
            get
            {
                return new Models.UserInfo()
                {
                    user_name = txtFullName.Value.Trim(),
                    user_login_id = txtUserId.Value.Trim(),
                    User_password = txtPassword.Value.Trim(),
                    Mobile_No = txtMobileNumber.Value.Trim(),
                    Email_id = txtEmail.Value.Trim(),
                    user_no = this.User_No,
                    created_By = Application_Constants.SYSTEM_USER_ID,
                               
                };
            }
            set
            {
                if (value != null)
                {
                    txtFullName.Value = value.user_name;
                    txtUserId.Value = value.user_login_id;
                    txtMobileNumber.Value = value.Mobile_No;
                    txtEmail.Value = value.Email_id;
                }

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            mgr = new UserManager(this);

            if (ValidateQueryString())
            {
                if (!IsPostBack)
                {
                    this.mgr.InitializeUser(User_No);
                }
            }
        }

        private bool ValidateQueryString()
        {
            string queryString = Request.QueryString["UserNo"];
            bool emptyInventoryID = string.IsNullOrEmpty(queryString);
            if (!emptyInventoryID)
            {
                int userNumber;
                if (Int32.TryParse(queryString, out userNumber))
                {
                    this.User_No = userNumber;
                    return true;
                }

            }
            return false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.mgr.AddOrUpdateUser(UserInfo);

            Response.Redirect("/pages/home.aspx");
        }
    }
}