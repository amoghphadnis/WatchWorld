using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WatchWorld
{
    public partial class Logout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the session and redirect to login page
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}