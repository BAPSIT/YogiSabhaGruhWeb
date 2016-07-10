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
    public partial class InventoryDetails : System.Web.UI.Page, IInventoryListView
    {
        private InventoryManager manager;
        private IEnumerable<InventoryInfo> data;
        protected void Page_Load(object sender, EventArgs e)
        {
            manager = new InventoryManager(this);
            manager.InitializeFacilities();
        }

        public IEnumerable<Models.InventoryInfo> InventoryList
        {
            get
            {
                return data;
            }
            set
            {
                data = value;
                gvInventoryList.DataSource = data;
                gvInventoryList.DataBind();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            LinkButton lnkButton = sender as LinkButton;

            if (sender != null)
            {
                string facilityID = lnkButton.CommandArgument;
                int itemNo = Int32.Parse(facilityID);
                this.manager.DeleteInventory(InventoryList.Where(inven => inven.Item_no == itemNo).FirstOrDefault());
            }

        }
    }
}