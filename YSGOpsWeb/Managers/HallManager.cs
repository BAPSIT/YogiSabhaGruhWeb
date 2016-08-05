using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.DataLayer;
using YSGOpsWeb.Models;

namespace YSGOpsWeb.Managers
{
    public interface IHallListView
    {
        IEnumerable<HallInfo> Data { get; set; }
    }
    public interface IHallForm
    {
        HallInfo HallInfo { get; set; }
    }
    public class HallManager
    {
        private IHallListView hallListView;
        private IHallForm hallForm;
        public HallManager(IHallListView halllist)
        {
            this.hallListView = halllist;
        }
        public HallManager(IHallForm hallform)
        {
            this.hallForm = hallform;
        }

        public void InitializeHallList()
        {
            if (hallListView != null)
            {
                BookingOperations oper = new BookingOperations();
                this.hallListView.Data = oper.GetHallMaster();
            }
        }

        public void InitializeHall(int hallID)
        {
            if (this.hallForm != null)
            {
                BookingOperations oper = new BookingOperations();
                this.hallForm.HallInfo = oper.GetHallMaster().Where(d => d.Hall_No == hallID).FirstOrDefault();
            }

        }

        public void DeleteHall(HallInfo hallinfo)
        {
            HallOperations hallOps = new HallOperations();
            hallOps.DeleteHallInfo(hallinfo);
        }


        public void AudHallInfo(HallInfo hallInfo)
        {
            HallOperations hallOps = new HallOperations();
            hallOps.AddOrUpdateHallInfo(hallInfo);            
        }
    }


}