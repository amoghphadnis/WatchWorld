using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WatchWorld.Models;

namespace WatchWorld
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCartItems();
            }
        }

        protected void lvCart_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            List<CartItem> cart = Session["CartItems"] as List<CartItem>;

            if (e.CommandName == "IncreaseQty")
            {
                int watchID = Convert.ToInt32(e.CommandArgument);
                CartItem item = cart.FirstOrDefault(x => x.WatchID == watchID);
                if (item != null)
                {
                    item.Quantity++;
                }
            }
            else if (e.CommandName == "DecreaseQty")
            {
                int watchID = Convert.ToInt32(e.CommandArgument);
                CartItem item = cart.FirstOrDefault(x => x.WatchID == watchID);
                if (item != null && item.Quantity > 1)
                {
                    item.Quantity--;
                }
            }

            // Save updated cart back to the session
            Session["CartItems"] = cart;
            BindCartItems();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int watchID = Convert.ToInt32(btn.CommandArgument);

            List<CartItem> cart = Session["CartItems"] as List<CartItem>;
            CartItem itemToRemove = cart.FirstOrDefault(x => x.WatchID == watchID);
            if (itemToRemove != null)
            {
                cart.Remove(itemToRemove);
            }

            Session["CartItems"] = cart;
            BindCartItems();
        }

        private void BindCartItems()
        {
            List<CartItem> cart = Session["CartItems"] as List<CartItem> ?? new List<CartItem>();
            lvCart.DataSource = cart;
            lvCart.DataBind();

            // Calculate and display total
            decimal total = cart.Sum(item => item.WatchPrice * item.Quantity);
            lblTotal.InnerText = total.ToString("C");
        }
    }
}
