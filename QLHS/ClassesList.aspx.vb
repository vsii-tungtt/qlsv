Imports System.Data.SqlClient
Imports System.Web.Security
Public Class ClassesList
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim sda As SqlDataAdapter
    Dim dt As DataTable
    Const ROLE_TEACHER As String = "1"
    Const ROLE_STUDENT As String = "2"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindGrid()
        End If
    End Sub


    Private Sub BindGrid()
        Dim sql1 As String = ""
        Dim sql2 As String = ""
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()

        If Not String.IsNullOrEmpty(Request.QueryString("txtClassCode")) Then
            sql1 = " AND classes.class_code LIKE '%" + Request.QueryString("txtClassCode").ToString + "%'"
        End If
        If Not String.IsNullOrEmpty(Request.QueryString("txtClassName")) Then
            sql2 = " AND classes.class_name LIKE '%" + Request.QueryString("txtClassName").ToString + "%'"
        End If


        If (Session("Role") = ROLE_STUDENT) Then
            cmd = New SqlCommand("SELECT classes.class_code AS classCode, classes.id AS id, classes.class_name AS className, faculties.faculty_name AS facultyName FROM classes INNER JOIN faculties ON classes.faculty_id = faculties.id INNER JOIN scores ON classes.id = scores.class_id WHERE classes.delflg = 0 AND scores.student_id=" + Session("UserID") + sql1 + sql2)
        ElseIf (Session("Role") = ROLE_TEACHER) Then
            cmd = New SqlCommand("SELECT classes.class_code AS classCode, classes.id AS id, classes.class_name AS className, faculties.faculty_name AS facultyName FROM classes INNER JOIN faculties ON classes.faculty_id = faculties.id WHERE classes.delflg = 0 AND classes.faculty_id=" + Session("FacultyOfUser") + sql1 + sql2)
        End If
        sda = New SqlDataAdapter()
        cmd.Connection = con
        sda.SelectCommand = cmd
        dt = New DataTable
        sda.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
        If (Session("Role") = ROLE_STUDENT) Then
            GridView1.Columns(3).Visible = False
            GridView1.Columns(5).Visible = False
        End If
    End Sub

    Protected Sub OnRowDeleting(ByVal sender As Object, ByVal e As GridViewDeleteEventArgs)
        If (Session("Role") = ROLE_STUDENT) Then
            MsgBox("You are not authorized to do this.")
        ElseIf (Session("Role") = ROLE_TEACHER) Then
            Dim classId As Integer = Convert.ToInt32(GridView1.DataKeys(e.RowIndex).Values(0))
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
            cmd = New SqlCommand("UPDATE classes SET delflg = 1 WHERE id = " + classId.ToString)
            cmd.Connection = con
            con.Open()
            cmd.ExecuteNonQuery()
            con.Close()
            Me.BindGrid()
        End If
    End Sub
End Class