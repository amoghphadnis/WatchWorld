<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WatchWorld.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to WatchWorld</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Banner Section -->
        <div class="main-banner">
            <asp:Image ID="Img1" runat="server" ImageUrl="~/images/banner.jpg" CssClass="banner-image" />
            <div class="main-banner-text">
                <h1>Welcome to WatchWorld</h1>
                <p>Your one-stop shop for premium watches.</p>
                <asp:HyperLink ID="productLink" runat="server" NavigateUrl="~/Watches.aspx" CssClass="btn btn-primary">Explore Our Collection</asp:HyperLink>
            </div>
        </div>

        <!-- Introduction Section -->
        <section class="welcome-section">
            <div class="container">
                <h2>Our Exclusive Collections</h2>
                <p>Discover a wide range of watches across various categories. Whether you love digital, analog, luxury, or sports watches, we have something for everyone.</p>
            </div>
        </section>

        <!-- Featured Products or Categories (Optional) -->
        <section class="featured-section">
            <div class="container">
                <h3>Featured Watches</h3>
                <asp:DataList ID="dlFeaturedWatches" runat="server" RepeatColumns="3" CssClass="watch-list">
                    <ItemTemplate>
                        <div class="card mb-4">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("WatchName") %>' class="card-img-top" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("WatchName") %></h5>
                                <p class="card-text">Brand: <%# Eval("WatchBrand") %></p>
                                <p class="card-text">Price: <%# Eval("WatchPrice", "{0:C}") %></p>
                                <asp:HyperLink ID="hlDetails" runat="server" NavigateUrl='<%# Eval("WatchID", "WatchDetails.aspx?WatchID={0}") %>' CssClass="btn btn-primary">View Details</asp:HyperLink>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSourceFeaturedWatches" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:WatchWorldDB %>" 
                    SelectCommand="SELECT TOP 6 WatchID, WatchName, WatchBrand, WatchPrice, ImageUrl FROM Watches ORDER BY NEWID()">
                </asp:SqlDataSource>
            </div>
        </section>
    </form>
</body>
</html>
