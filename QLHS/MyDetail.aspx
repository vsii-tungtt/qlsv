<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="MyDetail.aspx.vb" Inherits="QLHS.MyDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
       <li>
          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
       </li>
       <li class="active">
          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/MyDetail.aspx">My Detail</asp:HyperLink>
       </li>
    </ul>

    <div class="box">
        <div class="box-body">
            <div class="row">
                <div class="box-body no-padding">
                    <div class="row no-margin">
                        <div class="col-sm-12 no-padding">
                        <form class="col-sm-8 form-horizontal" runat="server">
                            <div class="form-group">
                                <asp:Label ID="Label1" CssClass="col-sm-3 control-label" runat="server" Text="Username:"></asp:Label>
                                <asp:Label ID="lblUsername" CssClass="col-sm-9 control-label" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" CssClass="col-sm-3 control-label" runat="server" Text="Faculty:"></asp:Label>
                                <asp:Label ID="lblFaculty" CssClass="col-sm-9 control-label" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label3" CssClass="col-sm-3 control-label" runat="server" Text="Full name:"></asp:Label>
                                <asp:Label ID="lblFullname" CssClass="col-sm-9 control-label" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label4" CssClass="col-sm-3 control-label" runat="server" Text="Birthday:"></asp:Label>
                                <asp:Label ID="lblBirthday" CssClass="col-sm-9 control-label" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label5" CssClass="col-sm-3 control-label" runat="server" Text="Sex:"></asp:Label>
                                <asp:Label ID="lblSex" CssClass="col-sm-9 control-label" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label6" CssClass="col-sm-3 control-label" runat="server" Text="Address:"></asp:Label>
                                <asp:Label ID="lblAddress" CssClass="col-sm-9 control-label" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label7" CssClass="col-sm-3 control-label" runat="server" Text="Country:"></asp:Label>
                                <asp:Label ID="lblCountry" CssClass="col-sm-9 control-label" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:HyperLink ID="HyperLink3" runat="server" CssClass="btn btn-info" NavigateUrl="~/EditMyDetail.aspx">Edit</asp:HyperLink>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
