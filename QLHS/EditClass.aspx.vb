Imports System.Data.SqlClient
Imports System.Web.Security
Public Class EditClass
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim sda As SqlDataAdapter
    Dim ds As DataSet
    Dim cmd1 As SqlCommand
    Dim dr As SqlDataReader
    Const ROLE_TEACHER As String = "1"
    Const ROLE_STUDENT As String = "2"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Role") = ROLE_STUDENT) Then
            Throw New System.Exception("You are not authorized to do this.")
        End If
        If Not Me.IsPostBack Then
            Me.BindForm()
        End If
    End Sub

    Private Sub BindForm()
        Dim classId As String = Request.QueryString("classId").ToString
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("SELECT class_name AS className, class_code AS classCode FROM classes WHERE id=" + classId)
        sda = New SqlDataAdapter()
        cmd.Connection = con
        sda.SelectCommand = cmd
        ds = New DataSet
        sda.Fill(ds)
        con.Close()
        If ds.Tables(0).Rows.Count > 0 Then
            txtClassCode.Text = ds.Tables(0).Rows(0)("classCode").ToString
            txtClassName.Text = ds.Tables(0).Rows(0)("className").ToString
        End If
    End Sub

    Protected Sub btnEditClass_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEditClass.Click
        Dim newClassCode As String = txtClassCode.Text
        Dim newClassName As String = txtClassName.Text
        Dim classId As String = Request.QueryString("classId").ToString
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd1 = New SqlCommand("SELECT * FROM classes WHERE delflg=0 AND class_code='" + newClassCode + "'", con)
        dr = cmd1.ExecuteReader
        If (dr.Read) Then
            MsgBox("Class ID has used.")
        Else
            cmd1.Dispose()
            dr.Close()
            cmd = New SqlCommand("UPDATE classes SET class_name='" + newClassName + "', class_code='" + newClassCode + "' WHERE id =" + classId)
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("~/ClassesList.aspx")
        End If
    End Sub
End Class