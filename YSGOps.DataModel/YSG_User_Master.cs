//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace YSGOps.DataModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class YSG_User_Master
    {
        public decimal user_no { get; set; }
        public string user_login_id { get; set; }
        public string User_password { get; set; }
        public string reset_password { get; set; }
        public string user_name { get; set; }
        public Nullable<decimal> Mobile_No { get; set; }
        public string Email_id { get; set; }
        public Nullable<System.DateTime> Last_login_datetime { get; set; }
        public Nullable<decimal> Role_no { get; set; }
        public string IsActive { get; set; }
        public Nullable<decimal> created_By { get; set; }
        public Nullable<System.DateTime> created_datetime { get; set; }
        public Nullable<decimal> Updated_By { get; set; }
        public Nullable<System.DateTime> Updated_Datetime { get; set; }
    
        public virtual YSG_Role_Master YSG_Role_Master { get; set; }
    }
}
