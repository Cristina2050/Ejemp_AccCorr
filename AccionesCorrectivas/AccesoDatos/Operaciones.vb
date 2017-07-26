Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxPopupControl



Public Class Operaciones
    Public Shared Sub Insert(tabla As String, valores As String, basedatos As String, popUp As ASPxPopupControl)

        Try
            Dim query As String
            query = "INSERT INTO " + tabla + " VALUES (" + valores + " )"
            Dim cmd As SqlCommand = New SqlCommand(query, SingletonDB.GetInstance(basedatos))
            SingletonDB.Open(basedatos)
            cmd.ExecuteNonQuery()
            SingletonDB.Close(basedatos)
        Catch ex As Exception
            SingletonDB.Close(basedatos)
            popUp.ShowOnPageLoad = True
        End Try
    End Sub


    Public Shared Sub Update(tabla As String, ParametrosConValores As String, condicion As String, basedatos As String, popUp As ASPxPopupControl)

        Try
            Dim query As String
            query = "UPDATE " + tabla + " SET " + ParametrosConValores + " WHERE " + condicion + ""
            Dim cmd As SqlCommand = New SqlCommand(query, SingletonDB.GetInstance(basedatos))
            SingletonDB.Open(basedatos)
            cmd.ExecuteNonQuery()
            SingletonDB.Close(basedatos)
        Catch ex As Exception
            SingletonDB.Close(basedatos)
            popUp.ShowOnPageLoad = True
        End Try
    End Sub

    Public Shared Sub Detele(tabla As String, condicion As String, basedatos As String, popUp As ASPxPopupControl)

        Try
            Dim query As String
            query = "DELETE FROM " + tabla + " WHERE " + condicion + ""
            Dim cmd As SqlCommand = New SqlCommand(query, SingletonDB.GetInstance(basedatos))
            SingletonDB.Open(basedatos)
            cmd.ExecuteNonQuery()
            SingletonDB.Close(basedatos)
        Catch ex As Exception
            SingletonDB.Close(basedatos)
            popUp.ShowOnPageLoad = True
        End Try
    End Sub

    Public Shared Function Selectt(campos As String, tabla As String, condicion As String, basedatos As String, popUp As ASPxPopupControl)

        Dim resp As String = ""

        Try
            Dim query As String

            query = "SELECT " + campos + " " + " FROM " + tabla + " WHERE " + condicion
            Dim cmd As SqlCommand = New SqlCommand(query, SingletonDB.GetInstance(basedatos))
            SingletonDB.Open(basedatos)

            Dim reader As SqlDataReader = cmd.ExecuteReader()

            If reader.Read() Then
                resp = reader.Item(campos).ToString()
            End If

            reader.Close()
            SingletonDB.Close(basedatos)

        Catch ex As Exception
            SingletonDB.Close(basedatos)
            popUp.ShowOnPageLoad = True
        End Try

        Return resp
    End Function

    Public Shared Function MultiSelectt(camposReader As String, campos As String, tabla As String, condicion As String, basedatos As String, popUp As ASPxPopupControl)

        Dim resp As String = ""
        Dim contador As Integer = 0
        Dim separarCampos As String() = camposReader.Split(";")

        Try
            Dim query As String

            query = "SELECT " + campos + " " + " FROM " + tabla + " WHERE " + condicion
            Dim cmd As SqlCommand = New SqlCommand(query, SingletonDB.GetInstance(basedatos))
            SingletonDB.Open(basedatos)

            Do While contador <> separarCampos.Length
                Dim reader As SqlDataReader = cmd.ExecuteReader()
                Dim op = separarCampos(contador)
                If reader.Read() Then
                    resp = resp + reader.Item(separarCampos(contador).ToString()).ToString() + ";"
                End If
                contador = contador + 1
                reader.Close()
            Loop

            SingletonDB.Close(basedatos)

        Catch ex As Exception
            SingletonDB.Close(basedatos)
            popUp.ShowOnPageLoad = True
        End Try

        Return resp

    End Function
End Class

