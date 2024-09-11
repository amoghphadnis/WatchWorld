using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WatchWorld
{
    public partial class Checkout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            // Simulate placing the order by clearing the cart
            Session["CartItems"] = null;

            // Display a success message
            string message = "Order Placed Successfully! Thank you for shopping with WatchWorld.";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + message + "');window.location ='Default.aspx';", true);
        }
    }
}