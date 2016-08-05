using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSGOpsWeb.Managers;

namespace YSGOpsWeb.Pages
{
    public partial class HallForm : System.Web.UI.Page,IHallForm
    {
        private int Hall_no = -1;
        private HallManager hallManager;
        protected void Page_Load(object sender, EventArgs e)
        {
            hallManager = new HallManager(this);
            if (ValidateQueryString())
            {
                if (!IsPostBack)
                {
                    this.hallManager.InitializeHall(Hall_no);
                }
            }
        }
        private bool ValidateQueryString()
        {
            string queryString = Request.QueryString["HallId"];
            bool emptyInventoryID = string.IsNullOrEmpty(queryString);
            if (!emptyInventoryID)
            {
                int itemNumber;
                if (Int32.TryParse(queryString, out itemNumber))
                {
                    this.Hall_no = itemNumber;
                    return true;
                }

            }
            return false;
        }

        public Models.HallInfo HallInfo
        {
            get
            {
                return new Models.HallInfo()
                {
                    Hall_No = this.Hall_no,
                    Capacity_chairs = Int32.Parse(txtCapacityChairs.Value),
                    Capacity_Seating = Int32.Parse(txtCapacitySeating.Value),
                    Rent_Per_Hour = Int32.Parse(txtRentPerHour.Value),
                    Hall_Name = txtHallName.Value
                };
            }
            set
            {
                if (value != null)
                {
                    txtHallName.Value = value.Hall_Name;
                    txtCapacitySeating.Value = value.Capacity_Seating.ToString();
                    txtCapacityChairs.Value = value.Capacity_chairs.ToString();
                    txtRentPerHour.Value = value.Rent_Per_Hour.ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.hallManager.AudHallInfo(HallInfo);
            Response.Redirect("/pages/home.aspx");
        }
    }
}