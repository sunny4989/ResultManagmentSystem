Imports System.Data.SqlClient
Public Class SemesterResult
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        Try
            Dim Department As String = Trim(ProgramDropDownList.SelectedValue)
            Dim semester As Integer = SemsterDropDownList.SelectedValue

            Dim cmdString As String = "SELECT DISTINCT STUDENT.EntryNo, STUDENT.Name FROM STUDENT INNER JOIN RESULT ON STUDENT.EntryNo = RESULT.EntryNumber WHERE (STUDENT.ProgramCode = @departmentCode) AND (RESULT.StudiedInSemester = @semester)"

            Dim con As SqlConnection = ConnectionManager.getConnection()

            Dim cmd As New SqlCommand(cmdString, con)
            cmd.Parameters.Add("@departmentCode", SqlDbType.VarChar, 13).Value = Department
            cmd.Parameters.Add("@semester", SqlDbType.Int).Value = semester

            Dim dr As SqlDataReader = cmd.ExecuteReader


            Dim entryno As String = ""
            Dim Name As String = ""
            Dim sgpa As String = ""
            Dim cgpa As String = ""
            Dim Formatedresult As String = ""

            ResultBulletedList.Items.Clear()

            While dr.Read()
                entryno = dr.GetString(0)
                Name = dr.GetString(1)
                sgpa = UniversityDataAccess.getSGPA(entryno, semester)
                cgpa = UniversityDataAccess.getCGPA(entryno, semester)
                Formatedresult = " " & entryno & "  " & Name & "              " & sgpa & "           " & cgpa
                ResultBulletedList.Items.Add(Formatedresult)

            End While

            con.Close()



        Catch ex As Exception
            FeedbackLabel.Text = ex.ToString
        End Try
    End Sub
End Class