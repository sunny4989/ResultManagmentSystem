Public Class StudentResult
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ByEntryNumberButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ByEntryNumberButton.Click
        sgpa_and_cgpa_label.Text = ""
        Try
            Dim entryno As String = Trim(EntryNumberTextBox.Text)
            Dim semester As Int32 = DropDownList1.SelectedValue
            Dim sgpa As String = UniversityDataAccess.getSGPA(entryno, semester)
            Dim cgpa As String = UniversityDataAccess.getCGPA(entryno, semester)

            sgpa_and_cgpa_label.Text = "SGPA : " & sgpa & " CGPA : " & cgpa
        Catch ex As Exception
            FeedbackLabel.Text = ex.ToString
        End Try
    End Sub
End Class