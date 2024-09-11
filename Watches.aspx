<%@ Page Title="Watches" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Watches.aspx.cs" Inherits="WatchWorld.Watches" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container mt-5">
    <div class="row">
        <!-- Category Filter -->
        <div class="col-md-3">
            <asp:DropDownList ID="ddlCategories" runat="server" AutoPostBack="True" CssClass="form-control mb-4" DataSourceID="SqlDataSourceCategories" DataTextField="CategoryName" DataValueField="CategoryID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" ConnectionString="<%$ ConnectionStrings:WatchWorldDB %>" SelectCommand="SELECT CategoryID, CategoryName FROM Categories">
            </asp:SqlDataSource>
        </div>

        <!-- Watches Listing -->
        <div class="col-md-9">
            <asp:DataList ID="dlWatches" runat="server" DataSourceID="SqlDataSourceWatches" RepeatColumns="3" CssClass="watch-list">
                <ItemTemplate>
                    <div class="card mb-4">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("WatchName") %>' class="card-img-top" />
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("WatchName") %></h5>
                            <p class="card-text">Brand: <%# Eval("WatchBrand") %></p>
                            <p class="card-text">Price: <%# Eval("WatchPrice", "{0:C}") %></p>
                            <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("WatchID") %>' OnClick="btnAddToCart_Click" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceWatches" runat="server" ConnectionString="<%$ ConnectionStrings:WatchWorldDB %>" SelectCommand="SELECT * FROM Watches WHERE CategoryID = @CategoryID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlCategories" PropertyName="SelectedValue" Name="CategoryID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</div>

</asp:Content>
