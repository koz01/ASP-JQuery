using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using WebApplication1.Model;

namespace WebApplication1.Controller
{
    public class BookController
    {

        public static string getBook()
        {
            BookEntities1 db = new BookEntities1();
            var book = from b in db.Books orderby b.BookID select b;

            StringBuilder sb = new StringBuilder();

            sb.Append("<table border ='1'>");
            foreach (Book b in book)
            {
                sb.Append("<tr><td>");
                sb.Append(b.BookName);
                sb.Append("</td><td>");
                sb.Append(b.Author);
                sb.Append("</td><td>");
                sb.Append(b.BookCode);
                sb.Append("</td></tr>");
            }

            sb.Append("</table>");
            return sb.ToString();
        }

        public static List<Book> SelectBooks()
        {
            BookEntities1 db = new BookEntities1();
            var data = from e in db.Books
                       orderby e.BookID ascending
                       select e;
            return data.ToList();
        }

        public static List<string> getBookName(string name)
        {
            BookEntities1 db = new BookEntities1();
            var data = from e in db.Books
                       where e.BookName.StartsWith(name)
                       orderby e.BookID ascending
                       select e.BookName;
            return data.ToList();

            
        }
    }
}