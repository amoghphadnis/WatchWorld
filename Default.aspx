<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WatchWorld.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-banner">
        <asp:Image ID="Img1" runat="server" ImageUrl="~/Images/Banner.jpg" CssClass="banner-image" />
        <div class="main-banner-text">
            <h1>Welcome to WatchWorld</h1>
            <p>Your one-stop shop for premium watches.</p>
            <asp:HyperLink ID="productLink" runat="server" NavigateUrl="~/Watches.aspx" CssClass="btn btn-primary">Explore Our Collection</asp:HyperLink>
        </div>
    </div>

    <section class="welcome-section">
        <div class="container">
            <h2>Our Exclusive Collections</h2>
            <p>Discover a wide range of watches across various categories. Whether you love digital, analog, luxury, or sports watches, we have something for everyone.</p>
        </div>
    </section>
</asp:Content>
