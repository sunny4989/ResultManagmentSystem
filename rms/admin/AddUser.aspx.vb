Public Class AddUser
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        If Not usertype = "admin" Then
            Response.Redirect("~/home.aspx")
        End If
        If Not IsPostBack Then
           ' FeedbackLabel.Text = "not a postback"

            SelectFacultyNamePanel.Visible = False
        Else
            Try
                If Trim(uTypeDropbox.SelectedValue) = "faculty" Then
                    SelectFacultyNamePanel.Visible = True
                    If Not FacultyIDDropDownList.SelectedValue = "" Then
                        Dim facultyid As Integer = FacultyIDDropDownList.SelectedValue
                        Dim facultyInfo As ArrayList = UniversityDataAccess.getFacultyInfo(facultyid)
                        NameTextbox.Text = facultyInfo.Item(0)
                        NameTextbox.Enabled = False

                        EmailTextBox.Text = facultyInfo.Item(1)
                        EmailTextBox.Enabled = False
                    End If
                Else
                    SelectFacultyNamePanel.Visible = False
                End If

            Catch ex As Exception
                FeedbackLabel.Text = ex.ToString
            End Try


        End If

    End Sub

    Protected Sub addUserButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles addUserButton.Click
        Me.Validate()
        Dim username As String = Trim(UsernameTexbox.Text)
        Dim name As String = Trim(NameTextbox.Text)
        Dim password As String = Trim(PasswordTextBox.Text)
        Dim email As String = Trim(EmailTextBox.Text)
        Dim usertype As String = Trim(uTypeDropbox.Text)
        Dim facultyid As String = Trim(FacultyIDDropDownList.Text)

        If Not username = "" Then
            Try
                If UniversityDataAccess.addNewUser(username, name, password, email, usertype) Then
                    If usertype = "faculty" Then
                        UniversityDataAccess.assignusernametoFaculty(username, facultyid)
                    End If
                    FeedbackLabel.Text = "User added successfully"
                    UsernameTexbox.Text = ""
                    NameTextbox.Text = ""
                    PasswordTextBox.Text = ""
                    EmailTextBox.Text = ""
                Else
                    FeedbackLabel.Text = "Can't add user"
                End If
            Catch ex As Exception
                FeedbackLabel.Text = "Username already exit. Please try a different username."
            End Try
        Else
            FeedbackLabel.Text = "Please fill all the required fields"
        End If



    End Sub

End Class