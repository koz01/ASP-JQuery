using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using WebApplication1.Model;
using System.Web.Script.Serialization;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public void getClass()
        {
            BookEntities1 db = new BookEntities1();
            var data = from e in db.BookClasses
                       orderby e.ClassID ascending
                       select new{
                           e.ClassID,
                           e.ClassName
                       };
            
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(data));
        }

        [WebMethod]
        public void getCategory(int classID)
        {
            BookEntities1 db = new BookEntities1();
            try
            {
                var data = from e in db.Categories
                           where e.ClassID == classID
                           orderby e.CategoryId ascending
                           select e;

                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(data));
            }catch(Exception e)
            {
                throw e;
            }
        }

        [WebMethod]
        public void getBookName(long categoryID )
        {
            BookEntities1 db = new BookEntities1();
            var data = from e in db.Books
                       where e.CategoryId == categoryID
                       orderby e.BookID ascending
                       select e;

            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(data));
        }
    }
}
