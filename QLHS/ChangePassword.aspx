<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="ChangePassword.aspx.vb" Inherits="QLHS.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
        </li>
        <li class="active">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ChangePassword.aspx">Change Password</asp:HyperLink>
        </li>
    </ul>

    <div class="col-md-7 box-center">
        <div class="box">
            <div class="box-body">
                <div class="wrapper panel-body">
                    <fieldset>
                        <legend>Change Password</legend>
                        <div class="form-group">
                            <label>Current Password</label>
                            <asp:TextBox ID="txtCurrentPassword" CssClass="form-control" runat="server" 
                                TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <asp:TextBox ID="txtNewPassword" CssClass="form-control" runat="server" 
                                TextMode="Password"></asp:TextBox>
                        </div>
                    </fieldset>
                    <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn aka-btn aka-btn-darkblue col-sm-12 btn-success" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
