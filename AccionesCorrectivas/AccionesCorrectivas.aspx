<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AccionesCorrectivas.aspx.vb" Inherits="AccionesCorrectivas.AccionesCorrectivas" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxFormLayout" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
        .auto-style2 {
            height: 64px;
            width: 61px;
        }
        .auto-style3 {
            height: 64px;
            width: 79px;
        }
        .auto-style4 {
            width: 79px;
        }
    </style>
</head>
<body>   
   
    <form id="form1" runat="server">
                                                                                                   
        <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
            <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
        </dx:ASPxCallback>

        <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="true" Theme="BlackGlass" Text="ESTA OPERACIÓN PUEDE TARDAR ALGUNOS MINUTOS" Image-Url= "~/Imagenes/Cargando.gif" Image-Height="80px" Image-Width="80px" ></dx:ASPxLoadingPanel>
        <table style="margin-left: auto; margin-right: auto">
              <tbody>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
              </tbody>
            </table>
        
        <table style="margin-left: auto; margin-right: auto">
            <tbody>
                <tr>
                    <td>
                        <br />                       
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">     
                        <dx:ASPxLabel ID="lbltitulo" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxLabel ID="lblFor" runat="server" Text="" Font-Bold="true"></dx:ASPxLabel>
                    </td>
                </tr>
                <tr><td><br /></td></tr>
            </tbody>
        </table>
        
        <table style="margin-left: auto; margin-right: auto">
            <tbody>           
                <tr>
                    <td>
                        <dx:ASPxLabel ID="lblFechaTitulo" runat="server" Text="FECHA: " Font-Bold="true"  ></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblFecha" runat="server" Text="" ></dx:ASPxLabel>
                    </td>
                    
                    <td style="padding-left:25px">
                        <dx:ASPxLabel ID="lblHoraTitulo" runat="server" Text="HORA: " Font-Bold="true" ></dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxLabel ID="lblHora" runat="server" Text=""></dx:ASPxLabel>
                    </td>
                </tr>
                <tr><td><br /></td></tr>
            </tbody>
        </table>
        <br />
        <br />
        <br />
        <asp:SqlDataSource runat="server" ID="ProcesosReportan" ConnectionString='<%$ ConnectionStrings:GestionCalidad %>' SelectCommand="SELECT [ID_PROCESOREPORTA], [PROCESOREPORTA] FROM [PROCESOSREPORTAN]"></asp:SqlDataSource>
        <table style="margin-left: auto; margin-right: auto">
            <tbody>
                <tr>
                    <td>
                        <dx:ASPxPageControl ID="PageControlIngresos" runat="server" ActiveTabIndex="0" >
                            <TabPages>
                                <dx:TabPage Text="DATOS PERSONALES" >
                                <TabImage IconID="people_employee_16x16"></TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <table>
                                                <tbody>                                                    
                                                    <tr>
                                                       <td>
                                                          <dx:ASPxFormLayout ID="FormLayoutIngresando" runat="server" Width="100%" >
                                                            <Items>
                                                                <dx:LayoutGroup Caption="INGRESAR INFORMACIÓN DEL ENCARGADO">
                                                                    <Items>
                                                                        <dx:LayoutItem Caption="">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <br />
                                                                                                <dx:ASPxLabel ID="lblCedula" runat="server" Text="INGRESAR SU NÚMERO DE CÉDULA: " Font-Bold="True" Width="225px" ></dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td>
                                                                                                <br />
                                                                                                <dx:ASPxTextBox ID="txtCedula" runat="server" Width="220px">
                                                                                                    <MaskSettings IncludeLiterals="None" Mask="0000000000" />
                                                                                                    <ValidationSettings ValidationGroup="ValidationGroup" ErrorDisplayMode= "ImageWithTooltip"  >
                                                                                                        <RequiredField ErrorText="" IsRequired="true" />
                                                                                                    </ValidationSettings>
                                                                                                </dx:ASPxTextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <dx:ASPxLabel ID="lblespcio" runat="server" Text="     "></dx:ASPxLabel>
                                                                                            </td> 
                                                                                            <td>
                                                                                                <br />
                                                                                                <dx:ASPxButton ID="btnBuscarSolicitante" runat="server" Text="BUSCAR" ValidationGroup="ValidationGroup" OnClick="btnBuscarSolicitante_Click"  >
                                                                                                    <Image IconID="zoom_zoom_16x16">
                                                                                                    </Image>
                                                                                                </dx:ASPxButton>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="4">                                                                                                    
                                                                                                <dx:ASPxLabel ID="lblInfor" runat="server" Text="NO SE HA ENCONTRADO INFORMACIÓN CON LA CÉDULA INGRESADA. " ForeColor="Red" Visible="false" ></dx:ASPxLabel>                                                                                                    
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <br />
                                                                                                <dx:ASPxLabel ID="lblNombre" runat="server" Text="NOMBRE: " Font-Bold="True" Width="222px" Visible="False" ></dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td colspan="3">
                                                                                                <br />
                                                                                                <dx:ASPxLabel ID="lblNombreIngresa" runat="server" Text="" Width="350px" Visible="False" ></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <br />
                                                                                                <dx:ASPxLabel ID="lblCorreIngresa" runat="server" Text="CORREO: " Font-Bold="True" Width="222px" Visible="False" ></dx:ASPxLabel>
                                                                                            </td>
                                                                                            <td colspan="3">
                                                                                                <br />
                                                                                                <dx:ASPxLabel ID="lblCorreoUsuario" runat="server" Text="" Width="350px" Visible="False" ></dx:ASPxLabel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                    </Items>
                                                                </dx:LayoutGroup>
                                                            </Items>
                                                          </dx:ASPxFormLayout>
                                                         </td>                                                                 
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <dx:ASPxFormLayout ID="FormLayoutIngresoDatos" runat="server" Visible="false" Width="100%" >
                                                                <Items>
                                                                    <dx:LayoutGroup Caption="INGRESAR INFORMACIÓN DEL SOLICITANTE">
                                                                        <Items>
                                                                            <dx:LayoutItem Caption="">
                                                                                <LayoutItemNestedControlCollection>
                                                                                    <dx:LayoutItemNestedControlContainer>
                                                                                        <table>
                                                                                            
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxLabel ID="lblSolictante1" runat="server" Text="SOLICITANTE: " Font-Bold="true"></dx:ASPxLabel>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxTextBox ID="txtSolicitante" runat="server" Width="220px" NullText="Ingresar un solicitante">
                                                                                                        <ValidationSettings ValidationGroup="ValidationGroup2"  ErrorDisplayMode= "ImageWithTooltip">
                                                                                                            <RequiredField ErrorText="" IsRequired="true" />
                                                                                                         </ValidationSettings>
                                                                                                    </dx:ASPxTextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxLabel ID="lblCorreo" runat="server" Text="CORREO: " Font-Bold="true"></dx:ASPxLabel>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxTextBox ID="txtCorreo" runat="server" Width="220px" HelpText="Correo de notificación" NullText="Ingresar un correo ">
                                                                                                        <ValidationSettings  ValidationGroup="ValidationGroup2" ErrorDisplayMode= "ImageWithTooltip"  >
                                                                                                            <RequiredField ErrorText="" IsRequired="true" />
                                                                                                         </ValidationSettings>
                                                                                                    </dx:ASPxTextBox>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxLabel ID="lblCargo1" runat="server" Text="CARGO: "  Font-Bold="true"   ></dx:ASPxLabel>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxComboBox ID="comboCargo" runat="server" DataSourceID="Cargos" ValueField="Id_Cargo" Width="220px" NullText="Seleccionar Cargo">
                                                                                                        <Columns>
                                                                                                            <dx:ListBoxColumn FieldName="Nombre_Cargo" Caption="Cargo" />
                                                                                                        </Columns>
                                                                                                        <DropDownButton>
                                                                                                            <Image IconID="people_publicfix_16x16">
                                                                                                            </Image>
                                                                                                        </DropDownButton>
                                                                                                        <ValidationSettings  ValidationGroup="ValidationGroup2" ErrorDisplayMode= "ImageWithTooltip"  >
                                                                                                            <RequiredField ErrorText="" IsRequired="true" />
                                                                                                         </ValidationSettings>
                                                                                                    </dx:ASPxComboBox>
                                                                                                    <asp:SqlDataSource runat="server" ID="Cargos" ConnectionString='<%$ ConnectionStrings:GestionCalidad %>' SelectCommand="SELECT [ID_CARGO], [NOMBRE_CARGO] FROM [CARGOS]"></asp:SqlDataSource>
                                                                                                </td>
                                                                                            </tr>   
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxLabel ID="lblFechaReporteTitulo1" runat="server" Text="FECHA DE REPORTE: "  Font-Bold="true"   ></dx:ASPxLabel>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxLabel ID="lblFechaReporte1" runat="server" Text=""  ></dx:ASPxLabel>
                                                                                                </td>
                                                                                            </tr> 
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxLabel ID="lblfechaIdentificacion" runat="server" Text="FECHA DE IDENTIFICACIÓN: " Font-Bold="true"   ></dx:ASPxLabel>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxDateEdit ID="DateEditIdentificaicon1" runat="server" Width="220px" NullText="Seleccionar fecha de Identificación">
                                                                                                        <DropDownButton>
                                                                                                            <Image IconID="scheduling_today_16x16">
                                                                                                            </Image>
                                                                                                        </DropDownButton>
                                                                                                        <ValidationSettings ValidationGroup="ValidationGroup2" ErrorDisplayMode= "ImageWithTooltip">
                                                                                                            <RequiredField ErrorText="" IsRequired="true" />
                                                                                                         </ValidationSettings>
                                                                                                    </dx:ASPxDateEdit>
                                                                                                </td>
                                                                                            </tr>  
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxLabel ID="lblproceso" runat="server" Text="PROCESO QUE REPORTA: " Font-Bold="true" Width="220px"></dx:ASPxLabel>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxComboBox ID="cmbProceso" runat="server" DataSourceID="ProcesosReportan" ValueField="ID_PROCESOREPORTA" TextField="PROCESOREPORTA" Width="220px" NullText="Seleccionar un Proceso">
                                                                                                        <Columns>
                                                                                                            <dx:ListBoxColumn FieldName="PROCESOREPORTA" Caption="Proceso" />
                                                                                                        </Columns>
                                                                                                        <DropDownButton>
                                                                                                            <Image IconID="chart_spline_16x16">
                                                                                                            </Image>
                                                                                                        </DropDownButton>
                                                                                                        <ValidationSettings ValidationGroup="ValidationGroup2" ErrorDisplayMode= "ImageWithTooltip">
                                                                                                            <RequiredField ErrorText="" IsRequired="true" />
                                                                                                         </ValidationSettings>
                                                                                                    </dx:ASPxComboBox>                                                                                                    
                                                                                                </td>
                                                                                            </tr>    
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                    <dx:ASPxButton ID="btnSiguiente1" runat="server" Text="SIGUIENTE" OnClick= "btnSiguiente1_Click"  ValidationGroup="ValidationGroup2">
                                                                                                        <Image IconID="navigation_forward_16x16">
                                                                                                        </Image>
                                                                                                    </dx:ASPxButton>
                                                                                                </td>
                                                                                            </tr>                                                                    
                                                                                        </table>
                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                </LayoutItemNestedControlCollection>
                                                                            </dx:LayoutItem>
                                                                        </Items>
                                                                    </dx:LayoutGroup>
                                                                </Items>
                                                            </dx:ASPxFormLayout>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>                         
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="GENERAR ACCIÓN CORRECTIVA"  Name="GenerarAccion" Enabled="False" >      
                                    <TabImage IconID="reports_insertheader_16x16"></TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">                                            
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="4">
                                                             <br />
                                                             <dx:ASPxLabel ID="lblTitulo1" runat="server" Text="1. IDENTIFICACIÓN DEL TIPO DE ACCIÓN, DÓNDE Y PORQUÉ SE GENERA" Width="520px" Font-Bold="True"></dx:ASPxLabel>
                                                        </td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td colspan="4">
                                                             <br />
                                                            <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones" runat="server" Text="EL CAMPO SIGLAS T. AUDITORÍAS DEBE SER UTILIZADO ÚNICAMENTE PARA REPORTAR ACCIONES GENERADAS EN AUDITORÍAS" Font-Bold="True" ForeColor="Red" ></dx:ASPxLabel>
                                                        </td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones1" runat="server" Text="RD:   Representante de la Dirección"  ></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones2" runat="server" Text="GC:   Gestión de Calidad"  ></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones3" runat="server" Text="NC:   No Conformidad"   ></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones4" runat="server" Text="PROD: Producto" ></dx:ASPxLabel>
                                                        </td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones5" runat="server" Text="AMB:  Ambiental" ></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones6" runat="server" Text="CLTE: Cliente" ></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones7" runat="server" Text="CERT: Certificadora"  ></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones8" runat="server" Text="SSO:  Seguridad y Salud Ocupacional" ></dx:ASPxLabel>
                                                        </td>                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                             <br />
                                                             <dx:ASPxLabel ID="lblIndicaciones9" runat="server" Text="SGC:  Sistema de Gestión de Calidad" ></dx:ASPxLabel>
                                                            <br />
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                             <dx:ASPxLabel ID="lblTipoAccion" runat="server" Text="Tipo de Acción: "  Width="180px"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxComboBox ID="cmbTipoAccion" runat="server" ValueType="System.String" ValueField="ID_TIPOACCION" TextField="TIPOACCION" Width="220px" DataSourceID="TipoAccion">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="TIPOACCION" />                                                                
                                                                </Columns>
                                                                <ValidationSettings ValidationGroup="ValidationGroup3" ErrorDisplayMode= "ImageWithTooltip">
                                                                    <RequiredField ErrorText="" IsRequired="true" />
                                                                </ValidationSettings>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="TipoAccion" runat="server" ConnectionString="<%$ ConnectionStrings:GestionCalidad %>" SelectCommand="SELECT [ID_TIPOACCION], [TIPOACCION] FROM [TIPOSACCION]"></asp:SqlDataSource>
                                                        </td>
                                                        <td>
                                                            <br />
                                                             <dx:ASPxLabel ID="lblFuenteInformacion" runat="server" Text="Fuente de Información: "  Width="180px" style="text-align: center"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxComboBox ID="cmbTipoInformacion" runat="server" ValueType="System.String" Width="220px" DataSourceID="FuenteInfor" ValueField="ID_FUENTEINFORMACION" TextField="FUENTEINFORMACION" AutoPostBack="True">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="FUENTEINFORMACION" />
                                                                </Columns>
                                                                <ValidationSettings ValidationGroup="ValidationGroup3" ErrorDisplayMode= "ImageWithTooltip">
                                                                    <RequiredField ErrorText="" IsRequired="true" />
                                                                </ValidationSettings>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="FuenteInfor" runat="server" ConnectionString="<%$ ConnectionStrings:GestionCalidad %>" SelectCommand="SELECT [ID_FUENTEINFORMACION], [FUENTEINFORMACION] FROM [FUENTEINFORMACION]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                             <dx:ASPxLabel ID="lblSiglasAuditorias" runat="server" Text="Siglas T. Auditorías: "  Width="180px"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxComboBox ID="cmbSiglasAuditorias" runat="server" ValueType="System.String" ValueField="id_siglas" TextField="Siglas" Width="220px" DataSourceID="Siglas" Enabled="False">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="Siglas" />
                                                                </Columns>
                                                                <ValidationSettings ValidationGroup="ValidationGroup3" ErrorDisplayMode= "ImageWithTooltip">
                                                                    <RequiredField ErrorText="" IsRequired="true" />
                                                                </ValidationSettings>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="Siglas" runat="server" ConnectionString="<%$ ConnectionStrings:GestionCalidad %>" SelectCommand="SELECT [SIGLAS], [ID_SIGLAS] FROM [SIGLAS_AUDITORIAS]"></asp:SqlDataSource>
                                                        </td>
                                                        <td>
                                                            <br />
                                                             <dx:ASPxLabel ID="lblNovedad" runat="server" Text="Novedad: "  Width="180px" style="text-align: center"></dx:ASPxLabel>
                                                        </td>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxComboBox ID="cmbNovedad" runat="server" ValueType="System.String" ValueField="id_novedad" TextField="Novedad" Width="220px" DataSourceID="Novedad">
                                                                <Columns>
                                                                    <dx:ListBoxColumn FieldName="Novedad" />
                                                                </Columns>
                                                                <ValidationSettings ValidationGroup="ValidationGroup3" ErrorDisplayMode= "ImageWithTooltip">
                                                                    <RequiredField ErrorText="" IsRequired="true" />
                                                                </ValidationSettings>
                                                            </dx:ASPxComboBox>
                                                            <asp:SqlDataSource ID="Novedad" runat="server" ConnectionString="<%$ ConnectionStrings:GestionCalidad %>" SelectCommand="SELECT [ID_NOVEDAD], [NOVEDAD] FROM [NOVEDAD]"></asp:SqlDataSource>
                                                        </td>
                                                    </tr>
                                                    <tr >
                                                        <td colspan="4">
                                                             <br />
                                                             <dx:ASPxLabel ID="lblTitulo2" runat="server" Text="2. IDENTIFICACIÓN DEL PROBLEMA O NECESIDAD DE MEJORA" Font-Bold="true" Width="520px"></dx:ASPxLabel>
                                                        </td>                                                        
                                                    </tr>
                                                    <tr >
                                                        <td colspan="4">
                                                             <br />
                                                             <dx:ASPxLabel ID="lblDescripcionMejora" runat="server" Text="Descripción del Problema o Mejora: " Font-Bold="False" Width="420px"></dx:ASPxLabel>
                                                        </td>                                                        
                                                    </tr>
                                                    <tr >
                                                        <td colspan="4">
                                                             <br />
                                                            <dx:ASPxMemo ID="MemoDescripcionMejora" runat="server" Height="45px" Width="100%">
                                                                <ValidationSettings ValidationGroup="ValidationGroup3" ErrorDisplayMode= "ImageWithTooltip">
                                                                    <RequiredField ErrorText="" IsRequired="true" />
                                                                </ValidationSettings>
                                                            </dx:ASPxMemo>
                                                        </td>                                                        
                                                    </tr>                                                    
                                                    <tr>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxButton ID="btnGenerarAccion" runat="server" Text="GENERAR ACCIÓN CORRECTIVA" ValidationGroup="ValidationGroup3" OnClick="btnGenerarAccion_Click"  AutoPostBack="False" >
                                                                <Image IconID="chart_drilldownonarguments_chart_16x16">
                                                                </Image>
                                                                <ClientSideEvents Click="function(s, e) {
                                                                    Callback.PerformCallback();
                                                                    LoadingPanel.Show();
                                                                }" /> 
                                                            </dx:ASPxButton>
                                                        </td>                                                        
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </dx:ContentControl>
                                    </ContentCollection>                                    
                                </dx:TabPage>
                                <dx:TabPage Text="EVIDENCIAS" Enabled="False">
                                    <TabImage IconID="chart_fullstackedsplinearea_16x16" ></TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td class="auto-style1">
                                                            <br />
                                                            <dx:ASPxLabel ID="lblDetalle" runat="server" Font-Bold="true" Text="Detalle/Evidencia: " Width="220px">
                                                            </dx:ASPxLabel>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxFormLayout ID="FormLayoutEvidencia" runat="server" Width="980px">
                                                                <Items>
                                                                    <dx:LayoutGroup Caption="TIPO DE EVIDENCIA">
                                                                        <Items>
                                                                            <dx:LayoutItem Caption="">
                                                                                <LayoutItemNestedControlCollection>
                                                                                    <dx:LayoutItemNestedControlContainer runat="server">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    <dx:ASPxRadioButtonList ID="RadioButtonTipoIngreso" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" Width="600px">
                                                                                                        <Items>
                                                                                                            <dx:ListEditItem Text="Evidencia Física" Value="1" />
                                                                                                            <dx:ListEditItem Text="Evidencia Textual" Value="2" />
                                                                                                        </Items>
                                                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="ValidationGroup4">
                                                                                                            <RequiredField ErrorText="" IsRequired="True" />
                                                                                                        </ValidationSettings>
                                                                                                    </dx:ASPxRadioButtonList>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td colspan="2">
                                                                                                    <br />
                                                                                                    <dx:ASPxMemo ID="memoDetalleEvidencia" runat="server" Height="45px" Visible="False" Width="600px">
                                                                                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ValidationGroup="ValidationGroup4">
                                                                                                            <RequiredField ErrorText="" IsRequired="True" />
                                                                                                        </ValidationSettings>
                                                                                                    </dx:ASPxMemo>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td>
                                                                                                    <br />
                                                                                                </td>
                                                                                                <td></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                </LayoutItemNestedControlCollection>
                                                                            </dx:LayoutItem>
                                                                        </Items>
                                                                    </dx:LayoutGroup>
                                                                </Items>
                                                                <ClientSideEvents Init="True" />
                                                            </dx:ASPxFormLayout>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxButton ID="btnFinalizarAccion" runat="server" Text="FINALIZAR" OnClick="btnFinalizarAccion_Click">
                                                                <Image IconID="chart_pielabelsdatalabels_16x16">
                                                                </Image>
                                                            </dx:ASPxButton>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br />
                                                            <dx:ASPxLabel ID="lblMensaje" runat="server" ForeColor="Red" Font-Bold="true" Text="NOTA: Recuerde que al hacer caso omiso al ingreso de las EVIDENCIAS, está incumpliendo con el proceso de mejora continua de SEDEMI.">
                                                            </dx:ASPxLabel>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <dx:ASPxPopupControl ID="PopupControleError"  ModalBackgroundStyle-Opacity="70" HeaderText="Error" EnableAnimation="false" ShowCloseButton="true" ShowPageScrollbarWhenModal="true" Modal="true" runat="server" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" style="font-weight: 700" Width="300px" Height="158px" >
        
        <HeaderImage IconID="actions_deletelist_16x16">
        </HeaderImage>
        <ModalBackgroundStyle Opacity="70"></ModalBackgroundStyle>
                <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl7" runat="server">
                <table style="width: 100%">
                    <tr>
                        <td style="text-align: center; " class="auto-style2">
                            <img src= "Imagenes/error.png" style="width: 54px; height: 50px" />
                            <br />
                        </td>
                        <td style="text-align: center;">
                            <dx:ASPxLabel ID="lblComunicado" runat="server" Text="HA OCURRIDO UN ERROR INESPERADO. COMUNÍQUESE CON EL ADMINISTRADOR DEL SITIO. " Font-Size="Small">
                            </dx:ASPxLabel>                                                        
                        </td>
                    </tr>                                    
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

        <dx:ASPxPopupControl ID="PopupControlIngresoExitoso" CloseAction="None"  ModalBackgroundStyle-Opacity="70" HeaderText="Exitoso" EnableAnimation="false" ShowCloseButton="false" ShowPageScrollbarWhenModal="true" Modal="true" runat="server" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" style="font-weight: 700" Width="300px" Height="158px" >
        
            <HeaderImage IconID="actions_apply_16x16">
            </HeaderImage>
            <ModalBackgroundStyle Opacity="70"></ModalBackgroundStyle>
                    <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td style="text-align: center; " class="auto-style3">
                                <img src= "Imagenes/Check.png" style="width: 54px; height: 50px" />
                                <br />
                            </td>
                            <td style="width: 260px; height: 18px; text-align: center;">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="SE HA GENERADO LA ACCIÓN CORRECTIVA CON ÉXITO." Font-Size="Small">
                                </dx:ASPxLabel>                                                     
                            </td>
                        </tr> 
                        <tr>
                            <td class="auto-style4">
                                <br />
                                <dx:ASPxButton ID="btnSalir" runat="server" Text="SALIR" OnClick="btnSalir_Click" ></dx:ASPxButton>
                            </td>
                        </tr>                                   
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>


        <dx:ASPxPopupControl ID="PopupControlEvidenciasFisicas" CloseAction="CloseButton"  ModalBackgroundStyle-Opacity="70" HeaderText="EVIDENCIAS FÍSICAS" EnableAnimation="false" ShowCloseButton="true" ShowPageScrollbarWhenModal="true" Modal="true" runat="server" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" style="font-weight: 700" Width="500px" Height="350px" ContentUrl="~/EvidenciasFisicas.aspx" >
            <HeaderImage IconID="actions_importimage_16x16">
            </HeaderImage>

<ModalBackgroundStyle Opacity="70"></ModalBackgroundStyle>
        </dx:ASPxPopupControl>             
    </form>
</body>
</html>
