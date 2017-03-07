Imports System.Data.SqlClient
Imports System.Web.Security
Public Class AddNewClass
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim cmd1 As SqlCommand
    Dim dr As SqlDataReader
    Const ROLE_TEACHER As String = "1"
    Const ROLE_STUDENT As String = "2"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("Role") = ROLE_STUDENT) Then
            Throw New System.Exception("You are not authorized to do this.")
        End If
    End Sub

    Protected Sub btnCreateClass_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnCreateClass.Click
        Dim classCode As String = txtClassCode.Text
        Dim className As String = txtClassName.Text
        Dim faculty As String = Session("FacultyOfUser")
        con = New SqlConnection(ConfigurationManager.ConnectionStrings("QLSV").ConnectionString)
        con.Open()
        cmd1 = New SqlCommand("SELECT * FROM classes WHERE delflg=0 AND class_code='" + classCode + "'", con)
        dr = cmd1.ExecuteReader
        If (dr.Read) Then
            MsgBox("Class ID has used.")
        Else
            cmd1.Dispose()
            dr.Close()
            cmd = New SqlCommand("INSERT INTO classes(class_name, faculty_id, delflg, class_code) VALUES ('" + className + "', " + faculty + ", 0, '" + classCode + "')")
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            Response.Redirect("~/ClassesList.aspx")
        End If
    End Sub
End Class