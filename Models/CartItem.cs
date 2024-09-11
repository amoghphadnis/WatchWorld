using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WatchWorld.Models
{
    public class CartItem
    {
        public int WatchID { get; set; }
        public string WatchName { get; set; }
        public string WatchBrand { get; set; }
        public decimal WatchPrice { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; } 
    }
}
