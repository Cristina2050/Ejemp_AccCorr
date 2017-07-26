Imports System.Data.SqlClient

Public Class SingletonDB
    Private Shared instanceErp As SqlConnection = Nothing
    Private Shared instanceGestionCalidad As SqlConnection = Nothing
    Private Shared instanceFinal As SqlConnection
    ' CONSTRUCTOR PRIVADO DE INICIALIZACIÓN
    Private Sub New()

    End Sub

    'RETORNO DE LA INSTANCIA
    Public Shared Function GetInstance(baseDatos As String) As SqlConnection

        If baseDatos = "ConectionErp" Then
            If instanceErp Is Nothing Then
                instanceErp = New SqlConnection(ConfigurationManager.ConnectionStrings(baseDatos).ToString())
            End If
            instanceFinal = instanceErp

        ElseIf baseDatos = "GestionCalidad" Then
            If instanceGestionCalidad Is Nothing Then
                instanceGestionCalidad = New SqlConnection(ConfigurationManager.ConnectionStrings(baseDatos).ToString())
            End If
            instanceFinal = instanceGestionCalidad
        End If

        Return instanceFinal
    End Function

    'SE ABRE LA CONEXIÓN A LA BASE DE DATOS
    Public Shared Sub Open(baseDatos As String)
        If baseDatos = "ConectionErp" Then
            If instanceErp IsNot Nothing Then
                instanceErp.Open()
            End If

        ElseIf baseDatos = "GestionCalidad" Then
            If instanceGestionCalidad IsNot Nothing Then
                instanceGestionCalidad.Open()
            End If
        End If

    End Sub

    'SE CIERRA LA CONEXIÓN A LA BASE DE DATOS
    Public Shared Sub Close(baseDatos As String)
       If baseDatos = "ConectionErp" Then
            If instanceErp IsNot Nothing Then
                instanceErp.Close()
            End If

        ElseIf baseDatos = "GestionCalidad" Then
            If instanceGestionCalidad IsNot Nothing Then
                instanceGestionCalidad.Close()
            End If
        End If
    End Sub
End Class
