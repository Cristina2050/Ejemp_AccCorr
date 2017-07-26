<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EvidenciasFisicas.aspx.vb" Inherits="AccionesCorrectivas.EvidenciasFisicas" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

    <script>
        function OnFileUploadComplete(s, e) {
            if (e.callbackData !== "") {
                btnVerDocumentos.SetVisible(true);
            }
        }
        function OnCallbackComplete(s, e) {
            if (e.result === "ok") {
                btnVerDocumentos.SetVisible(false);
            }
        }
    </script>
    <div>
        
        <table>
             <tr>
                <td>
                    <dx:ASPxLabel ID="lblAllowebMimeType" runat="server" Text="Se permite imágenes con extención: jpeg, jpg" Font-Size="8pt" />
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblMaxFileSize" runat="server" Text="Tamaño máximo del archivo: 25Mb" Font-Size="8pt" />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <dx:ASPxUploadControl ID="UploadControlEvidencias" NullText="Seleccionar una o mas evidencias" ShowProgressPanel="true" UploadMode="Auto" AutoStartUpload="true" FileUploadMode="OnPageLoad"
                        OnFileUploadComplete= "UploadControlEvidencias_FileUploadComplete" runat="server" ShowUploadButton="True" Width="350px">
                        <ValidationSettings MaxFileSize="26214400" MaxFileSizeErrorText="El archivo excede el tamaño máximo permitido" AllowedFileExtensions=".jpg,.jpeg">
                        </ValidationSettings>
                        <AdvancedModeSettings EnableMultiSelect="True"/>
                        <BrowseButton Text="EXAMINAR" />
                        <ClientSideEvents FileUploadComplete="OnFileUploadComplete"  />            
                    </dx:ASPxUploadControl>
                </td>
            </tr>           
            <tr>
                <td>
                   <dx:ASPxButton ID="btnVerDocumentos" RenderMode="Link" runat="server" ClientVisible="false" AutoPostBack="true" Text="Ver Documentos" OnClick="btnVerDocumentos_Click" ></dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td style="text-align:center ">
                    <br />
                    <br />
                     <dx:ASPxGridView ID="GridViewDetalleImagenes" runat="server" DataSourceID="TbDocumentos" AutoGenerateColumns="False" KeyFieldName="Id_Evidencia" Visible="False">
                        <Columns>
                            <dx:GridViewCommandColumn ShowDeleteButton="True" Width="50" Caption="OP." ShowClearFilterButton="True" VisibleIndex="3" />
                            <dx:GridViewDataTextColumn FieldName="Id_Evidencia" Caption="ID." ReadOnly="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Nombre_Evidencia" Caption="EVIDENCIA" VisibleIndex="2"></dx:GridViewDataTextColumn>
                        </Columns>                        
                        <Settings ShowTitlePanel="true"  />  
                         <SettingsText Title="DETALLE DE EVIDENCIAS" />                       
                         <SettingsCommandButton>
                             <DeleteButton ButtonType="Image">
                                 <Image IconID="edit_delete_16x16">
                                 </Image>
                             </DeleteButton>
                         </SettingsCommandButton>
                    </dx:ASPxGridView>

        <asp:SqlDataSource runat="server" ID="TbDocumentos" ConnectionString='<%$ ConnectionStrings:GestionCalidad %>' DeleteCommand="DELETE FROM [Evidencia] WHERE [Id_Evidencia] = @Id_Evidencia" SelectCommand="SELECT [Id_Evidencia], [Nombre_Evidencia] FROM [Evidencia] WHERE (([ID_ACCION] = @ID_ACCION) )" >
            <DeleteParameters>
                <asp:Parameter Name="Id_Evidencia" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter SessionField="ID_ACCION" Name="ID_ACCION"></asp:SessionParameter>
            </SelectParameters>                                                                                                        
        </asp:SqlDataSource>

                </td>
            </tr>
        </table>
         
        
    </div>
    </form>
</body>
</html>
