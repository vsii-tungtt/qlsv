Imports System.Data.SqlClient
Imports System.Web.Security
Public Class Scores
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim sda As SqlDataAdapter
    Dim dt As DataTable
    Const ROLE_TEACHER As String = "1"
    Const ROLE_STUDENT As String = "2"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Role") = ROLE_TEACHER) Then
            Throw New System.Exception("You are not authorized to do this.")
        End If
        If Not Me.IsPostBack Then
            Me.BindGrid()
            Me.BindTable()
        End If
    End Sub

    Private Sub BindGrid()
        Dim sql1 As String = ""
        Dim sql2 As String = ""
        Dim sql3 As String = ""
        Dim sql4 As String = ""
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        If Not String.IsNullOrEmpty(Request.QueryString("classCode")) Then
            sql1 = " AND classes.class_code LIKE '%" + Request.QueryString("classCode").ToString + "%'"
        End If

        If Not String.IsNullOrEmpty(Request.QueryString("className")) Then
            sql2 = " AND classes.class_name LIKE '%" + Request.QueryString("className").ToString + "%'"
        End If

        If Not String.IsNullOrEmpty(Request.QueryString("scoreMin")) Then
            sql3 = " AND scores.score >= '" + Request.QueryString("scoreMin").ToString + "'"
        End If

        If Not String.IsNullOrEmpty(Request.QueryString("scoreMax")) Then
            sql4 = " AND scores.score <= '" + Request.QueryString("scoreMax").ToString + "'"
        End If
        cmd = New SqlCommand("SELECT scores.id AS id, scores.score AS score, classes.class_code AS classCode, classes.class_name AS className FROM scores INNER JOIN classes ON scores.class_id = classes.id WHERE scores.delflg=0 AND classes.delflg=0 AND scores.student_id=" + Session("UserID") + sql1 + sql2 + sql3 + sql4)
        sda = New SqlDataAdapter()
        cmd.Connection = con
        sda.SelectCommand = cmd
        dt = New DataTable
        sda.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
        Dim countCost As Integer = dt.Rows.Count
        Dim score As Decimal = 0
        For Each row As DataRow In dt.Rows
            score += row("score")
        Next
        lblAvarage.Text = (score / countCost).ToString
    End Sub

    Private Sub BindTable()

    End Sub
End Class