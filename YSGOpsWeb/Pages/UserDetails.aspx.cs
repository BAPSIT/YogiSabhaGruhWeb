using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSGOpsWeb.Managers;
using YSGOpsWeb.Models;

namespace YSGOpsWeb.Pages
{
    public partial class UserDetails : System.Web.UI.Page, IUserListView
    {
        private UserManager manager;
        private IEnumerable<UserInfo> data;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = new UserManager(this);
            manager.InitializeUserList();
        }

        public IEnumerable<Models.UserInfo> UserList
        {
            get
            {
                return data;
            }
            set
            {
                data = value;
                gvUserList.DataSource = data;
                gvUserList.DataBind();
            }
        }

     
    }
}