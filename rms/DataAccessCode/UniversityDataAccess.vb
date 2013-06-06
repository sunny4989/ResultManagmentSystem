Imports System.Data.SqlClient
Public Class UniversityDataAccess
    Shared Function getUsertype(ByVal username As String, ByVal password As String) As String

        Dim cmdString As String = "SELECT * FROM Employee where userName = @username AND Password = @password"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 26).Value = username
        cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password

        Dim dr As SqlDataReader = cmd.ExecuteReader
        Dim usertype As String = ""

        While dr.Read()
            If dr.GetString(1).ToString = username Then
                usertype = dr.GetString(4)
            End If
        End While

        con.Close()

        Return usertype
    End Function
    Shared Function assignusernametoFaculty(ByVal username As String, ByVal facultyid As String)
        Dim cmdString As String = "INSERT into facultyhasusename values(@username, @facultyid)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)

        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 26).Value = username
        cmd.Parameters.Add("@facultyid", SqlDbType.Int).Value = facultyid


        Dim rowsAffected = cmd.ExecuteNonQuery

        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()

    End Function

    Shared Function resetPassword(ByVal username As String, ByVal password As String) As Boolean
        Dim cmdString As String = "UPDATE Employee Set Password= @password WHERE username = @username"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 26).Value = username
        cmd.Parameters.Add("@password", SqlDbType.NVarChar, 50).Value = password

        Dim rowsAffected = cmd.ExecuteNonQuery
        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()
    End Function

    ' Add a new User
    Shared Function addNewUser(ByVal username As String, ByVal name As String, ByVal password As String, ByVal email As String, ByVal usertype As String) As Boolean

        Dim cmdString As String = "INSERT into employee values(@name, @username, @email, @passwd, @type)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)

        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 26).Value = name
        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 26).Value = username
        cmd.Parameters.Add("@email", SqlDbType.NVarChar, 50).Value = email
        cmd.Parameters.Add("@passwd", SqlDbType.NVarChar, 50).Value = password
        cmd.Parameters.Add("@type", SqlDbType.NVarChar, 13).Value = usertype


        Dim rowsAffected = cmd.ExecuteNonQuery

        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()
    End Function

    ' Add a new Student User
    Shared Function addNewStudent(ByVal entryno As String,
                                ByVal name As String,
                                ByVal dob As Date,
                                ByVal fathername As String,
                                ByVal sex As String,
                                ByVal programEnrolled As String,
                                ByVal mobile As String,
                                ByVal email As String,
                                ByVal permanentaddr As String,
                                ByVal corraddre As String) As Boolean

        Dim cmdString As String = "INSERT into student values(@a, @b, @c, @d, @e, @f, @g, @h, @i, @j)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)

        cmd.Parameters.Add("@a", SqlDbType.Char, 13).Value = StrConv(entryno, vbUpperCase)
        cmd.Parameters.Add("@b", SqlDbType.NVarChar, 26).Value = StrConv(name, vbUpperCase)
        cmd.Parameters.Add("@c", SqlDbType.NVarChar, 13).Value = programEnrolled
        cmd.Parameters.Add("@d", SqlDbType.NVarChar, 26).Value = StrConv(fathername, vbUpperCase)
        cmd.Parameters.Add("@e", SqlDbType.Char, 7).Value = sex
        cmd.Parameters.Add("@f", SqlDbType.Date).Value = dob
        cmd.Parameters.Add("@g", SqlDbType.NVarChar, 26).Value = email
        cmd.Parameters.Add("@h", SqlDbType.NVarChar, 11).Value = mobile
        cmd.Parameters.Add("@i", SqlDbType.NVarChar, 111).Value = permanentaddr
        cmd.Parameters.Add("@j", SqlDbType.NVarChar, 111).Value = corraddre

        Dim rowsAffected = cmd.ExecuteNonQuery

        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()
    End Function

    Shared Function GetAllocatedSubjects(ByVal programecode, ByVal semester) As ArrayList

        Dim cmdString As String = "select * from Subject_Allocation where ProgramCode = @pCode AND semester = @sem"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)

        cmd.Parameters.Add("@pCode", SqlDbType.NVarChar, 13).Value = programecode
        cmd.Parameters.Add("@sem", SqlDbType.Int, 26).Value = semester

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim allocatedSubjects As New ArrayList()


        While dr.Read
            For i As Integer = 0 To 10
                allocatedSubjects.Add(dr.GetString(i + 2))
            Next
        End While

        Return allocatedSubjects
    End Function

    ' Allocate subjects to a departement and semester
    Shared Function assignSubjects(ByVal programcode As String,
                               ByVal semester As String,
                               ByVal s1 As String,
                               ByVal s2 As String,
                               ByVal s3 As String,
                               ByVal s4 As String,
                               ByVal s5 As String,
                               ByVal s6 As String,
                               ByVal s7 As String,
                               ByVal s8 As String,
                               ByVal s9 As String,
                               ByVal s10 As String) As Boolean

        Dim cmdString As String = "INSERT into Subject_allocation values(@p1, @p2, @p3, @p4, @p5, @p6, @p7, @p8, @p9, @p10, @p11, @p12)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)

        cmd.Parameters.Add("@p1", SqlDbType.NVarChar, 13).Value = programcode
        cmd.Parameters.Add("@p2", SqlDbType.Int).Value = semester
        cmd.Parameters.Add("@p3", SqlDbType.NVarChar, 10).Value = s1
        cmd.Parameters.Add("@p4", SqlDbType.NVarChar, 10).Value = s2
        cmd.Parameters.Add("@p5", SqlDbType.NVarChar, 10).Value = s3
        cmd.Parameters.Add("@p6", SqlDbType.NVarChar, 10).Value = s4
        cmd.Parameters.Add("@p7", SqlDbType.NVarChar, 10).Value = s5
        cmd.Parameters.Add("@p8", SqlDbType.NVarChar, 10).Value = s6
        cmd.Parameters.Add("@p9", SqlDbType.NVarChar, 10).Value = s7
        cmd.Parameters.Add("@p10", SqlDbType.NVarChar, 10).Value = s8
        cmd.Parameters.Add("@p11", SqlDbType.NVarChar, 10).Value = s9
        cmd.Parameters.Add("@p12", SqlDbType.NVarChar, 10).Value = s10

        Dim rowsAffected = cmd.ExecuteNonQuery

        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()
    End Function

    ' check if subjects are already allocated
    Shared Function isSubjectAlreayAllocated(ByVal programeCode As String, ByVal semester As Integer) As Boolean

        Dim cmdString As String = "SELECT * FROM Subject_allocation where programcode = @pCode AND semester = @semester"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@pCode", SqlDbType.NVarChar, 26).Value = programeCode
        cmd.Parameters.Add("@semester", SqlDbType.Int).Value = semester

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim result As Boolean = False

        While dr.Read()
            If dr.GetString(0).ToString = programeCode Then
                result = True
            End If
        End While

        con.Close()

        Return result
    End Function

    Shared Function getSubjectName(ByVal subjectCode As String) As String
        Dim cmdString As String = "SELECT subName FROM Subject where subCode = @subjectCode"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@subjectCode", SqlDbType.NVarChar, 13).Value = subjectCode


        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim subjectName As String = ""

        While dr.Read()
            subjectName = dr.GetString(0)
        End While

        con.Close()

        Return subjectName

    End Function

    'Assingn subject to a Faculty
    Shared Function allocateSubjectToFaculty(ByVal subjectCode As String, ByVal facultyID As String) As Boolean
        Dim cmdString As String = "INSERT INTO teach_by VALUES (@subjectCode, @FacultyID)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@subjectCode", SqlDbType.NVarChar, 13).Value = subjectCode
        cmd.Parameters.Add("@FacultyID", SqlDbType.BigInt).Value = facultyID


        Dim rowsAffected = cmd.ExecuteNonQuery

        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()

    End Function

    Shared Function isSubjectAlreayAllocatedToFaculty(ByVal subjectCode As String, ByVal FacultyID As Integer) As Boolean

        Dim cmdString As String = "SELECT * FROM Teach_by where subjectcode = @subjectCode AND facultyId = @facultyid"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@subjectCode", SqlDbType.NVarChar, 26).Value = subjectCode
        cmd.Parameters.Add("@facultyid", SqlDbType.Int).Value = FacultyID

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim result As Boolean = False

        While dr.Read()
            If dr.GetString(0).ToString = subjectCode Then
                result = True
            End If
        End While

        con.Close()

        Return result
    End Function
    Shared Function deleteSubjectAssignedToFaculty(ByVal subjectCode As String, ByVal facultyID As String) As Boolean
        Dim cmdString As String = "DELETE FROM teach_by WHERE subjectcode = @subjectCode AND facultyId = @facultyid"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@subjectCode", SqlDbType.NVarChar, 13).Value = subjectCode
        cmd.Parameters.Add("@FacultyID", SqlDbType.BigInt).Value = facultyID


        Dim rowsAffected = cmd.ExecuteNonQuery

        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()
    End Function

    'Returns Faculty name and email as Array list
    Shared Function getFacultyInfo(ByVal facultyid As String) As ArrayList
        Dim cmdString As String = "SELECT * FROM Faculty where facultyid = @facultyid"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@facultyid", SqlDbType.Int).Value = facultyid


        Dim dr As SqlDataReader = cmd.ExecuteReader
        Dim facultyname As String = ""
        Dim facultyemail As String = ""

        While dr.Read()
            facultyname = dr.GetString(1)
            facultyemail = dr.GetString(2)
        End While

        con.Close()

        Dim arr As New ArrayList
        arr.Add(facultyname)
        arr.Add(facultyemail)

        Return arr
    End Function
    Shared Function getFacultyCode(ByVal username As String) As String
        Dim cmdString As String = "SELECT FacultyID FROM Facultyhasusename where userName = @username"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@username", SqlDbType.NVarChar, 26).Value = username

        Dim dr As SqlDataReader = cmd.ExecuteReader
        Dim facultyCode As Integer

        While dr.Read()
            facultyCode = CInt(dr.GetValue(0))
        End While

        con.Close()
        Return facultyCode

    End Function


    Shared Function resultAlreadyExist(ByVal entryNo As String, ByVal semester As Integer, ByVal subjectCode As String) As Boolean
        Dim cmdString As String = "SELECT * FROM result where EntryNumber = @entryNo AND StudiedInSemester = @semester and SubjectCode = @subjectCode"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@subjectCode", SqlDbType.Char, 13).Value = subjectCode
        cmd.Parameters.Add("@entryNo", SqlDbType.Char, 13).Value = entryNo
        cmd.Parameters.Add("@semester", SqlDbType.Int).Value = semester

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim result As Boolean = False

        While dr.Read()
            If dr.GetString(0).ToString = subjectCode And dr.GetValue(3) = semester And dr.GetString(1) = entryNo Then
                result = True

            End If
        End While

        con.Close()
        Return result
    End Function


    Shared Function InsertNewResult(ByVal subjectCode As String,
                                    ByVal entryNo As String,
                                    ByVal semester As Integer,
                                    ByVal status As Char,
                                    ByVal m1m As Integer,
                                    ByVal m1mof As Integer,
                                    ByVal m2m As Integer,
                                    ByVal m2mof As Integer,
                                    ByVal assign As Integer,
                                    ByVal assignof As Integer,
                                    ByVal mjr As Integer,
                                    ByVal mjrof As Integer,
                                    ByVal grade As String,
                                    ByVal additionalComments As String)
        Dim cmdString As String = "INSERT INTO result values (@subjectcode, @entryno, @sem, @status, @m1, @m1x, @m2, @m2x, @assgn, @assgnx, @maj, @majx, @grade, @comment) "

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@subjectCode", SqlDbType.NVarChar, 13).Value = subjectCode
        cmd.Parameters.Add("@entryno", SqlDbType.Char, 13).Value = entryNo
        cmd.Parameters.Add("@sem", SqlDbType.Int).Value = semester
        cmd.Parameters.Add("@status", SqlDbType.Char, 1).Value = status
        cmd.Parameters.Add("@m1", SqlDbType.SmallInt).Value = m1m
        cmd.Parameters.Add("@m1x", SqlDbType.SmallInt).Value = m1mof
        cmd.Parameters.Add("@m2", SqlDbType.SmallInt).Value = m2m
        cmd.Parameters.Add("@m2x", SqlDbType.SmallInt).Value = m2mof
        cmd.Parameters.Add("@maj", SqlDbType.SmallInt).Value = mjr
        cmd.Parameters.Add("@majx", SqlDbType.SmallInt).Value = mjrof
        cmd.Parameters.Add("@assgn", SqlDbType.SmallInt).Value = assign
        cmd.Parameters.Add("@assgnx", SqlDbType.SmallInt).Value = assignof
        cmd.Parameters.Add("@grade", SqlDbType.Char, 4).Value = grade
        cmd.Parameters.Add("@comment", SqlDbType.VarChar, 500).Value = additionalComments

        Dim rowsAffected = cmd.ExecuteNonQuery

        If rowsAffected Then
            Return True
        Else
            Return False
        End If
        con.Close()
    End Function

    ' Get the total credits registered in a semester
    Shared Function GetCreditsRegistered(ByVal entryNo As String, ByVal semester As Int32) As Decimal

        Dim cmdString As String = "SELECT SUM(SUBJECT.Credit) AS credits FROM SUBJECT INNER JOIN RESULT ON SUBJECT.SubCode = RESULT.SubjectCode WHERE  (RESULT.EntryNumber = @entryno) AND (RESULT.StudiedInSemester = @semester)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@entryno", SqlDbType.Char, 13).Value = entryNo
        cmd.Parameters.Add("@semester", SqlDbType.Int).Value = semester

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim Credits As Decimal

        While dr.Read()
            Credits = dr.GetValue(0)
        End While

        con.Close()
        Return Credits

    End Function

    ' Get the total credits registered in a semester
    Shared Function GetAllCreditsTillSemester(ByVal entryNo As String, ByVal semester As Int32) As Decimal

        Dim cmdString As String = "SELECT SUM(SUBJECT.Credit) AS credits FROM SUBJECT INNER JOIN RESULT ON SUBJECT.SubCode = RESULT.SubjectCode WHERE  (RESULT.EntryNumber = @entryno) AND (RESULT.StudiedInSemester <= @semester)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@entryno", SqlDbType.Char, 13).Value = entryNo
        cmd.Parameters.Add("@semester", SqlDbType.Int).Value = semester

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim Credits As Decimal

        While dr.Read()
            Credits = dr.GetValue(0)
        End While

        con.Close()
        Return Credits

    End Function

    Shared Function GetGradePoints(ByVal entryNo As String, ByVal semester As Int32) As Decimal

        Dim cmdString As String = "SELECT SUM(Grading.GradePoint * SUBJECT.Credit) AS totalGradePoint FROM SUBJECT INNER JOIN  RESULT ON SUBJECT.SubCode = RESULT.SubjectCode INNER JOIN Grading ON RESULT.GradeEarned = Grading.Grade WHERE (RESULT.EntryNumber = @entryno) AND (RESULT.StudiedInSemester = @semester)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@entryno", SqlDbType.Char, 13).Value = entryNo
        cmd.Parameters.Add("@semester", SqlDbType.Int).Value = semester

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim TotalGradePoints As Decimal

        While dr.Read()
            TotalGradePoints = dr.GetValue(0)
        End While

        con.Close()
        Return TotalGradePoints

    End Function

    Shared Function GetGradePointsTillSemester(ByVal entryNo As String, ByVal semester As Int32) As Decimal

        Dim cmdString As String = "SELECT SUM(Grading.GradePoint * SUBJECT.Credit) AS totalGradePoint FROM SUBJECT INNER JOIN  RESULT ON SUBJECT.SubCode = RESULT.SubjectCode INNER JOIN Grading ON RESULT.GradeEarned = Grading.Grade WHERE (RESULT.EntryNumber = @entryno) AND (RESULT.StudiedInSemester <= @semester)"

        Dim con As SqlConnection = ConnectionManager.getConnection()

        Dim cmd As New SqlCommand(cmdString, con)
        cmd.Parameters.Add("@entryno", SqlDbType.Char, 13).Value = entryNo
        cmd.Parameters.Add("@semester", SqlDbType.Int).Value = semester

        Dim dr As SqlDataReader = cmd.ExecuteReader

        Dim TotalGradePoints As Decimal

        While dr.Read()
            TotalGradePoints = dr.GetValue(0)
        End While

        con.Close()
        Return TotalGradePoints

    End Function

    Shared Function getSGPA(ByVal entryNo As String, ByVal semester As Int32) As String

        Return (UniversityDataAccess.GetGradePoints(entryNo, semester) / UniversityDataAccess.GetCreditsRegistered(entryNo, semester)).ToString("#.00")

    End Function
    Shared Function getCGPA(ByVal entryNo As String, ByVal semester As Int32) As String

        Return (UniversityDataAccess.GetGradePointsTillSemester(entryNo, semester) / UniversityDataAccess.GetAllCreditsTillSemester(entryNo, semester)).ToString("#.00")

    End Function

End Class




