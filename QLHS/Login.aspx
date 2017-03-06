<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Login.Master" CodeBehind="Login.aspx.vb" Inherits="QLHS.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>
        <legend>Login</legend>
        <div class="form-group text">
            <asp:Label Text="Username" runat="server"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group password">
            <asp:Label Text="Password" runat="server"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
        </div>
    </fieldset>
    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn aka-btn aka-btn-darkblue col-sm-12" />
    <br /><br /><br />
    <div class="login-help">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="#">※Forget Password</asp:HyperLink>
    </div>
</asp:Content>
