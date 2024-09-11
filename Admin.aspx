<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WatchWorld.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid mt-5">
        <h2 class="mb-4">Admin Panel</h2>

        <!-- SqlDataSource for Categories -->
        <asp:SqlDataSource ID="SqlDataSourceCategories" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WatchWorldDB %>" 
            SelectCommand="SELECT * FROM Categories"
            UpdateCommand="UPDATE Categories SET CategoryName = @CategoryName WHERE CategoryID = @CategoryID"
            DeleteCommand="DELETE FROM Categories WHERE CategoryID = @CategoryID">
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="CategoryID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <!-- Filter Watches by Category -->
        <div class="row mb-4">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Filter Watches by Category
                    </div>
                    <div class="card-body">
                        <asp:DropDownList ID="ddlCategoryFilter" runat="server" AutoPostBack="True" CssClass="form-control mb-3"
                            DataSourceID="SqlDataSourceCategories" DataTextField="CategoryName" DataValueField="CategoryID">
                        </asp:DropDownList>

                        <asp:DataList ID="dlWatchesByCategory" runat="server" DataSourceID="SqlDataSourceWatchesByCategory" 
                            RepeatColumns="2" CssClass="watch-list">
                            <ItemTemplate>
                                <div class="card mb-4">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("WatchName") %>' class="card-img-top" />
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("WatchName") %></h5>
                                        <p class="card-text">Brand: <%# Eval("WatchBrand") %></p>
                                        <p class="card-text">Price: <%# Eval("WatchPrice", "{0:C}") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>

                        <asp:SqlDataSource ID="SqlDataSourceWatchesByCategory" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:WatchWorldDB %>" 
                            SelectCommand="SELECT * FROM Watches WHERE CategoryID = @CategoryID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlCategoryFilter" PropertyName="SelectedValue" Name="CategoryID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>

        <!-- SqlDataSource for Watches -->
        <asp:SqlDataSource ID="SqlDataSourceWatches" runat="server" 
            ConnectionString="<%$ ConnectionStrings:WatchWorldDB %>" 
            SelectCommand="SELECT * FROM Watches"
            UpdateCommand="UPDATE Watches SET WatchName = @WatchName, WatchBrand = @WatchBrand, CategoryID = @CategoryID, WatchPrice = @WatchPrice WHERE WatchID = @WatchID"
            DeleteCommand="DELETE FROM Watches WHERE WatchID = @WatchID"
            InsertCommand="INSERT INTO Watches (WatchName, WatchBrand, CategoryID, WatchPrice, ImageUrl) VALUES (@WatchName, @WatchBrand, @CategoryID, @WatchPrice, @ImageUrl)">
            <UpdateParameters>
                <asp:Parameter Name="WatchName" Type="String" />
                <asp:Parameter Name="WatchBrand" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="WatchPrice" Type="Decimal" />
                <asp:Parameter Name="ImageUrl" Type="String" />
                <asp:Parameter Name="WatchID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="WatchID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WatchName" Type="String" />
                <asp:Parameter Name="WatchBrand" Type="String" />
                <asp:Parameter Name="CategoryID" Type="Int32" />
                <asp:Parameter Name="WatchPrice" Type="Decimal" />
                <asp:Parameter Name="ImageUrl" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

        <!-- Manage Categories Section -->
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Manage Categories
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="gvCategories" runat="server" 
                            CssClass="table table-bordered table-striped table-hover" 
                            AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSourceCategories">
                            <Columns>
                                <asp:BoundField DataField="CategoryID" HeaderText="ID" ReadOnly="True" />
                                <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                        <div class="mt-3">
                            <label for="txtNewCategory" class="form-label">Add New Category</label>
                            <asp:TextBox ID="txtNewCategory" runat="server" CssClass="form-control" Placeholder="Enter Category Name"></asp:TextBox>
                            <asp:Button ID="btnAddCategory" runat="server" Text="Add Category" CssClass="btn btn-success mt-2" OnClick="btnAddCategory_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Manage Watches Section -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Manage Watches
                    </div>
                    <div class="card-body">
                        <asp:GridView ID="gvWatches" runat="server" 
                            CssClass="table table-bordered table-striped table-hover" 
                            AutoGenerateColumns="False" DataKeyNames="WatchID" DataSourceID="SqlDataSourceWatches" AllowPaging="True" PageSize="5">
                            <Columns>
                                <asp:BoundField DataField="WatchID" HeaderText="ID" ReadOnly="True" />
                                <asp:BoundField DataField="WatchName" HeaderText="Watch Name" />
                                <asp:BoundField DataField="WatchBrand" HeaderText="Brand" />
                                <asp:BoundField DataField="CategoryID" HeaderText="Category ID" />
                                <asp:BoundField DataField="WatchPrice" HeaderText="Price" DataFormatString="{0:C}" />
                                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                            </Columns>
                        </asp:GridView>
                        
                        <div class="mt-3">
                            <asp:DetailsView ID="dvAddWatch" runat="server" AutoGenerateRows="False" 
                                DataSourceID="SqlDataSourceWatches" DefaultMode="Insert" CssClass="table"
                                OnItemInserting="dvAddWatch_ItemInserting">
                                <Fields>
                                    <asp:BoundField DataField="WatchID" HeaderText="Watch ID" InsertVisible="false" />
                                    <asp:BoundField DataField="WatchName" HeaderText="Watch Name" />
                                    <asp:BoundField DataField="WatchBrand" HeaderText="Brand" />
                                    <asp:BoundField DataField="CategoryID" HeaderText="Category ID" />
                                    <asp:BoundField DataField="WatchPrice" HeaderText="Price" DataFormatString="{0:C}" />
                                    <asp:TemplateField HeaderText="Image">
                                        <EditItemTemplate>
                                            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <img src='<%# Eval("ImageUrl") %>' alt="Watch Image" width="100" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowInsertButton="True" />
                                </Fields>
                            </asp:DetailsView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
