using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Models;

namespace YSGOpsWeb.Managers
{
    public interface IInventoryListView
    {
        IEnumerable<InventoryInfo> InventoryList { get; set; }
    }

    public interface IInventoryForm
    {
        InventoryInfo InventoryInfo { get; set; }
    }

    public class InventoryManager
    {
        private IInventoryListView facilityList;
        private IInventoryForm facilityForm;
        private InventoryOperations inventoryOperations;

        public InventoryManager()
        {
            this.inventoryOperations = new InventoryOperations();
        }
        public InventoryManager(IInventoryListView listView)
            : this()
        {
            this.facilityList = listView;
        }

        public InventoryManager(IInventoryForm form)
            : this()
        {
            this.facilityForm = form;
        }

        public void InitializeFacilities()
        {
            if (this.facilityList != null)
            {
                facilityList.InventoryList = inventoryOperations.GetInventoryMaster();


            }
            else
            {
                throw new ArgumentNullException("InventoryList is null. Please use InventoryManager(IFacilityListView listView) constructor to use this function");
            }
        }

        public void InitializeFacility(int facilityId)
        {
            if (this.facilityForm != null)
            {
                facilityForm.InventoryInfo = this.inventoryOperations.GetFacility(facilityId);
            }
            else
            {
                throw new ArgumentNullException("InventoryForm is null. Please use InventoryManager(IInventoryForm form) constructor");
            }
        }

        public void AddOrUpdateInventory(InventoryInfo info)
        {

            inventoryOperations.AddOrUpdateFacility(info);

        }

        public void DeleteInventory(InventoryInfo info)
        {
            this.inventoryOperations.DeleteInventoryInfo(info);
        }

    }
}