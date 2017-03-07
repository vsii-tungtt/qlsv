Imports System.Data.SqlClient
Imports System.Web.Security
Public Class MyDetail
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim sda As SqlDataAdapter
    Dim ds As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindLabel()
        End If
    End Sub

    Private Sub BindLabel()
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("SELECT users.username as username, faculties.faculty_name as facultyName FROM users INNER JOIN faculties ON users.faculty_id = faculties.id WHERE users.id=" + Session("UserID"))
        cmd.Connection = con
        sda = New SqlDataAdapter()
        sda.SelectCommand = cmd
        ds = New DataSet
        sda.Fill(ds)
        con.Close()
        If ds.Tables(0).Rows.Count > 0 Then
            lblUsername.Text = ds.Tables(0).Rows(0)("username").ToString()
            lblFaculty.Text = ds.Tables(0).Rows(0)("facultyName").ToString()
        End If
    End Sub
End Class