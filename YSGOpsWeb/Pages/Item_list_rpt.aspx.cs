using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YSGOpsWeb.Pages
{
    public partial class Item_list_rpt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.DataBind();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/pages/Item_list_rpt.aspx?sdate=" + TextBox1.Text + "&edate=" + TextBox2.Text + "&hallno=" + DropDownList1.SelectedValue + "");
        }
    }
}