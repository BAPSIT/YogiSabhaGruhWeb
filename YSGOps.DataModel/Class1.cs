using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YSGOps.DataModel
{
    class Class1
    {
        public Class1()
        {
            YogiSabhaGruhEntities db = new YogiSabhaGruhEntities();
            db.YSG_Booking_Catering_info.Add(new YSG_Booking_Catering_info());
            db.SaveChanges();

        }
    }
}
