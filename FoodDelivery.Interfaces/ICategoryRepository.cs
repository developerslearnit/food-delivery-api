using FoodDelivery.Data;
using FoodDelivery.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FoodDelivery.Interfaces
{
    public interface ICategoryRepository
    {
        IQueryable<Category> GetCategories();

        bool AddCategory(CategoryViewModel category);
    }
}
