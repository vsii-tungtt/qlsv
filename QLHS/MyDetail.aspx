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
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
                                <span></span>
                                <asp:Label ID="lblUsername" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Faculty:"></asp:Label>
                                <span></span>
                                <asp:Label ID="lblFaculty" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
