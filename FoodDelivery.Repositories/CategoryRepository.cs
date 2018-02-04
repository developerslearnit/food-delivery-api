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
    public class CategoryRepository : BaseRepository<FoodOrderingEntities>,
        ICategoryRepository
    {
        public bool AddCategory(CategoryViewModel category)
        {
            if(category.categoryId > 0)
            {
                var newCategory = new Category()
                {
                    Description = category.description,
                    Name = category.name
                };

                DataContext.Categories.Add(newCategory);

                return DataContext.SaveChanges() > 0;
            }
            else
            {

            }

            return true;

        }

        public IQueryable<Category> GetCategories()
        {
            return DataContext.Categories;
        }
    }
}
