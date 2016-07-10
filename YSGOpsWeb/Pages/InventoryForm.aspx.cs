using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YSGOpsWeb.Managers;

namespace YSGOpsWeb.Pages
{
    public partial class InventoryForm : System.Web.UI.Page, IInventoryForm
    {
        private int Item_No = -1;
        private InventoryManager mgr;
        protected void Page_Load(object sender, EventArgs e)
        {
            mgr = new InventoryManager(this);

            if (ValidateQueryString())
            {
                if (!IsPostBack)
                {
                    this.mgr.InitializeFacility(Item_No);
                }
            }



        }

        private bool ValidateQueryString()
        {
            string queryString = Request.QueryString["InventoryId"];
            bool emptyInventoryID = string.IsNullOrEmpty(queryString);
            if (!emptyInventoryID)
            {
                int itemNumber;
                if (Int32.TryParse(queryString, out itemNumber))
                {
                    this.Item_No = itemNumber;
                    return true;
                }

            }
            return false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            this.mgr.AddOrUpdateInventory(InventoryInfo);

        }

        public Models.InventoryInfo InventoryInfo
        {
            get
            {
                return new Models.InventoryInfo()
                {
                    Item_name = txtItemName.Value,
                    Available_Qty = Int32.Parse(txtAvailableQty.Value),
                    Rent_per_Qty = float.Parse(txtRentPerQty.Value),
                    Item_no = this.Item_No
                };
            }
            set
            {
                if (value != null)
                {
                    txtItemName.Value = value.Item_name;
                    txtAvailableQty.Value = value.Available_Qty.ToString();
                    txtRentPerQty.Value = value.Rent_per_Qty.ToString();
                }

            }
        }
    }
}