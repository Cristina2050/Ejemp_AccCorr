Imports System.Data.SqlClient

Public Class DetalleEvidencias
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim id_Accion As Integer = Request.QueryString("Subject_name").ToString().Trim()
        CargarEvidencias(id_Accion)
    End Sub

    Protected Sub CargarEvidencias(id_Accion As Integer)

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("GestionCalidad").ConnectionString)
        con.Open()
        Dim contador = 0

        Try
            Dim query As String = "SELECT [Nombre_Evidencia],[Tipo_Evidencia],[Evidencia_Fisica] FROM [Evidencia] WHERE Id_Accion='" + id_Accion.ToString() + "'"
            Dim cmd As New SqlCommand(query, con)

            Dim da As New SqlDataAdapter(cmd)
            Dim ds As New DataSet
            da.Fill(ds)
            Dim totalEvidencias As Integer = ds.Tables(0).Rows.Count

            Do While contador <> totalEvidencias
                Dim image As String = ds.Tables(0).Rows(contador)(2).ToString()
                Dim nombreDoc As String = ds.Tables(0).Rows(contador)(0).ToString()
                Dim bytes As Byte() = Convert.FromBase64String(image)
                imageSlider.Items.Add("data:image/jpeg;base64," + Convert.ToBase64String(CType(bytes, Byte())), "data:image/jpeg;base64," + Convert.ToBase64String(CType(bytes, Byte())), nombreDoc, nombreDoc)
                contador = contador + 1
            Loop

        Catch ex As Exception
            con.Close()
        End Try
        con.Close()
    End Sub
    
End Class