using FoodDelivery.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodDelivery.Interfaces
{
   public interface IRestaurantRepository
    {
        IQueryable<RestaurantViewModel> GetRestaurants();
        bool AddRestaurant(RestaurantViewModel restaurant);

        void UpdateRestaurant(RestaurantViewModel restaurant,long id);
        void UploadRestaurantLogo(long id, string logoImg);
        void UploadRestaurantPhoto(long id, string photoImg);
    }
}
