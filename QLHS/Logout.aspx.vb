﻿Imports System.Data.SqlClient
Imports System.Web.Security
Public Class Logout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormsAuthentication.SignOut()
        Response.Redirect("Login.aspx")
    End Sub

End Class