Public Class SubjectAllocation
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            ' Response.Redirect("~/home.aspx")
        End If
        Panel1.Visible = False

    End Sub

    Protected Sub AddExtraSubjectButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles AddExtraSubjectButton.Click
        Dim programCode As String = ProgramNameDropDownList.Text
        Dim semester As Integer = SemsterDropDownList.SelectedValue

        Dim s1 As String = Subject1DropDownList.SelectedValue
        Dim s2 As String = Subject2DropDownList.SelectedValue
        Dim s3 As String = Subject3DropDownList.SelectedValue
        Dim s4 As String = Subject4DropDownList.SelectedValue
        Dim s5 As String = Subject5DropDownList.SelectedValue
        Dim s6 As String = Subject6DropDownList.SelectedValue
        Dim s7 As String = Subject7DropDownList.SelectedValue
        Dim s8 As String = Subject8DropDownList.SelectedValue
        Dim s9 As String = Subject9DropDownList.SelectedValue
        Dim s10 As String = Subject10DropDownList.SelectedValue

        Try
            If UniversityDataAccess.assignSubjects(programCode, semester, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10) Then
                FeedbackLabel.Text = "Subjects successfully assigned to " & programCode & " semester : " & semester
            Else
                FeedbackLabel.Text = "Subjects already allocated"
            End If
        Catch ex As Exception
            FeedbackLabel.Text = ex.ToString
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Dim programCode As String = ProgramNameDropDownList.Text
        Dim semester As Integer = SemsterDropDownList.SelectedValue

        Try
            If UniversityDataAccess.isSubjectAlreayAllocated(programCode, semester) Then
                FeedbackLabel.Text = "Subjects already allocated to " & programCode & ", semester " & semester
            Else
                Panel1.Visible = True
            End If
        Catch ex As Exception

        End Try

    End Sub
End Class