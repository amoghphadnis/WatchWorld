using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WatchWorld
{
    public partial class Admin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            // Logic to insert a new category
            SqlDataSourceCategories.InsertCommand = "INSERT INTO Categories (CategoryName) VALUES (@CategoryName)";
            SqlDataSourceCategories.InsertParameters.Add("CategoryName", txtNewCategory.Text);
            SqlDataSourceCategories.Insert();
        }
        protected void dvAddWatch_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fuImage = (FileUpload)dvAddWatch.FindControl("fuImage");
            string imagePath = "";

            if (fuImage.HasFile)
            {
                // Save the uploaded file to the server
                string fileName = fuImage.FileName;
                imagePath = "~/Images/" + fileName;
                fuImage.SaveAs(Server.MapPath(imagePath));

                // Set the ImageUrl parameter value
                e.Values["ImageUrl"] = imagePath;
            }
            else
            {
                // Handle case where no image is uploaded, if necessary
                e.Values["ImageUrl"] = DBNull.Value;
            }
        }


    }
}