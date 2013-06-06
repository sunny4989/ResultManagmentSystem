Imports System.Data.SqlClient


Public Class ConnectionManager
    Shared Function getConnection() As SqlConnection
        Dim con As New SqlConnection()
        con.ConnectionString = ConfigurationManager.ConnectionStrings("SMVDU_CON_STRING").ConnectionString
        con.Open()

        Return con
    End Function
End Class
