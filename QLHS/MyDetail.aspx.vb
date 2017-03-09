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
        cmd = New SqlCommand("SELECT users.full_name as fullname, users.birthday as birthday, sexes.sex as sex, users.residence as residence, users.country as country, users.username as username, faculties.faculty_name as facultyName FROM users INNER JOIN faculties ON users.faculty_id = faculties.id LEFT JOIN sexes ON users.sex = sexes.id WHERE users.id=" + Session("UserID"))
        cmd.Connection = con
        sda = New SqlDataAdapter()
        sda.SelectCommand = cmd
        ds = New DataSet
        sda.Fill(ds)
        con.Close()
        If ds.Tables(0).Rows.Count > 0 Then
            lblUsername.Text = ds.Tables(0).Rows(0)("username").ToString()
            lblFaculty.Text = ds.Tables(0).Rows(0)("facultyName").ToString()
            If Not String.IsNullOrEmpty(ds.Tables(0).Rows(0)("fullname").ToString) Then
                lblFullname.Text = ds.Tables(0).Rows(0)("fullname").ToString()
            Else
                lblFullname.Text = "&nbsp;"
            End If
            If Not String.IsNullOrEmpty(ds.Tables(0).Rows(0)("birthday").ToString()) Then
                lblBirthday.Text = ds.Tables(0).Rows(0)("birthday").ToString()
            Else
                lblBirthday.Text = "&nbsp;"
            End If
            If Not String.IsNullOrEmpty(ds.Tables(0).Rows(0)("sex").ToString()) Then
                lblSex.Text = ds.Tables(0).Rows(0)("sex").ToString()
            Else
                lblSex.Text = "&nbsp;"
            End If
            If Not String.IsNullOrEmpty(ds.Tables(0).Rows(0)("residence").ToString()) Then
                lblAddress.Text = ds.Tables(0).Rows(0)("residence").ToString()
            Else
                lblAddress.Text = "&nbsp;"
            End If
            If Not String.IsNullOrEmpty(ds.Tables(0).Rows(0)("country").ToString()) Then
                lblCountry.Text = ds.Tables(0).Rows(0)("country").ToString()
            Else
                lblCountry.Text = "&nbsp;"
            End If
        End If
    End Sub
End Class