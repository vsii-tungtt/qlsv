﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="Scores.aspx.vb" Inherits="QLHS.Scores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
       <li>
          <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
       </li>
       <li class="active">
          <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Scores.aspx">My Scores</asp:HyperLink>
       </li>
    </ul>

    <div class="box">
            <div class="box-body">
                <div class="row">
                    <div class="box-body no-padding">
                        <div class="dataTables_wrapper dt-bootstrap">
                            <div class="row no-margin">
                                <div class="col-sm-12 no-padding">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable" ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="id" EmptyDataText="No records has been added." >
                                        <Columns>
                                            <asp:BoundField DataField="classCode" HeaderText="Class ID" />
                                            <asp:BoundField DataField="className" HeaderText="Class Name" />
                                            <asp:BoundField DataField="score" HeaderText="Score" />
                                        </Columns>
                                    </asp:GridView>
                                    <table class="table table-striped table-bordered table-hover dataTable">
                                        <tbody>
                                        <tr>
                                            <td>Avarage</td>
                                            <td>
                                                <asp:Label ID="lblAvarage" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
