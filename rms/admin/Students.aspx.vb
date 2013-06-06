Public Class Students
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            Response.Redirect("~/home.aspx")
        End If
    End Sub

End Class