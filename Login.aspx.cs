using System;
using System.Data.SqlClient;
using System.Web.UI;
using WatchWorld.Models;
using WebGrease.Activities;

namespace WatchWorld
{
    public partial class Login : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();

            // Authenticate the user using the database
            User user = AuthenticateUser(firstName, lastName);

            if (user != null)
            {
                Session["FirstName"] = user.FirstName;
                Session["LastName"] = user.LastName;
                Session["Role"] = user.Role; // Store the role in the session

                // Redirect to the appropriate page based on role
                if (user.Role == "Admin")
                {
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                // Show error message
                lblError.Text = "Invalid login credentials. Please try again.";
            }
        }

        private User AuthenticateUser(string firstName, string lastName)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["WatchWorldDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string sql = "SELECT * FROM Users WHERE FirstName = @FirstName AND LastName = @LastName";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            User user = new User
                            {
                                UserID = (int)reader["UserID"],
                                FirstName = reader["FirstName"].ToString(),
                                LastName = reader["LastName"].ToString(),
                                Email = reader["Email"].ToString(),
                                Password = reader["Password"].ToString(),
                                Role = reader["Role"].ToString()
                            };
                            return user;
                        }
                    }
                }
            }
            return null;
        }
    }
}
