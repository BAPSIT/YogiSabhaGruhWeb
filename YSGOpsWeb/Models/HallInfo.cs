using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YSGOpsWeb.Models
{
    public class HallInfo
    {
        public int Hall_No { get; set; }
        public string Hall_Name { get; set; }
        public int Capacity_Seating { get; set; }
        public int Capacity_chairs { get; set; }
        public int Rent_Per_Hour { get; set; }
    }
}