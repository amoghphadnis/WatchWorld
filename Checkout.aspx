<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WatchWorld.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container mt-5">
            <h2>Checkout</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name" AssociatedControlID="txtFirstName"></asp:Label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name" AssociatedControlID="txtLastName"></asp:Label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAddress" runat="server" Text="Address" AssociatedControlID="txtAddress"></asp:Label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblCity" runat="server" Text="City" AssociatedControlID="txtCity"></asp:Label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ErrorMessage="City is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code" AssociatedControlID="txtPostalCode"></asp:Label>
                        <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPostalCode" runat="server" ControlToValidate="txtPostalCode" ErrorMessage="Postal Code is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPostalCode" runat="server" ControlToValidate="txtPostalCode" ValidationExpression="[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d" ErrorMessage="Invalid Postal Code format" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number" AssociatedControlID="txtPhoneNumber"></asp:Label>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" ControlToValidate="txtPhoneNumber" ValidationExpression="\d{3}-\d{3}-\d{4}" ErrorMessage="Invalid Phone Number format" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" CssClass="btn btn-success mt-3" OnClick="btnPlaceOrder_Click" />
                        <asp:Button ID="btnGoBackToCart" runat="server" Text="Go back to Cart" CssClass="btn btn-secondary mt-3 ml-2" PostBackUrl="~/Cart.aspx" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
