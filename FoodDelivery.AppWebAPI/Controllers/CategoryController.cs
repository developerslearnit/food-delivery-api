using FoodDelivery.Common;
using FoodDelivery.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FoodDelivery.AppWebAPI.Controllers
{
    [RoutePrefix("api/v1")]
    public class CategoryController : ApiController
    {
        ICategoryRepository repo;
        public CategoryController(ICategoryRepository _repo)
        {
            this.repo = _repo;
        }

        [Route("categories")]
        [HttpGet]
        public HttpResponseMessage getMenuCategories()
        {
            var exMessage = string.Empty;
            try
            {
                var menuCats = repo.GetCategories().Select(x => new
                {
                    id = x.CategoryId,
                    name = x.Name
                });

                return Request.CreateResponse(HttpStatusCode.Found,
                    new
                    {
                        error = false,
                        count = menuCats.Count(),
                        results = menuCats
                    });
            }
            catch (Exception ex)
            {
                exMessage = CommonUtils.FormatException(ex);
            }

            return Request.CreateResponse(HttpStatusCode.Found, new { error = true, message = exMessage == string.Empty ? "An unknown error occured" : exMessage });
        }


    }
}
