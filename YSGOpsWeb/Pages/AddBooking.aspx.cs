using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSGOpsWeb.Class;

namespace YSGOpsWeb.Pages
{
    public partial class AddBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //just test it
            dynamic obj = Common.GetAllBooking();
        }
    }
}