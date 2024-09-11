<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WatchWorld.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container mt-5">
            <h2>Your Shopping Cart</h2>
            <asp:ListView ID="lvCart" runat="server" OnItemCommand="lvCart_ItemCommand">
                <ItemTemplate>
                    <div class="row mb-3">
                        <div class="col-md-2">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("WatchName") %>' class="img-thumbnail" />
                        </div>
                        <div class="col-md-5">
                            <h4><%# Eval("WatchName") %></h4>
                            <p>Brand: <%# Eval("WatchBrand") %></p>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <asp:LinkButton ID="btnDecreaseQty" runat="server" CommandArgument='<%# Eval("WatchID") %>' CommandName="DecreaseQty" CssClass="btn btn-outline-secondary">-</asp:LinkButton>
                                <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control text-center" ReadOnly="true" />
                                <asp:LinkButton ID="btnIncreaseQty" runat="server" CommandArgument='<%# Eval("WatchID") %>' CommandName="IncreaseQty" CssClass="btn btn-outline-secondary">+</asp:LinkButton>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <p>Price: <%# Eval("WatchPrice", "{0:C}") %></p>
                        </div>
                        <div class="col-md-1">
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandArgument='<%# Eval("WatchID") %>' OnClick="btnRemove_Click" CssClass="btn btn-danger" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <!-- Total Price Section -->
            <div class="row mt-3">
                <div class="col-md-12 text-right">
                    <h4>Total: <span id="lblTotal" runat="server"></span></h4>
                </div>
            </div>

            <div class="text-right">
                <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" PostBackUrl="~/Checkout.aspx" CssClass="btn btn-success" />
            </div>
        </div>
</asp:Content>
