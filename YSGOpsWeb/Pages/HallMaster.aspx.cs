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
    public partial class HallMaster : System.Web.UI.Page, IHallListView
    {
        private HallManager manager;
        private IEnumerable<HallInfo> data;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = new HallManager(this);
            manager.InitializeHallList();
        }

        protected void lnkButtonDelete_Click(object sender, EventArgs e)
        {
            LinkButton lnkButton = sender as LinkButton;
            if (lnkButton != null)
            {
                string facilityID = lnkButton.CommandArgument;
                int itemNo = Int32.Parse(facilityID);
                this.manager.DeleteHall(Data.Where(hall => hall.Hall_No == itemNo).FirstOrDefault());
            }

        }

        public IEnumerable<Models.HallInfo> Data
        {
            get
            {
                return data;
            }
            set
            {
                data = value;
                gvHallInfo.DataSource = value;
                gvHallInfo.DataBind();
            }
        }
    }
}