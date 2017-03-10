<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="EditScore.aspx.vb" Inherits="QLHS.EditScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
        </li>
        <li class="active">
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EditScore.aspx">Edit Score</asp:HyperLink>
        </li>
    </ul>

    <div class="col-md-7 box-center">
        <div class="box">
            <div class="box-body">
                <form id="Form1" runat="server" class="form-horizontal">
                <div class="wrapper panel-body">
                    <fieldset>
                        <legend>Edit Score</legend>
                        <div class="form-group">
                            <asp:Label ID="Label1" CssClass="col-sm-3 control-label" runat="server" Text="Username:"></asp:Label>
                            <div class="col-sm-9">
                                <asp:Label ID="lblUsername" CssClass="control-label" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" CssClass="col-sm-3 control-label" runat="server" Text="Score:"></asp:Label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="txtScore" CssClass="form-control" runat="server">
                                    <asp:ListItem>--Choose Score--</asp:ListItem>
                                    <asp:ListItem Value="0">0</asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="1.5">1.5</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="2.5">2.5</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="3.5">3.5</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="4.5">4.5</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="5.5">5.5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="6.5">6.5</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="7.5">7.5</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="8.5">8.5</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="9.5">9.5</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </fieldset>
                    <asp:Button ID="btnEditScore" runat="server" Text="Edit Score" CssClass="btn aka-btn aka-btn-darkblue col-sm-4 btn-success" />
                    <div class="col-sm-4"></div>
                    <asp:HyperLink ID="btnCancel" CssClass="btn aka-btn col-sm-4 btn-default" runat="server">Cancel</asp:HyperLink>
                </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
