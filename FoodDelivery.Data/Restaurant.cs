//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FoodDelivery.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Restaurant
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Restaurant()
        {
            this.Orders = new HashSet<Order>();
            this.RestaurantMenus = new HashSet<RestaurantMenu>();
        }
    
        public long RestaurantId { get; set; }
        public string Name { get; set; }
        public double Rating { get; set; }
        public Nullable<decimal> DeliveryFee { get; set; }
        public Nullable<int> AvDeliveryTime { get; set; }
        public string Logo { get; set; }
        public string RestaurantPhoto { get; set; }
        public string Address { get; set; }
        public decimal MinOrderPrice { get; set; }
        public Nullable<double> Lat { get; set; }
        public Nullable<double> Lng { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Orders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RestaurantMenu> RestaurantMenus { get; set; }
    }
}
