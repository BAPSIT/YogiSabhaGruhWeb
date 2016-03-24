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
    
    public partial class YSG_Booking_Info
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public YSG_Booking_Info()
        {
            this.YSG_Booking_Catering_info = new HashSet<YSG_Booking_Catering_info>();
            this.YSG_Booking_Contact_Persons = new HashSet<YSG_Booking_Contact_Persons>();
            this.YSG_Booking_Facilities = new HashSet<YSG_Booking_Facilities>();
            this.YSG_Booking_Hall_Info = new HashSet<YSG_Booking_Hall_Info>();
            this.YSG_Booking_Payment = new HashSet<YSG_Booking_Payment>();
            this.YSG_Feedback = new HashSet<YSG_Feedback>();
            this.YSG_My_To_Do_List = new HashSet<YSG_My_To_Do_List>();
        }
    
        public decimal Booking_No { get; set; }
        public Nullable<decimal> Booking_ID { get; set; }
        public Nullable<System.DateTime> Booking_Date { get; set; }
        public Nullable<System.DateTime> Booking_FromTime { get; set; }
        public Nullable<System.DateTime> Booking_ToTime { get; set; }
        public Nullable<decimal> Event_no { get; set; }
        public string Event_Class { get; set; }
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
        public string IsActive { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Booking_Catering_info> YSG_Booking_Catering_info { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Booking_Contact_Persons> YSG_Booking_Contact_Persons { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Booking_Facilities> YSG_Booking_Facilities { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Booking_Hall_Info> YSG_Booking_Hall_Info { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Booking_Payment> YSG_Booking_Payment { get; set; }
        public virtual YSG_Event_Master YSG_Event_Master { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Feedback> YSG_Feedback { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_My_To_Do_List> YSG_My_To_Do_List { get; set; }
        public virtual YSG_Customer_Info YSG_Customer_Info { get; set; }
    }
}