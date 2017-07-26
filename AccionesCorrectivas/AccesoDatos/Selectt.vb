Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxPopupControl

Public Class Selectt

    ''' <summary>
    ''' Método para obtener el valor máximo de la consulta
    ''' </summary>
    ''' <returns>Dato</returns>

    Public Shared Function GetIdMaxAccion(popUp As ASPxPopupControl)
        Dim Dato As Integer

        'Cadena de conexion, que esta establecida en WebConfig
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("GestionCalidad").ToString())

            Try

                'Abrimos la base de datos
                conn.Open()

                'Se escribe la sentencia Sql
                Dim query As String = "GenerarCodigos 1"


                'Se ejecuta el Query
                Dim cmd As New SqlCommand(query, conn)

                Dim reader As SqlDataReader = cmd.ExecuteReader()

                If reader.Read() Then
                    Dato = reader.Item("CONTADOR").ToString()
                End If

                ' Se cierra la conexion
                reader.Close()
                conn.Close()


            Catch ex As Exception
                popUp.ShowOnPageLoad = True
                conn.Close()
            End Try

        End Using

        Return Dato

    End Function

End Class
