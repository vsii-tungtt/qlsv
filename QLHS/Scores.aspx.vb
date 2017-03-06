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
        con = New SqlConnection("Data Source=TUNGTT-W7;Initial Catalog=QLSV;Integrated Security=SSPI")
        con.Open()
        cmd = New SqlCommand("SELECT scores.id AS id, scores.score AS score, classes.class_code AS classCode, classes.class_name AS className FROM scores INNER JOIN classes ON scores.class_id = classes.id WHERE scores.delflg=0 AND classes.delflg=0 AND scores.student_id=" + Session("UserID"))
        sda = New SqlDataAdapter()
        cmd.Connection = con
        sda.SelectCommand = cmd
        dt = New DataTable
        sda.Fill(dt)
        GridView1.DataSource = dt
        GridView1.DataBind()
        Dim countCost As Integer = dt.Rows.Count
        Dim score As Integer = 0
        For Each row As DataRow In dt.Rows
            score += row("score")
        Next
        lblAvarage.Text = (score / countCost).ToString
    End Sub

    Private Sub BindTable()

    End Sub
End Class