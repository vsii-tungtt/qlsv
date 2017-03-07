Imports System.Data.SqlClient
Imports System.Web.Security
Public Class ChangePassword
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim cmdUpdate As SqlCommand
    Dim dr As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnChangePassword_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnChangePassword.Click
        Dim currentPassword As String = txtCurrentPassword.Text
        Dim newPassword As String = txtNewPassword.Text
        Dim userId As String = Session("UserID")
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("SELECT password FROM users WHERE id=" + userId, con)
        dr = cmd.ExecuteReader
        If (dr.Read) Then
            If (dr(0).ToString = currentPassword) Then
                If (newPassword.Length < 6 Or newPassword.Length > 12) Then
                    MsgBox("Password Is Too Short Or Too Long. Please Enter >= 6 Or <=12 characters ")
                Else
                    cmd.Dispose()
                    dr.Close()
                    cmdUpdate = New SqlCommand("UPDATE users SET password='" + newPassword + "' WHERE id = " + userId, con)
                    cmdUpdate.ExecuteNonQuery()
                    con.Close()
                    Response.Redirect("Default.aspx")
                End If
            Else
                MsgBox("Password Is Wrong. Re-enter Correct Password")
            End If
        Else
            Response.Redirect("Logout.aspx")
        End If
    End Sub
End Class