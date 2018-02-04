using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodDelivery.ViewModels
{
    public class RestaurantViewModel
    {
        public long id { get; set; }
        public string name { get; set; }
        public double rating { get; set; }
        public decimal deliveryFee { get; set; }
        public int averageDeliveryTime { get; set; }
        public string logo { get; set; }
        public string restaurantPhoto { get; set; }
        public string address { get; set; }
        public decimal minOrderPrice { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }
    }
}
