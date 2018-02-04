using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Hosting;

namespace FoodDelivery.Common
{
    public static class FileUploader
    {
        
        static DateTime now = DateTime.Now;
        static readonly string YearName = now.ToString("yyyy");
        static readonly string MonthName = now.ToString("MM");
        static readonly string DayName = now.ToString("dd");
        static string Basepath = $"~/Content/Uploads/{YearName}/{MonthName}";

        public static string Upload(HttpPostedFile file)
        {
            string returnFileName = string.Empty;
            // Check if we have a file
            if (null == file) return returnFileName;
            // Make sure the file has content
            if (!(file.ContentLength > 0)) return returnFileName;
            string fileName = file.FileName;
            string fileExt = Path.GetExtension(file.FileName);
            // Make sure we were able to determine a proper
            // extension
            if (null == fileExt) return string.Empty;


            if (!Directory.Exists(HostingEnvironment.MapPath(Basepath)))
            {
                // If it doesn't exist, create the directory
                Directory.CreateDirectory(HostingEnvironment.MapPath(Basepath));
            }
            

            fileName = fileName.Replace(fileName, Guid.NewGuid().ToString() + fileExt);
            
            // Set our full path for saving
            string path = $"{Basepath}/{fileName}";
            // Save our file
            file.SaveAs(HostingEnvironment.MapPath(path));
            returnFileName =$"{CommonUtils.GetApplicationLocation() + Basepath.Substring(2)}/{fileName}";

            return returnFileName;

        }

    }
}
