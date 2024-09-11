using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WatchWorld.Models;

namespace WatchWorld
{
    public partial class Watches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your code here
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Get the clicked button
            Button btn = (Button)sender;

            // Get the WatchID from the CommandArgument
            int watchID = Convert.ToInt32(btn.CommandArgument);

            // Simulate retrieving the selected watch details from the database
            // You should replace this with actual data retrieval logic
            Watch selectedWatch = GetWatchDetails(watchID);

            // Retrieve the current cart from the session, or create a new one if it doesn't exist
            List<CartItem> cart = Session["CartItems"] as List<CartItem> ?? new List<CartItem>();

            // Add the selected watch to the cart
            cart.Add(new CartItem
            {
                WatchID = selectedWatch.WatchID,
                WatchName = selectedWatch.WatchName,
                WatchBrand = selectedWatch.WatchBrand,
                WatchPrice = selectedWatch.WatchPrice,
                Quantity = 1,
                 ImageUrl = selectedWatch.ImageUrl
            });

            // Save the updated cart back to the session
            Session["CartItems"] = cart;

            // Optionally, redirect to the cart page or display a success message
            Response.Redirect("Cart.aspx");
        }

        // Simulated method to retrieve watch details
        private Watch GetWatchDetails(int watchID)
        {
            Watch selectedWatch = null;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WatchWorldDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT WatchID, WatchName, WatchBrand, WatchPrice, ImageUrl FROM Watches WHERE WatchID = @WatchID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@WatchID", watchID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    selectedWatch = new Watch
                    {
                        WatchID = Convert.ToInt32(reader["WatchID"]),
                        WatchName = reader["WatchName"].ToString(),
                        WatchBrand = reader["WatchBrand"].ToString(),
                        WatchPrice = Convert.ToDecimal(reader["WatchPrice"]),
                        ImageUrl = reader["ImageUrl"].ToString()
                    };
                }
                reader.Close();
            }

            return selectedWatch;
        }


    }
}
