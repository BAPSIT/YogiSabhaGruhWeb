using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YSGOpsWeb.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["transactionStatus"] != null)
                {
                    lblMessage.Text = "Booking Details Saved Successfully!";
                    Request.QueryString.Clear();
                }
                else
                    lblMessage.Text = string.Empty;
            }
            catch (Exception)
            {
                lblMessage.Text = "Sorry! Something went wrong while loading the page. Please refresh the page or try again later.";
            }
        }
    }
}