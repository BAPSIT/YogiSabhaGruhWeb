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
    
    public partial class YSG_Booking_Info
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public YSG_Booking_Info()
        {
            this.YSG_Booking_Payment = new HashSet<YSG_Booking_Payment>();
            this.YSG_Feedback = new HashSet<YSG_Feedback>();
        }
    
        public decimal Booking_No { get; set; }
        public Nullable<decimal> Booking_ID { get; set; }
        public Nullable<System.DateTime> Booking_Date { get; set; }
        public Nullable<System.DateTime> Booking_FromTime { get; set; }
        public Nullable<System.DateTime> Booking_ToTime { get; set; }
        public Nullable<decimal> Event_no { get; set; }
        public Nullable<decimal> Customer_no { get; set; }
        public string Booking_Status { get; set; }
        public Nullable<decimal> No_Of_Invitees { get; set; }
        public Nullable<decimal> Booking_calculated_Amt { get; set; }
        public Nullable<decimal> Discount { get; set; }
        public string Discount_Reason { get; set; }
        public Nullable<decimal> Booking_final_Amt { get; set; }
        public string RemarkOrComments { get; set; }
        public Nullable<decimal> Paid_Amt { get; set; }
        public Nullable<decimal> Balance_Amt { get; set; }
        public Nullable<decimal> created_By { get; set; }
        public Nullable<System.DateTime> created_datetime { get; set; }
        public Nullable<decimal> Updated_By { get; set; }
        public Nullable<System.DateTime> Updated_Datetime { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Booking_Payment> YSG_Booking_Payment { get; set; }
        public virtual YSG_Event_Master YSG_Event_Master { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Feedback> YSG_Feedback { get; set; }
        public virtual YSG_Customer_Info YSG_Customer_Info { get; set; }
    }
}
