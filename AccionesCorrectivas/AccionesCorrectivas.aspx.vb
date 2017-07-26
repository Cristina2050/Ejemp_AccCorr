Imports System.DirectoryServices
Imports Microsoft.Exchange.WebServices.Data
Imports System.Data.SqlClient
Imports AccionesCorrectivas.Operaciones

Public Class AccionesCorrectivas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        asignaciones()
    End Sub

    Protected Sub asignaciones()
        lblFecha.Text = Now.ToString("d/MM/yyyy")
        lblFor.Text = "FOR GCL 07 AC Y OM"
        lblHora.Text = Now.ToString("HH:mm:ss")
        lbltitulo.Text = "ACCIÓN CORRECTIVA Y OPORTUNIDAD DE MEJORA"
        DateEditIdentificaicon1.MaxDate = New DateTime(Year(Now), Now.Month, Day(Now))
    End Sub

    Protected Sub btnBuscarSolicitante_Click(sender As Object, e As EventArgs) Handles btnBuscarSolicitante.Click
        lblFechaReporte1.Text = Date.Now()

        'EmployeeId= cedula
        'sAMAccountName = nombre usuario
        'employeeType = contraseña
        'mail = mail 

        Dim sCnn As String
        sCnn = "LDAP://sedemi.local"

        Dim dssearch As New DirectorySearcher(sCnn)

        Try
            dssearch.Filter = "(EmployeeId=" + txtCedula.Text + ")"
            Dim sresult As SearchResult = dssearch.FindOne()
            Dim dsresult As DirectoryEntry = sresult.GetDirectoryEntry()
            Dim cedula As String = dsresult.Properties("EmployeeId")(0).ToString()
            Dim correo As String = dsresult.Properties("mail")(0).ToString()

            If cedula = txtCedula.Text Then
                lblInfor.Visible = False
                lblNombre.Visible = True
                lblNombreIngresa.Visible = True
                lblNombreIngresa.Text = Operaciones.Selectt("xnombrecompleto", "[imp].[pc_personas]", "xnif='" + txtCedula.Text + "'", "ConectionErp", PopupControleError)
                lblCorreIngresa.Visible = True
                lblCorreoUsuario.Visible = True
                lblCorreoUsuario.Text = correo
                FormLayoutIngresoDatos.Visible = True

            Else
                lblInfor.Visible = True
                lblNombre.Visible = False
                lblNombreIngresa.Visible = False
                lblCorreIngresa.Visible = False
                lblCorreoUsuario.Visible = False
                FormLayoutIngresoDatos.Visible = False
            End If

        Catch ex As Exception
            lblInfor.Visible = True
            lblNombre.Visible = False
            lblNombreIngresa.Visible = False
            lblCorreIngresa.Visible = False
            lblCorreoUsuario.Visible = False
            FormLayoutIngresoDatos.Visible = False
        End Try

    End Sub

    Protected Sub btnSiguiente_Click(sender As Object, e As EventArgs)
        PageControlIngresos.TabPages.Item(1).Enabled = True
        PageControlIngresos.ActiveTabIndex() = 1
    End Sub

    Protected Sub btnSiguiente1_Click(sender As Object, e As EventArgs) Handles btnSiguiente1.Click
        PageControlIngresos.TabPages.Item(1).Enabled = True
        PageControlIngresos.ActiveTabIndex() = 1
    End Sub

    Protected Sub cmbTipoInformacion_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbTipoInformacion.SelectedIndexChanged
        If cmbTipoInformacion.Value = 1 Or cmbTipoInformacion.Value = 2 Then
            'Se habilita solo cuando se trata de auditoria
            cmbSiglasAuditorias.Enabled = True
        Else
            cmbSiglasAuditorias.Enabled = False
        End If
    End Sub

    Protected Sub btnGenerarAccion_Click(sender As Object, e As EventArgs) Handles btnGenerarAccion.Click
        Dim id_Accion As Integer = Selectt.GetIdMaxAccion(PopupControleError)
        Session("id_Accion") = id_Accion

        If cmbSiglasAuditorias.Enabled = True Then
            Operaciones.Insert("ACCIONESCORRECTIVAS", "" + id_Accion.ToString + "," + comboCargo.Value.ToString + "," + cmbNovedad.Value.ToString + "," + cmbSiglasAuditorias.Value.ToString + "," + cmbProceso.Value.ToString + "," + cmbTipoInformacion.Value.ToString + "," + cmbTipoAccion.Value.ToString + ",'" + txtCedula.Text + "','" + txtSolicitante.Text + "','" + txtCorreo.Text + "','" + lblFechaReporte1.Text + "','" + DateEditIdentificaicon1.Text + "','" + MemoDescripcionMejora.Text + "','N/A','INGRESADO',NULL", "GestionCalidad", PopupControleError)
        Else
            Operaciones.Insert("ACCIONESCORRECTIVAS", "" + id_Accion.ToString + "," + comboCargo.Value.ToString + "," + cmbNovedad.Value.ToString + ",4," + cmbProceso.Value.ToString + "," + cmbTipoInformacion.Value.ToString + "," + cmbTipoAccion.Value.ToString + ",'" + txtCedula.Text + "','" + txtSolicitante.Text + "','" + txtCorreo.Text + "','" + lblFechaReporte1.Text + "','" + DateEditIdentificaicon1.Text + "','" + MemoDescripcionMejora.Text + "','N/A','INGRESADO',NULL", "GestionCalidad", PopupControleError)
        End If

        PageControlIngresos.TabPages.Item(0).Enabled = False
        PageControlIngresos.TabPages.Item(1).Enabled = False
        PageControlIngresos.TabPages.Item(2).Enabled = True
    End Sub

    Protected Sub RadioButtonTipoIngreso_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioButtonTipoIngreso.SelectedIndexChanged
        If RadioButtonTipoIngreso.Value = 1 Then
            memoDetalleEvidencia.Visible = False
            memoDetalleEvidencia.Text = ""
            PopupControlEvidenciasFisicas.ShowOnPageLoad = True
        ElseIf RadioButtonTipoIngreso.Value = 2 Then
            Operaciones.Detele("EVIDENCIA", "ID_ACCION=" + Session("id_Accion").ToString() + "", "GestionCalidad", PopupControleError)
            memoDetalleEvidencia.Visible = True
            memoDetalleEvidencia.Text = ""
            PopupControlEvidenciasFisicas.ShowOnPageLoad = False
        End If
    End Sub

    Protected Sub EnvioMail(correo As String, enlace As String, nombre As String)

        Dim service As New ExchangeService(ExchangeVersion.Exchange2010_SP1)
        service.Credentials = New WebCredentials("notificaciones@sedemi.com", "ssss14610.")
        Try
            Dim serviceUrl As String = "https://outlook.office365.com/ews/exchange.asmx"
            service.Url = New Uri(serviceUrl)
            Dim emailMessage As New EmailMessage(service)
            emailMessage.Subject = "GENERACIÓN DE ACCIÓN CORRECTIVA"
            emailMessage.Body = "<center><img src=http://200.110.81.37:8095/imagenes/Sedemi.png></center> " +
            "<HTML><h2>CORREO INFORMATIVO</h2><BODY>Estimado/a " & nombre & "<br />Por medio de este correo, ponemos en conocimiento que se ha generado una Acción Correctiva. A continuación se presenta el detalle:<br /><br /><center>" +
            "<TABLE border=1><tr> <th align=center colspan='4'>DATOS PESONALES</th> </br></th></tr><tr> <th align=left>Solicitante:</th><th align=left>" & txtSolicitante.Text & "</th><th align=left>Cargo:</th><th align=left>" & comboCargo.Text & "</th></tr><tr><th align=left>Fecha Reporte:</th><th align=left>" & lblFecha.Text & "</th><th align=left>Fecha Identificación:</th><th align=left>" & DateEditIdentificaicon1.Text & "</th></tr><tr> <th align=left>Proceso Reporta:</th><th align=left>" & cmbProceso.Text & "</th></tr><tr><th colspan='4'></br></th></tr><tr><th align=center colspan='4'>DETALLE DE ACCIÓN</th></br></th></tr><tr></tr><tr><th align=left>Tipo de Acción:</th><th align=left>" & cmbTipoAccion.Text & "</th><th align=left>Fuente Información:</th><th align=left>" & cmbTipoInformacion.Text & "</th></tr><tr><th align=left>Siglas Auditoría:</th><th align=left>" & cmbSiglasAuditorias.Text & "</th><th align=left>Novedad:</th><th align=left>" & cmbNovedad.Text & "</th></tr><tr colspan='2'><th align=left>Desc. del Problema o Mejora:</th><th align=left>" & MemoDescripcionMejora.Text & "</th></tr><tr colspan='2'><th align=left>Evidencia Textual:</th><th align=left>" & memoDetalleEvidencia.Text & "</th></tr></TABLE>" +
            enlace +
            "</center><br /><td>Nota: En caso de no haber realizado esta operación comuníquese inmediatamente con el Departamento de Sistemas.</td></BODY></HTML>"

            'emailMessage.ToRecipients.Add(correo)
            emailMessage.ToRecipients.Add("cmorales2350@gmail.com")
            'emailMessage.SendAndSaveCopy()
            emailMessage.Send()
        Catch ex As Exception
            ClientScript.RegisterStartupScript(Page.GetType(), "key", "alert('Error al enviar el correo!! Revisar Conflicto.')", True)
            Throw ex
        End Try
    End Sub

    Protected Sub btnSalir_Click(sender As Object, e As EventArgs)
        Response.Redirect("/AccionesCorrectivas.aspx")
    End Sub
 
    Protected Sub btnFinalizarAccion_Click(sender As Object, e As EventArgs)
        If RadioButtonTipoIngreso.Value = 1 Then
            EnvioMail(lblCorreoUsuario.Text, "<br /> EVIDENCIAS FÍSICAS: <a href=http://localhost:3506/DetalleEvidencias.aspx?Subject_name=" & Session("id_Accion").ToString & "> Ver Evidencias </a>", lblNombreIngresa.Text)
            EnvioMail(txtCorreo.Text, "<br /> EVIDENCIAS FÍSICAS: <a href=http://localhost:3506/DetalleEvidencias.aspx?Subject_name=" & Session("id_Accion").ToString & "> Ver Evidencias </a>", txtSolicitante.Text)
        Else
            EnvioMail(lblCorreoUsuario.Text, "", lblNombreIngresa.Text)
            EnvioMail(txtCorreo.Text, "", txtSolicitante.Text)
            Operaciones.Update("ACCIONESCORRECTIVAS", "DESCRIPCION_EVIDENCIA='" + memoDetalleEvidencia.Text + "'", "ID_ACCION=" + Session("id_Accion").ToString + "", "GestionCalidad", PopupControleError)
        End If

        PopupControlIngresoExitoso.ShowOnPageLoad = True
    End Sub
End Class