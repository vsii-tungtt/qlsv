<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="EditClass.aspx.vb" Inherits="QLHS.EditClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ClassesList.aspx">Classes</asp:HyperLink>
        </li>
        <li class="active">
            <asp:HyperLink ID="HyperLink3" runat="server">Edit Class</asp:HyperLink>
        </li>
    </ul>

    <div class="col-md-7 box-center">
        <div class="box">
            <div class="box-body">
                <div class="wrapper panel-body">
                    <fieldset>
                        <legend>Edit Class</legend>
                        <div class="form-group">
                            <label>Class ID:</label>
                            <asp:TextBox ID="txtClassCode" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Class Name:</label>
                            <asp:TextBox ID="txtClassName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </fieldset>
                    <asp:Button ID="btnEditClass" runat="server" Text="Edit Class" CssClass="btn aka-btn aka-btn-darkblue col-sm-4 btn-success" />
                    <div class="col-sm-4"></div>
                    <asp:HyperLink ID="HyperLink4" CssClass="btn aka-btn col-sm-4 btn-default" runat="server" NavigateUrl="~/ClassesList.aspx">Cancel</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
