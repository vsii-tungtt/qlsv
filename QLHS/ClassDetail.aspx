<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="ClassDetail.aspx.vb" Inherits="QLHS.ClassDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Scripts/class-detail.js"></script>
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
                <asp:HyperLink ID="HyperLink3" runat="server">Class Detail</asp:HyperLink>
            </li>
    </ul>
    
    <div class="box">
        <div class="box-body">
            <div class="row">
                <div class="box-body no-padding">
                    <div class="row no-margin">
                        <div class="col-sm-12 no-padding">
                            <form action="ClassDetail.aspx" method="get" class="form-horizontal">
                                <input id="txtclassId" name="txtclassId" class="hidden" type="text" runat="server" />
                                <div class="col-sm-6">
                                    <label class="col-sm-4 control-label">Student</label>
                                    <div class="col-sm-8">
                                        <input class="form-control" id="student" name="student" />
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
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Class ID:"></asp:Label>
                                <span></span>
                                <asp:Label ID="lblclassCode" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="Class Name:"></asp:Label>
                                <span></span>
                                <asp:Label ID="lblclassName" runat="server"></asp:Label>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Faculty:"></asp:Label>
                                <span></span>
                                <asp:Label ID="lblFaculty" runat="server"></asp:Label>
                            </div>
                            <div class="row no-margin">
                                <form runat="server">
                                <div class="col-sm-12 no-padding">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable" ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="id" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." >
                                        <Columns>
                                            <asp:BoundField DataField="username" HeaderText="Student" />
                                            <asp:BoundField DataField="score" HeaderText="Score" />
                                            <asp:CommandField ButtonType="Link" ShowDeleteButton="true" />
                                            <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/EditScore.aspx?scoreID={0}" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>
