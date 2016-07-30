using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YSGOpsWeb.Interfaces;

namespace YSGOpsWeb.Models
{
    [Serializable]
    public class UserInfo
    {
        public int user_no { get; set; }
        public string user_login_id { get; set; }
        public string User_password { get; set; }
        public string user_name { get; set; }
        public string Mobile_No { get; set; }
        public string Email_id { get; set; }
        public string IsActive { get; set; }
        public int created_By { get; set; }
        public DateTime created_datetime { get; set; }
        public int? Updated_By { get; set; }
        public DateTime? Updated_Datetime { get; set; }
    }
}
