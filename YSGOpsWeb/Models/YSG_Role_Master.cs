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
    
    public partial class YSG_Role_Master
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public YSG_Role_Master()
        {
            this.YSG_User_Master = new HashSet<YSG_User_Master>();
        }
    
        public decimal Role_no { get; set; }
        public string Role_name { get; set; }
        public string Remarks { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<YSG_User_Master> YSG_User_Master { get; set; }
    }
}