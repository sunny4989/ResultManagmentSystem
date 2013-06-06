Public Class AddSubject
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            Response.Redirect("~/home.aspx")
        End If
        DetailsView1.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub DetailsView1_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsView1.ModeChanging
        e.NewMode = DetailsViewMode.Insert
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        FeedbackLabel.Text = "New subject Added successfully"
    End Sub
End Class