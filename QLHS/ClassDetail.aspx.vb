Imports System.Data.SqlClient
Imports System.Web.Security
Public Class ClassDetail
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim sda As SqlDataAdapter
    Dim dt As DataTable
    Dim ds As DataSet
    Const ROLE_TEACHER As String = "1"
    Const ROLE_STUDENT As String = "2"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindLabel()
            Me.BindGrid()
        End If
    End Sub

    Private Sub BindGrid()
        Dim classId As String = Request.QueryString("classId").ToString
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("SELECT scores.id AS id, users.username AS username, scores.score AS score FROM scores INNER JOIN users ON scores.student_id = users.id WHERE scores.delflg=0 AND users.delflg=0 AND scores.class_id=" + classId)
        sda = New SqlDataAdapter()
        cmd.Connection = con
        sda.SelectCommand = cmd
        dt = New DataTable
        sda.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
        If (Session("Role") = ROLE_STUDENT) Then
            GridView1.Columns(2).Visible = False
        End If
    End Sub

    Private Sub BindLabel()
        Dim classId As String = Request.QueryString("classId").ToString
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("Select classes.class_code AS classCode, classes.class_name AS className, faculties.faculty_name AS facultyName FROM classes INNER JOIN faculties ON classes.faculty_id = faculties.id WHERE classes.id=" + classId)
        cmd.Connection = con
        sda = New SqlDataAdapter()
        sda.SelectCommand = cmd
        ds = New DataSet
        sda.Fill(ds)
        con.Close()
        If ds.Tables(0).Rows.Count > 0 Then
            lblclassCode.Text = ds.Tables(0).Rows(0)("classCode").ToString()
            lblclassName.Text = ds.Tables(0).Rows(0)("className").ToString()
            lblFaculty.Text = ds.Tables(0).Rows(0)("facultyName").ToString()
        End If
    End Sub

    Protected Sub OnRowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        If (Session("Role") = ROLE_STUDENT) Then
            MsgBox("You are not authorized to do this.")
        ElseIf (Session("Role") = ROLE_TEACHER) Then
            Dim scoreId As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
            cmd = New SqlCommand("UPDATE scores SET delflg = 1 WHERE id = " + scoreId.ToString)
            cmd.Connection = con
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            Me.BindGrid()
        End If
    End Sub
End Class