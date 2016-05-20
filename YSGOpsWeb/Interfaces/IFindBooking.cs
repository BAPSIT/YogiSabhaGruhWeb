using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using YSGOpsWeb.Models;

namespace YSGOpsWeb.Interfaces
{
    public interface IFindBooking
    {
        DateTime Search_Booking_FromDate { get; set; }
        DateTime Search_Booking_ToDate { get; set; }
    }
}
