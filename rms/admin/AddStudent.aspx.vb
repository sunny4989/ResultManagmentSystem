Public Class AddStudent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            Response.Redirect("~/home.aspx")
        End If

    End Sub

    Protected Sub AddStudentButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles AddStudentButton.Click
        Dim entryno As String = Trim(EntryNoTextBox.Text)
        Dim name As String = Trim(NameTextBox.Text)
        Dim dob As Date = CDate(DOBTextBox.Text)
        Dim fathername As String = FatherNameTextBox.Text
        Dim sex As String = genderDropDownList.Text
        Dim programEnrolled As String = ProgramEnrolledDropDown.Text
        Dim mobile As String = Trim(MobileNoTextBox.Text)
        Dim email As String = Trim(EmailIdTextBox.Text)
        Dim permanentaddr As String = ParentAddressTextBox.Text
        Dim corraddre As String = TemprorayAddressTextBox.Text

        Try
            If UniversityDataAccess.addNewStudent(entryno, name, dob, fathername, sex, programEnrolled, mobile, email, permanentaddr, corraddre) Then

                FeedbackLabel.Text = "Student " & name & " added successfully"
                EntryNoTextBox.Text = ""
                NameTextBox.Text = ""
                DOBTextBox.Text = ""
                FatherNameTextBox.Text = ""
                MobileNoTextBox.Text = ""
                EmailIdTextBox.Text = ""
                ParentAddressTextBox.Text = ""
                TemprorayAddressTextBox.Text = ""
            Else
                FeedbackLabel.Text = "Cannot add student"
            End If
        Catch ex As Exception
            FeedbackLabel.Text = "Unexpected Error happened. Please try again!!"
        End Try
    End Sub
End Class