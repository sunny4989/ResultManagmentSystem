Public Class EditStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            'Response.Redirect("~/home.aspx")
        End If
        'panel2.Visible = False
    End Sub

    Protected Sub EditEnrtyNumberButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles EditEnrtyNumberButton.Click

    End Sub

    Protected Sub DetailsView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsView1.ItemDeleted
        FeedbackLabel.Text = "Student deleted successfully"
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        FeedbackLabel.Text = "Student added successfully"
    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        FeedbackLabel.Text = "Inforamtion of " & EditEntryNoTextBox.Text & " updated"
    End Sub
End Class