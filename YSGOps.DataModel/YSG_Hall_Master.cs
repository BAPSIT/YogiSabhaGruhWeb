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
    
    public partial class YSG_Hall_Master
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public YSG_Hall_Master()
        {
            this.YSG_Booking_Hall_Info = new HashSet<YSG_Booking_Hall_Info>();
        }
    
        public decimal Hall_no { get; set; }
        public string Hall_name { get; set; }
        public Nullable<decimal> Capacity_seating { get; set; }
        public Nullable<decimal> Capacity_chairs { get; set; }
        public Nullable<decimal> Rent_per_hour { get; set; }
        public string Description { get; set; }
        public Nullable<decimal> created_By { get; set; }
        public Nullable<System.DateTime> created_datetime { get; set; }
        public Nullable<decimal> Updated_By { get; set; }
        public Nullable<System.DateTime> Updated_Datetime { get; set; }
    
        public virtual YSG_Hall_Master YSG_Hall_Master1 { get; set; }
        public virtual YSG_Hall_Master YSG_Hall_Master2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_Booking_Hall_Info> YSG_Booking_Hall_Info { get; set; }
    }
}
