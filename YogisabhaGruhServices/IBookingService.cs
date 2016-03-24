using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using YSGOps.DataModel;

namespace YSGServices
{
    public interface IBookingService
    {
        int SaveBooking(YSG_Booking_Info info);
        List<YSG_Booking_Info> GetAllBooking();

    }
}
