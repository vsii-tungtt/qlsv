Imports System.Data.SqlClient
Imports System.Web.Security
Public Class EditMyDetail
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim sda As SqlDataAdapter
    Dim ds As DataSet
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindData()
        End If
    End Sub

    Private Sub BindData()
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("SELECT users.full_name as fullname, users.birthday as birthday, sexes.id as sex, users.residence as residence, users.country as country, users.username as username, faculties.faculty_name as facultyName FROM users INNER JOIN faculties ON users.faculty_id = faculties.id LEFT JOIN sexes ON users.sex = sexes.id WHERE users.id=" + Session("UserID"))
        cmd.Connection = con
        sda = New SqlDataAdapter()
        sda.SelectCommand = cmd
        ds = New DataSet
        sda.Fill(ds)
        con.Close()
        If ds.Tables(0).Rows.Count > 0 Then
            lblUsername.Text = ds.Tables(0).Rows(0)("username").ToString()
            lblFaculty.Text = ds.Tables(0).Rows(0)("facultyName").ToString()
            txtFullname.Text = ds.Tables(0).Rows(0)("fullname").ToString()
            txtBirthday.Text = ds.Tables(0).Rows(0)("birthday").ToString()
            If Not String.IsNullOrEmpty(ds.Tables(0).Rows(0)("sex").ToString()) Then
                txtSex.SelectedValue = ds.Tables(0).Rows(0)("sex").ToString()
            End If
            txtAddress.Text = ds.Tables(0).Rows(0)("residence").ToString()
            txtCountry.Text = ds.Tables(0).Rows(0)("country").ToString()
        End If
    End Sub

    Protected Sub btnEditDetail_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnEditDetail.Click
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd = New SqlCommand("UPDATE users SET full_name='" + txtFullname.Text + "', birthday='" + txtBirthday.Text + "', sex='" + txtSex.SelectedValue.ToString + "', residence='" + txtAddress.Text + "', country='" + txtCountry.Text + "'")
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        con.Close()
        Response.Redirect("~/MyDetail.aspx")
    End Sub
End Class