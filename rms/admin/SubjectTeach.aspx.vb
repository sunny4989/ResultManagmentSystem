Public Class SubjectTeach
    Inherits System.Web.UI.Page

    Private Sub SubjectTeach_InitComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.InitComplete

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'check user authentication
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            ' Response.Redirect("~/home.aspx")
        End If

    End Sub


    Protected Sub SubjectCodeDropDownList_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles SubjectCodeDropDownList.SelectedIndexChanged
        Try
            Dim subjectCode As String = SubjectCodeDropDownList.Text
            SubjectNameLabel.Text = UniversityDataAccess.getSubjectName(subjectCode)
        Catch ex As Exception
            SubjectNameLabel.Text = "Error"
        End Try

    End Sub

    Protected Sub SubjectCodeDropDownList_Load(ByVal sender As Object, ByVal e As EventArgs) Handles SubjectCodeDropDownList.Load
        Dim subjectCode As String = SubjectCodeDropDownList.Text
        Try

            SubjectNameLabel.Text = UniversityDataAccess.getSubjectName(subjectCode)
        Catch ex As Exception
            SubjectNameLabel.Text = "Error"
        End Try
    End Sub

    Protected Sub AddButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles AddButton.Click
        Dim tSubCode As String = SubjectCodeDropDownList.Text
        Dim tFacultyid As String = AddTeacherNameDropDownList.SelectedValue

        Try
            'check if subcode and Faculty is already assigned
            If UniversityDataAccess.isSubjectAlreayAllocatedToFaculty(tSubCode, tFacultyid) Then
                FeedbackLabel.Text = "Error:" & tSubCode & " already assigned to " & tFacultyid
            Else

                'insert the subcode and Faculyid in database
                If UniversityDataAccess.allocateSubjectToFaculty(tSubCode, tFacultyid) Then
                    FeedbackLabel.Text = "Assigned " & tSubCode & " to " & tFacultyid
                End If

            End If

        Catch ex As Exception

            FeedbackLabel.Text = "Unexpected Error !! Cannot Connect to database"
        End Try


    End Sub

    Protected Sub DeleteButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles DeleteButton.Click
        Dim tSubCode As String = DeleteSubjectCodeDropDownList.SelectedValue
        Dim tFacultyid As String = DeleteFacultyNameDropDownList.SelectedValue

        Try

            'insert the subcode and Faculyid in database
            If UniversityDataAccess.deleteSubjectAssignedToFaculty(tSubCode, tFacultyid) Then
                FeedbackDeleteSubjectAllocationLabel.Text = "UnAssigned " & tSubCode & " from " & tFacultyid
            End If


        Catch ex As Exception

            FeedbackDeleteSubjectAllocationLabel.Text = "Unexpected Error !!" & ex.ToString
        End Try
    End Sub
End Class