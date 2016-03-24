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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "BookingService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select BookingService.svc or BookingService.svc.cs at the Solution Explorer and start debugging.
    public class BookingService : IBookingService
    {
        YogiSabhaGruhEntities db = new YogiSabhaGruhEntities();
        public int SaveBooking(YSG_Booking_Info info)
        {
            db.YSG_Booking_Info.Add(info);
            return db.SaveChanges();
        }

        public List<YSG_Booking_Info> GetAllBooking()
        {
            List<YSG_Booking_Info> result = db.YSG_Booking_Info.Include("YSG_Booking_Catering_info").Include("YSG_Booking_Contact_Persons").
                Include("YSG_Booking_Facilities").Include("YSG_Booking_Hall_Info").Include("YSG_Booking_Payment").ToList();
            return result; 
        }

    }
}
