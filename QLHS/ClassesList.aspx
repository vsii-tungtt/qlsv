<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeBehind="ClassesList.aspx.vb" Inherits="QLHS.ClassesList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript" src="Scripts/classes-list.js">
    
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <ul class="breadcrumb">
            <li>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Home Page</asp:HyperLink>
            </li>
            <li class="active">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ClassesList.aspx">Classes</asp:HyperLink>
            </li>
        </ul>

        <div class="box">
            <div class="box-body">
                <div class="row">
                    <div class="box-body no-padding">
                        <div class="dataTables_wrapper dt-bootstrap">
                            <div class="row no-margin">
                                <form action="ClassesList.aspx" method="get" class="form-horizontal">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Class ID</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="txtClassCode" id="txtClassCode" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Class Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" name="txtClassName" id="txtClassName" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 text-center">
                                        <button type="submit" class="btn aka-btn aka-btn-darkblue big">Search</button>
                                    </div>
                                </form>
                                <br />
                                <form runat="server">
                                <div class="col-sm-12 no-padding">
                                    <asp:GridView CssClass="table table-striped table-bordered table-hover dataTable" ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="id" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added." >
                                        <Columns>
                                            <asp:BoundField DataField="classCode" HeaderText="Classes ID" />
                                            <asp:BoundField DataField="className" HeaderText="Classes" />
                                            <asp:BoundField DataField="facultyName" HeaderText="Faculties" />
                                            <asp:CommandField ButtonType="Link" ShowDeleteButton="true" />
                                            <asp:HyperLinkField Text="Detail" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/ClassDetail.aspx?ctl00%24ContentPlaceHolder1%24txtclassId={0}" />
                                            <asp:HyperLinkField Text="Edit" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/EditClass.aspx?classId={0}" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                </form>
                                <% If (Session("Role") = 1) Then%>
                                <div class="row no-margin">
                                    <asp:HyperLink runat="server" Text="Add New Class" NavigateUrl="~/AddNewClass.aspx" CssClass="btn btn-info"></asp:HyperLink>
                                </div>
                                <% End If%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
