<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WatchWorld.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <h2>Login</h2>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        <div class="form-group">
            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" PostBackUrl="~/Default.aspx" />
        </div>
    </div>
</asp:Content>
