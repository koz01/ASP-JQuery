//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Category
    {
        public Category()
        {
            this.Books = new HashSet<Book>();
        }
    
        public long CategoryId { get; set; }
        public string CategoryName { get; set; }
        public Nullable<int> ClassID { get; set; }
    
        public virtual ICollection<Book> Books { get; set; }
        public virtual BookClass BookClass { get; set; }
    }
}
