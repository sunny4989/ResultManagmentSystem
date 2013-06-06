Public Class AddProgram
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            Response.Redirect("~/home.aspx")
        End If
        ProgramDetailsView.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub ProgramDetailsView_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles ProgramDetailsView.ModeChanging
        e.NewMode = DetailsViewMode.Insert
    End Sub

    Protected Sub ProgramDetailsView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles ProgramDetailsView.ItemInserted
        FeedbackLabel.Text = "New program added"
    End Sub
End Class