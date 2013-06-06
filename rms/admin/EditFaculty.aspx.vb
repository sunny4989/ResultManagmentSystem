Public Class EditFaculty
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            Response.Redirect("~/home.aspx")
        End If
    End Sub

    Protected Sub FacultyEditGridView_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles FacultyEditGridView.RowUpdated
        FeedbackLabel.Text = "Edit Successfull"
    End Sub
End Class