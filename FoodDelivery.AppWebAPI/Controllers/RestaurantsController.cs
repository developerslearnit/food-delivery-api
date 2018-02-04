using FoodDelivery.Common;
using FoodDelivery.Interfaces;
using FoodDelivery.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace FoodDelivery.AppWebAPI.Controllers
{
    [RoutePrefix("api/v1")]
    public class RestaurantsController : ApiController
    {
        IRestaurantRepository repo;
        
        public RestaurantsController(IRestaurantRepository _repo)
        {
            this.repo = _repo;
        }

        static DataTable GetTable()
        {
            SqlConnection connection = new SqlConnection("data source=ITILP_L001\\SERVER2012;initial catalog=FoodOrdering;persist security info=True;user id=ibs;password=vaug");
            // Here we create a DataTable with four columns.
            DataTable table = new DataTable();
            SqlDataAdapter adapter;
            SqlCommand command = new SqlCommand();

            connection.Open();
            command.Connection = connection;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_GetRestaurants";
            adapter = new SqlDataAdapter(command);
            adapter.Fill(table);
            return table;
        }

        [Route("restaurants")]
        [HttpGet]
        public HttpResponseMessage getRestaurants()
        {
            var exMessage = string.Empty;
            try
            {
                var restaurantList = repo.GetRestaurants();

                var cust = GetTable();
                
                return Request.CreateResponse(HttpStatusCode.OK,
                    new
                    {
                        error = false,
                        count = restaurantList.Count(),
                        results = restaurantList
                    });
            }
            catch (Exception ex)
            {
                exMessage = CommonUtils.FormatException(ex);
            }

            return Request.CreateResponse(HttpStatusCode.Found, new { error = true, message = exMessage == string.Empty ? "An unknown error occured" : exMessage });
        }

        [Route("restaurants")]
        [HttpPost]
        public HttpResponseMessage saveRestaurant([FromBody] RestaurantViewModel model)
        {
            var exMessage = string.Empty;
            try
            {
                if (repo.AddRestaurant(model))
                {
                    return Request.CreateResponse(HttpStatusCode.Created, new
                    {
                        error = false,
                        status = "created"
                    });
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.Created, new
                    {
                        error = true,
                        message = exMessage == string.Empty ? "An unknown error occured" : exMessage
                    });
                }
            }
            catch (Exception ex)
            {
                exMessage = CommonUtils.FormatException(ex);
            }
            return Request.CreateResponse(HttpStatusCode.Found, new { error = true, message = exMessage == string.Empty ? "An unknown error occured" : exMessage });

        }


        [Route("restaurants/{id}")]
        [HttpPut]
        public HttpResponseMessage updateRestaurant([FromBody] RestaurantViewModel model, long id)
        {

            var exMessage = string.Empty;
            try
            {
                repo.UpdateRestaurant(model, id);

                return Request.CreateResponse(HttpStatusCode.Found, new
                {
                    error = false,
                    status = "created"
                });

            }
            catch (Exception ex)
            {
                exMessage = CommonUtils.FormatException(ex);
            }
            return Request.CreateResponse(HttpStatusCode.Found, new { error = true, message = exMessage == string.Empty ? "An unknown error occured" : exMessage });

        }

        [Route("restaurants/{id}/logo")]
        [HttpPut]
        public HttpResponseMessage uploadRestaurantLogo(long id)
        {

            var exMessage = string.Empty;
            try
            {
                var request = HttpContext.Current.Request;
                if(request.Files.Count > 0)
                {
                    var postedFile = request.Files[0];
                    string imgPath = FileUploader.Upload(postedFile);
                    if (!string.IsNullOrEmpty(imgPath))
                    {
                        repo.UploadRestaurantLogo(id, imgPath);
                        return Request.CreateResponse(HttpStatusCode.Found, new
                        {
                            error = false,
                            status = "created"
                        });
                    }
                }               

            }
            catch (Exception ex)
            {
                exMessage = CommonUtils.FormatException(ex);
            }
            return Request.CreateResponse(HttpStatusCode.Found, new { error = true, message = exMessage == string.Empty ? "An unknown error occured" : exMessage });

        }

        [Route("restaurants/{id}/photo")]
        [HttpPut]
        public HttpResponseMessage uploadRestaurantPhoto(long id)
        {

            var exMessage = string.Empty;
            try
            {
                var request = HttpContext.Current.Request;
                if (request.Files.Count > 0)
                {
                    var postedFile = request.Files[0];
                    string imgPath = FileUploader.Upload(postedFile);
                    if (!string.IsNullOrEmpty(imgPath))
                    {
                        repo.UploadRestaurantPhoto(id, imgPath);
                        return Request.CreateResponse(HttpStatusCode.Found, new
                        {
                            error = false,
                            status = "created"
                        });
                    }
                }

            }
            catch (Exception ex)
            {
                exMessage = CommonUtils.FormatException(ex);
            }
            return Request.CreateResponse(HttpStatusCode.Found, new { error = true, message = exMessage == string.Empty ? "An unknown error occured" : exMessage });

        }
    }
}
