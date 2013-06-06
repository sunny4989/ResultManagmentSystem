
Public Class basic
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim usertype As String = Session("usertype")
        loggedInPanel.Visible = False
        LogInPanel.Visible = False
        FacultyTreeView.Visible = False
        AdminTree.Visible = False

        If usertype = "admin" Then
            loggedInPanel.Visible = True
            AdminTree.Visible = True


        ElseIf usertype = "faculty" Then
            loggedInPanel.Visible = True
            FacultyTreeView.Visible = True
        Else
            LogInPanel.Visible = True
        End If
    End Sub

    Protected Sub loginButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles loginButton.Click
        Dim username As String = Trim(UsernameTexbox.Text)
        Dim pwd As String = Trim(PasswdTexbox.Text)
        Dim usertype As String = "adf"
        Try
            usertype = UniversityDataAccess.getUsertype(username, pwd)


            If usertype = "admin" Then
                Session("username") = username
                Session("usertype") = "admin"
                Response.Redirect("~/admin.aspx")
            ElseIf usertype = "faculty" Then
                Session("username") = username
                Session("usertype") = "faculty"
                Try
                    Session("LoggedFacultyID") = UniversityDataAccess.getFacultyCode(username)
                    Response.Redirect("~/faculty.aspx")
                Catch ex As Exception
                    MasterFeedbackMsg.Text = "Unexpected error occured. Please try again Later." & ex.ToString
                End Try

            Else
                Session("username") = ""
                Session("usertype") = "guest"
                ErrorMessage1.Text = "Invalid authentication!"
            End If
        Catch ex As Exception
            ErrorMessage1.Text = "Cannot Connect to database" & ex.ToString
        End Try

        ' ErrorMessage1.Text = username & pwd & usertype
    End Sub

    Protected Sub LogoutButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LogoutButton.Click
        Session("usertype") = ""
        Response.Redirect("~/home.aspx")
    End Sub
End Class