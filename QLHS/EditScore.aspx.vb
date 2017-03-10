Imports System.Data.SqlClient
Imports System.Web.Security
Public Class EditScore
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim cmd1 As SqlCommand
    Dim sda As SqlDataAdapter
    Dim ds As DataSet
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
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("SELECT users.username AS username, scores.score AS score, scores.class_id AS classId FROM scores INNER JOIN users ON users.id = scores.student_id WHERE scores.id=" + Request.QueryString("scoreID").ToString)
        cmd.Connection = con
        sda = New SqlDataAdapter()
        sda.SelectCommand = cmd
        ds = New DataSet
        sda.Fill(ds)
        con.Close()
        If ds.Tables(0).Rows.Count > 0 Then
            lblUsername.Text = ds.Tables(0).Rows(0)("username").ToString()
            If Not String.IsNullOrEmpty(ds.Tables(0).Rows(0)("score").ToString()) Then
                txtScore.SelectedValue = ds.Tables(0).Rows(0)("score").ToString()
            End If
            btnCancel.NavigateUrl = "~/ClassDetail.aspx?classId=" + ds.Tables(0).Rows(0)("classId").ToString()
        End If
    End Sub

    Protected Sub btnEditScore_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEditScore.Click
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("UPDATE scores SET score='" + txtScore.SelectedValue + "' WHERE id=" + Request.QueryString("scoreID").ToString)
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        cmd1 = New SqlCommand("SELECT class_id AS classId FROM scores WHERE scores.id=" + Request.QueryString("scoreID").ToString)
        cmd1.Connection = con
        sda = New SqlDataAdapter()
        sda.SelectCommand = cmd1
        ds = New DataSet
        sda.Fill(ds)
        con.Close()
        If ds.Tables(0).Rows.Count > 0 Then
            Response.Redirect("~/ClassDetail.aspx?classId=" + ds.Tables(0).Rows(0)("classId").ToString())
        End If
    End Sub
End Class