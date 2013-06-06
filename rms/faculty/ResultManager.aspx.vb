Option Explicit Off

Public Class ResultManager
    Inherits System.Web.UI.Page

    Dim facultyCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "faculty" Then
            Response.Redirect("~/home.aspx")
        End If

        If Not IsPostBack Then
            Dim entryno As String = Trim(EntryNumberDropDownList.Text)
            Dim semester As Integer = Trim(SemesterDropDownList.Text)
            Dim subjectCode As String=Trim(SubjectDropDownList.SelectedValue)
            Try

                If Not UniversityDataAccess.resultAlreadyExist(entryno, semester, subjectCode) Then
                    UpdateResultButton.Visible = False
                    ' get ResultInfo()

                Else
                    AddResultButton.Visible = True
                    ' set ResultInfo()
                End If

            Catch ex As Exception

            End Try

        End If

    End Sub


    Protected Sub CustomValidator1_ServerValidate1(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles Minor1MarkCustomValidator.ServerValidate
        Dim marks As String = Minor1MarkTextBox.Text
        Dim total As String = Minor1MarkOutOfTextBox.Text
        validate_marksObtained(args, marks, total, Minor1MarkCustomValidator.ErrorMessage)

    End Sub

    Protected Sub CustomValidator3_ServerValidate1(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles AssigmentMarkCustomValidator.ServerValidate
        Dim marks As String = Minor2MarkTextBox.Text
        Dim total As String = Minor2MarkOutOfTextBox.Text
        validate_marksObtained(args, marks, total, Minor2MarkCustomValidator.ErrorMessage)
    End Sub

    Protected Sub CustomValidator4_ServerValidate1(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles MajorMarkCustomValidator.ServerValidate

        Dim marks As String = AssignmentMarkTextBox.Text
        Dim total As String = AssignmentMarkOutOfTextBox.Text
        validate_marksObtained(args, marks, total, AssigmentMarkCustomValidator.ErrorMessage)
    End Sub

    Protected Sub Minor2MarkCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles Minor2MarkCustomValidator.ServerValidate

        Dim marks As String = MajorMarkTextBox.Text
        Dim total As String = MajorMarkOutOfTextBox.Text
        validate_marksObtained(args, marks, total, MajorMarkCustomValidator.ErrorMessage)
    End Sub

    Private Sub validate_marksObtained(ByRef args As System.Web.UI.WebControls.ServerValidateEventArgs, ByVal marks As String, ByVal total As String, ByRef validator As String)
        If CInt(marks) > CInt(total) Then
            validator = "Marks Obtained can't be greater " & total
            args.IsValid = False
        Else
            args.IsValid = True
        End If
    End Sub

    Protected Sub Minor1MarkTextBox_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles Minor1MarkTextBox.TextChanged
        Me.Validate()
    End Sub

    Protected Sub AddResultButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles AddResultButton.Click
        Dim subjectCode As String = Trim(SubjectDropDownList.SelectedValue)
        Dim entryNo As String = Trim(EntryNumberDropDownList.SelectedValue)
        Dim semester As Integer = CInt(Trim(SemesterDropDownList.SelectedValue))
        Dim status As Char = Trim(StatusDropDownList.SelectedValue)
        Dim m1m As Integer = CInt(Trim(Minor1MarkTextBox.Text))
        Dim m1mof As Integer = CInt(Trim(Minor1MarkOutOfTextBox.Text))
        Dim m2m As Integer = CInt(Trim(Minor2MarkTextBox.Text))
        Dim m2mof As Integer = CInt(Trim(Minor2MarkTextBox.Text))
        Dim assign As Integer = CInt(Trim(AssignmentMarkTextBox.Text))
        Dim assignof As Integer = CInt(Trim(AssignmentMarkOutOfTextBox.Text))
        Dim mjr As Integer = CInt(Trim(MajorMarkTextBox.Text))
        Dim mjrof As Integer = CInt(Trim(MajorMarkOutOfTextBox.Text))
        Dim grade As String = Trim(GradeEarnedDropdownList.Text)
        Dim additionalComments As String = Trim(CommentTextBox.Text)

        Try
            If UniversityDataAccess.InsertNewResult(subjectCode, entryNo, semester, status, m1m, m1mof, m2m, m2mof, assign, assignof, mjr, mjrof, grade, additionalComments) Then
                FeedbackLabel.Text = "Result of " & entryNo & "added successfully"
            Else
                FeedbackLabel.Text = "Result cannot be added"
            End If
        Catch ex As Exception
            FeedbackLabel.Text = ex.ToString
        End Try
    End Sub
End Class