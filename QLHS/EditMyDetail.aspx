<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="EditMyDetail.aspx.vb" Inherits="QLHS.EditMyDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script type="text/javascript">
      $(function () {
          $("#ContentPlaceHolder1_txtBirthday").datepicker({
              changeMonth: true,
              changeYear: true,
              yearRange: "-100:+0",
          });
      });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
       <li>
          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
       </li>
       <li>
          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/MyDetail.aspx">My Detail</asp:HyperLink>
       </li>
       <li class="active">
          <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/EditMyDetail.aspx">Edit Detail</asp:HyperLink>
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
                                    <div class="col-sm-9">
                                        <asp:Label ID="lblUsername" CssClass="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label2" CssClass="col-sm-3 control-label" runat="server" Text="Faculty:"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:Label ID="lblFaculty" CssClass="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label3" CssClass="col-sm-3 control-label" runat="server" Text="Full name:"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtFullname" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label4" CssClass="col-sm-3 control-label" runat="server" Text="Birthday:"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtBirthday" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label5" CssClass="col-sm-3 control-label" runat="server" Text="Sex:"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:DropDownList ID="txtSex" CssClass="form-control" runat="server" 
                                            DataSourceID="SqlDataSource1" DataTextField="sex" DataValueField="id">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:QLSV %>" 
                                            SelectCommand="SELECT * FROM [sexes]"></asp:SqlDataSource>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label6" CssClass="col-sm-3 control-label" runat="server" Text="Address:"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="Label7" CssClass="col-sm-3 control-label" runat="server" Text="Country:"></asp:Label>
                                    <div class="col-sm-9">
                                        <asp:TextBox ID="txtCountry" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnEditDetail" runat="server" Text="Edit Detail" CssClass="btn aka-btn aka-btn-darkblue col-sm-4 btn-success" />
                                    <div class="col-sm-4"></div>
                                    <asp:HyperLink ID="HyperLink4" CssClass="btn aka-btn col-sm-4 btn-default" runat="server" NavigateUrl="~/MyDetail.aspx">Cancel</asp:HyperLink>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
