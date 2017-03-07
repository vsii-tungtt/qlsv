Imports System.Data.SqlClient
Imports System.Web.Security
Public Class Login1
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnLogin.Click
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("SELECT password, id, role_id, faculty_id FROM users WHERE delflg=0 AND username='" + txtUsername.Text + "'", con)
        dr = cmd.ExecuteReader
        If (dr.Read) Then
            If (dr(0).ToString = txtPassword.Text) Then
                Session("UserID") = dr(1).ToString
                Session("Role") = dr(2).ToString
                Session("FacultyOfUser") = dr(3).ToString
                FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, True)
            Else
                MsgBox("Password is invalid")
            End If
        Else
            MsgBox("Username is invalid")
        End If
    End Sub
End Class