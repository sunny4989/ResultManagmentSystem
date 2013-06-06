Public Class ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            Response.Redirect("~/home.aspx")
        End If
    End Sub

    Protected Sub Button_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button.Click
        Dim username As String = UserNameDropDownList.Text
        Dim password As String = Trim(PasswordTextBox.Text)
        Dim cPassword As String = Trim(ConfirmPasswordTextBox.Text)

        If password = cPassword Then
            Try
                If UniversityDataAccess.resetPassword(username, password) Then
                    FeedbackLabel.Text = "Password of " & username & " changed Successfully"
                Else
                    FeedbackLabel.Text = "Password could not be changed"
                End If
            Catch ex As Exception
                FeedbackLabel.Text = "Some Unexpected Error happened. Please try again!!"
            End Try
        Else
            FeedbackLabel.Text = "Password do not match!!"
        End If
    End Sub
End Class