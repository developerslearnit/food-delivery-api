using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace FoodDelivery.Common
{
    public static class CommonUtils
    {
        public static string GetApplicationLocation(bool isUrlSecure = false)
        {
            Uri uri = HttpContext.Current.Request.Url;
            string app = HttpContext.Current.Request.ApplicationPath;
            if (!app.EndsWith("/"))
            {
                app += "/";
            }

            if (isUrlSecure)
            {
                return String.Format("https://{0}:{1}{2}", uri.Host, uri.Port, app);
            }
            else
            {
                return String.Format("http://{0}:{1}{2}", uri.Host, uri.Port, app);
            }

        }

        public static bool IsAllowedImageExtension(string fileExt)
        {
            bool isValid = false;

            string[] allowExt = { ".jpg", ".png", ".jpeg", ".bmp" };//Add to the array if desired

            for (int i = 0; i <= allowExt.Length - 1; i++)
            {
                if (fileExt == allowExt[i])
                {
                    isValid = true;
                    break;
                }
            }
            return isValid;
        }

        public static string FormatException(Exception ex)
        {
            var message = ex.Message;

            //Add the inner exception if present (showing only the first 50 characters of the first exception)
            if (ex.InnerException == null) return message;
            if (message.Length > 50)
                message = message.Substring(0, 50);

            message += "...->" + ex.InnerException.Message;

            return message;
        }

        /// <summary>
        /// Get substring of specified number of characters on the right.
        /// </summary>
        public static string Right(this string value, int length)
        {
            if (String.IsNullOrEmpty(value)) return string.Empty;

            return value.Length <= length ? value : value.Substring(value.Length - length);
        }

        /// <summary>
        /// Get substring of specified number of characters on the left.
        /// </summary>
        /// <param name="value"></param>
        /// <param name="length"></param>
        /// <returns></returns>
        public static string Left(this string value, int length)
        {
            if (String.IsNullOrEmpty(value)) return string.Empty;

            return value.Length <= length ? value : value.Substring(0, length);
        }
    }
}
