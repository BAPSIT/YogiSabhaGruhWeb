using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    [Serializable]
    public class EventTypeInfo
    {
        public int Event_no { get; set; }
        public string Event_name { get; set; }
        public string Event_description { get; set; }       
       
    }
}