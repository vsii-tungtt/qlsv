<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="Scores.aspx.vb" Inherits="QLHS.Scores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Scripts/scores.js"></script>
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
                    <div class="row no-margin">
                        <div class="col-sm-12 no-padding">
                            <form action="Scores.aspx" method="get" class="form-horizontal">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Class ID</label>
                                        <div class="col-sm-8">
                                            <input class="form-control" id="classCode" name="classCode" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Class Name</label>
                                        <div class="col-sm-8">
                                            <input class="form-control" id="className" name="className" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <label class="col-sm-3 control-label">Score</label>
                                    <div class="col-sm-4">
                                        <input class="form-control numeric" id="scoreMin" name="scoreMin" />
                                    </div>
                                    <label class="col-sm-1 control-label">~</label>
                                    <div class="col-sm-4">
                                        <input class="form-control numeric" id="scoreMax" name="scoreMax" />
                                    </div>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn aka-btn aka-btn-darkblue big">Search</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="box">
            <div class="box-body">
                <div class="row">
                    <div class="box-body no-padding">
                        <div class="dataTables_wrapper dt-bootstrap">
                            <div class="row no-margin">
                                <form runat="server">
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
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
