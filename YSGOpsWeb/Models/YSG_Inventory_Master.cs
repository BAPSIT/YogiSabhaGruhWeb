//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace YSGOpsWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class YSG_Inventory_Master
    {
        public decimal Item_no { get; set; }
        public string Item_name { get; set; }
        public Nullable<decimal> Related_Dept_No { get; set; }
        public Nullable<decimal> Available_Qty { get; set; }
        public Nullable<decimal> Rent_per_Qty { get; set; }
        public string Description { get; set; }
        public Nullable<decimal> created_By { get; set; }
        public Nullable<System.DateTime> created_datetime { get; set; }
        public Nullable<decimal> Updated_By { get; set; }
        public Nullable<System.DateTime> Updated_Datetime { get; set; }
    }
}
