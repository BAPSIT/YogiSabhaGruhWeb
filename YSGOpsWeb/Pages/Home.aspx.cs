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
                    var status = Request.QueryString["transactionStatus"].ToString();
                    var message = string.Empty;
                    switch (status)
                    {
                        case "success":
                            message = "Booking Details Saved Successfully!";
                            break;

                        case "confirm":
                            message = "Booking Details confirmed Successfully!";
                            break;

                        default:
                            break;
                    }

                    lblMessage.Text = message;
                    pnlMessage.Visible = true;                   
                }
                else
                {
                    lblMessage.Text = string.Empty;
                    pnlMessage.Visible = false;
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "Sorry! Something went wrong while loading the page. Please refresh the page or try again later.";
            }
        }
    }
}