using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Model;
using System.Web.Script.Serialization;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for BookHandler
    /// </summary>
    public class BookHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string name = context.Request["term"] ?? "";
            BookEntities1 db = new BookEntities1();
            var data = from e in db.Books
                       where e.BookName.StartsWith(name)
                       orderby e.BookID ascending
                       select e.BookName;

            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(data));
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}