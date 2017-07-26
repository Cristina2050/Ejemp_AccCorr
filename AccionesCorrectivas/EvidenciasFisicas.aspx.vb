Imports System.Data.SqlClient

Public Class EvidenciasFisicas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub UploadControlEvidencias_FileUploadComplete(sender As Object, e As DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs)
        Dim fileName As String = e.UploadedFile.FileName
        Dim contentType As String = e.UploadedFile.ContentType
        Dim myFile(e.UploadedFile.FileContent.Length) As Byte
        e.UploadedFile.FileContent.Read(myFile, 0, e.UploadedFile.FileContent.Length)
        Dim Imagen As String = System.Convert.ToBase64String(myFile)
        e.CallbackData = fileName
        Dim nombreDocumento As String = fileName
        Dim tipoDocumento As String = contentType

        Guardar(nombreDocumento, tipoDocumento, Imagen)
    End Sub

    Protected Sub Guardar(nombreDocumento As String, tipoDocumento As String, Imagen As String)

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("GestionCalidad").ConnectionString)
        con.Open()
        Try
            Dim query As String = "INSERT INTO [Evidencia] VALUES((SELECT ISNULL(MAX(Id_Evidencia)+1,1)  FROM [GestionCalidad].[dbo].[Evidencia]),'" + Session("id_Accion").ToString + "','" & nombreDocumento.ToString & "','" & tipoDocumento.ToString & "','" & Imagen.ToString & "')"
            Dim cmd As New SqlCommand(query, con)
            Dim lrd As SqlDataReader = cmd.ExecuteReader()
        Catch ex As Exception
            con.Close()
        End Try
        con.Close()
    End Sub

    Protected Sub btnVerDocumentos_Click(sender As Object, e As EventArgs) Handles btnVerDocumentos.Click
        GridViewDetalleImagenes.DataBind()
        GridViewDetalleImagenes.Visible = True
    End Sub
    
End Class