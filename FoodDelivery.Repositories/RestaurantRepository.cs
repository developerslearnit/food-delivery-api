using FoodDelivery.Data;
using FoodDelivery.Interfaces;
using FoodDelivery.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodDelivery.Repositories
{
    public class RestaurantRepository : BaseRepository<FoodOrderingEntities>,
        IRestaurantRepository
    {
        public bool AddRestaurant(RestaurantViewModel restaurant)
        {
            var newRestaurant = new FoodDelivery.Data.Restaurant()
            {
                Name = restaurant.name,
                Lat =restaurant.latitude,
                RestaurantPhoto = string.Empty,
                Address =restaurant.address,
                AvDeliveryTime =restaurant.averageDeliveryTime,
                DeliveryFee =restaurant.deliveryFee,
                Lng =restaurant.longitude,
                Logo =string.Empty,
                MinOrderPrice =restaurant.minOrderPrice,
                Rating =restaurant.rating               
            };

            DataContext.Restaurants.Add(newRestaurant);

            return DataContext.SaveChanges() > 0;
        }

        public IQueryable<RestaurantViewModel> GetRestaurants()
        {
            return DataContext.Restaurants.Select(r => new RestaurantViewModel
            {
                id = r.RestaurantId,
                address = r.Address,
                averageDeliveryTime = r.AvDeliveryTime ?? 0,
                deliveryFee = r.DeliveryFee ?? 0,
                latitude = r.Lat ?? 0.0,
                longitude = r.Lng ?? 0.0,
                logo = r.Logo,
                minOrderPrice = r.MinOrderPrice,
                name = r.Name,
                rating = r.Rating,
                restaurantPhoto = r.RestaurantPhoto
            });
        }

        public void UpdateRestaurant(RestaurantViewModel restaurant, long id)
        {
            var targetRestaurant = DataContext.Restaurants.Find(id);
            if (targetRestaurant != null)
            {
                targetRestaurant.Name = restaurant.name;
                targetRestaurant.Lat = restaurant.latitude;
                targetRestaurant.Address = restaurant.address;
                targetRestaurant.AvDeliveryTime = restaurant.averageDeliveryTime;
                targetRestaurant.DeliveryFee = restaurant.deliveryFee;
                targetRestaurant.Lng = restaurant.longitude;
                targetRestaurant.MinOrderPrice = restaurant.minOrderPrice;
                targetRestaurant.Rating = restaurant.rating;

                DataContext.SaveChanges();
            }
        }

        public void UploadRestaurantLogo(long id,string logoImg)
        {
            var targetRestaurant = DataContext.Restaurants.Find(id);
            if (targetRestaurant != null)
            {
                targetRestaurant.Logo = logoImg;             

                DataContext.SaveChanges();
            }
        }

        public void UploadRestaurantPhoto(long id, string photoImg)
        {
            var targetRestaurant = DataContext.Restaurants.Find(id);
            if (targetRestaurant != null)
            {
                targetRestaurant.RestaurantPhoto = photoImg;

                DataContext.SaveChanges();
            }
        }
    }
}
