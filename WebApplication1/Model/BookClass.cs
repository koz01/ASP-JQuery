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
    
    public partial class BookClass
    {
        public BookClass()
        {
            this.Categories = new HashSet<Category>();
        }
    
        public int ClassID { get; set; }
        public string ClassName { get; set; }
    
        public virtual ICollection<Category> Categories { get; set; }
    }
}
