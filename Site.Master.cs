using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WatchWorld
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["FirstName"] != null && Session["LastName"] != null)
                {
                    lblUserName.Text = "Welcome, " + Session["FirstName"] + " " + Session["LastName"];
                    lnkWatches.Visible = true;
                    lnkCart.Visible = true;
                    lnkLogout.Visible = true;

                    // Show admin link only if the user is an admin
                    if (Session["Role"] != null && Session["Role"].ToString() == "Admin")
                    {
                        lnkAdmin.Visible = true;
                    }
                    else
                    {
                        lnkAdmin.Visible = false;
                    }
                }
                else
                {
                    lblUserName.Text = "Welcome, Guest";
                    lnkWatches.Visible = false;
                    lnkCart.Visible = false;
                    lnkLogout.Visible = false;
                    lnkAdmin.Visible = false;
                }
            }
        }


    }
}