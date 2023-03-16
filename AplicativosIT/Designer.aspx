<%@ Page Title="DESARROLLADOR" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Designer.aspx.cs" Inherits="AplicativosIT.Login" %>
<%@ Register assembly="DevExpress.Web.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .botonLogin {
            margin-left: 90px;
            margin-top: -320px;
            background: transparent;
        }

        .botonNew {
            margin-top: -320px;
            background: transparent;
        }

        .botonExit {
            float: right;
            margin-right: 90px;
            margin-top: -175px;
            background: transparent;
        }

        .Titulo23 {
            color: black;
        }

        .NombreInfo {
            text-align: center;
            font-weight: bold;
            font-size: 20px;
        }

        .NombreInfo2 {
            width: 100%;
            color: blue;
        }

        .NombreCard {
            text-align: center;
            font-weight: bold;
            font-size: 15px;
        }

        .botonActivo {
            cursor: pointer;
        }
        .btnsPopup {
            margin: 0 auto;
        }
        .TextoPopup {
            text-align: center;
        }
        .btns {
            padding: 5px;
            margin: 10px auto;
            background-color: #0066CC;
            cursor: pointer;
            border: 1px solid #C0C0C0;
            color: white;
        }
        .btns:hover {
            background-color: #0000CC;
            border: 1px solid #C0C0C0;
            color: white;
        }
        .btn {
            padding: 3px;
        }
    </style>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script type="text/javascript">
        function OnCardSelectionChanged(s, e) {
            s.GetSelectedFieldValues("name_environment;url;ip_server", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
            for (var i = 0; i < values.length; i++) {
                let url = values[0][1];
                window.open(url, "New Window", "width=1920, height=1080");
                document.location.reload();
            };
        }
        function ShowExit() {
            window.location = "Default.aspx";
        }
        function ShowUsersWindow() {
            pcUsuarios.Show();
        }
        function onFileUploadComplete(s, e) {
            if (e.callbackData) {
                var fileData = e.callbackData.split('|');
                var fileName = fileData[0],
                    fileUrl = fileData[1],
                    fileSize = fileData[2];
                DXUploadedFilesContainer.AddFile(fileName, fileUrl, fileSize);
            }
        }
        function ShowInfo() {
            pcInfo.Show();
        }
        function ShowComboBox1() {
            pcComboBox1.Show();
        }
        function ShowGridView() {
            pcModulos.Show();
        }
        function ShowGridViewComboBox() {
            pcManagement.Show();
        }
        function ShowGridViewComboBox1() {
            pcVersion.Show();
        }
        function GetId(s, e) {
            s.GetSelectedFieldValues("name_environment;id;ip_server", GetSelectedFieldValuesCallbackId);
        }
        function GetSelectedFieldValuesCallbackId(values) {
            for (var i = 0; i < values.length; i++) {
                var id = values[0][1];
                return id;
            };
        }
        function OnFocusedCardChanged() {
            CardView.GetCardValues(CardView.GetFocusedCardIndex(), 'name_environment;ip_server;ip_database;management_db;version_db;number_module', OnGetCardValues);
        }
        function OnGetCardValues(values) {
            var editors = [name_environment, ip_server, ip_database, management_db, version_db, number_module];
            for (var i = 0; i < editors.length; i++) {
                var editor = editors[i];
                editor.SetValue(values[i]);
            }
        }
        function Close_Edit() {
            pcCancelar.Show();
        }

        function Update_Edit() {
            pcActualizar.Show();
        }
    </script>
    <link href="./Styles/DefaultStyles.css" rel="stylesheet" type="text/css" />
    <div style="position: relative">
            <div style="position: absolute; z-index: 2; width: 100%; height: 100%">
                <h1 class="title" style="text-align: center; font-size: 45px; color: midnightblue">CG/WEB</h1>
                <p class="lead" style="text-align: center; font-size: 30px; color:black;">Sistema Administrativo Financiero</p>
                <p class="lead" style="text-align: center; font-weight:bold; font-size: 30px; color:black;">DESARROLLADOR</p>
                <dx:ASPxButton ID="Button1" runat="server" Image-IconID="actions_right_32x32" AutoPostBack="False" UseSubmitBehavior="False" CssClass="botonExit">
                    <ClientSideEvents Click="function(s, e) { ShowExit(); }" />
                    <Border BorderColor="Transparent"></Border>
                </dx:ASPxButton>
            </div>
                <div style="background-image: linear-gradient(90deg, rgba(27,202,237,1) 28%, rgba(13,175,179,1) 63%, rgba(93,69,231,1) 100%);">
                    <div class="title-container"  style="display: grid; grid-template-columns: repeat(3, 1fr); margin-bottom: 11px; padding: 15px;
                        opacity:0.4; background-image: url(https://img.freepik.com/foto-gratis/empresaria-usando-tableta-analizar-concepto-exito-estadisticas-estrategia-financiera-empresa-planificacion-futuro-sala-oficina_74952-1410.jpg?w=2000);">
                    </div>
                </div>
            <svg class="waves" style="position: absolute" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
                   <path fill="#ffffff" fill-opacity="1" d="M0,256L48,234.7C96,213,192,171,288,176C384,181,480,235,576,261.3C672,288,768,288,864,261.3C960,235,1056,181,1152,160C1248,139,1344,149,1392,154.7L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
                </svg>
        </div>

    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" Width="546px" CloseAction="CloseButton" CloseOnEscape="True" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcInfo"
        HeaderText='INFORMACIÓN' HeaderImage-IconID="xaf_state_validation_information_svg_32x32" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="True" Theme="MetropolisBlue">
        <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel1" runat="server" DefaultButton="btOK" Width="458px">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div>
                                <dx:ASPxFormLayout ID="Details" ClientInstanceName="Details" runat="server" Width="510px" Theme="MetropolisBlue">
                                    <Items>
                                        <dx:LayoutItem Caption=" " FieldName="name_environment" CssClass="NombreInfo" ColSpan="1">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server">
                                                    <dx:ASPxLabel runat="server" ClientInstanceName="name_environment" CssClass="NombreInfo2" ID="name_environment"></dx:ASPxLabel>

                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption=" ">
                                        </dx:LayoutItem>
                                        <dx:LayoutGroup Caption="Información del Entorno">
                                            <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>

                                            <GroupBoxStyle>
                                                <Caption Font-Size="15px" ForeColor="Black"></Caption>

                                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                                            </GroupBoxStyle>
                                            <Items>
                                                <dx:LayoutItem Caption="IP de Servidor de Aplicativo" FieldName="ip_server">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel ID="ip_server" ClientInstanceName="ip_server" runat="server" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="IP de Servidor de Base de Datos" FieldName="ip_database" RowSpan="3">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel ID="ip_database" ClientInstanceName="ip_database" runat="server" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Gestor de Base de Datos" FieldName="management_db">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel ID="management_db" ClientInstanceName="management_db" runat="server" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Versi&#243;n del Gestor de Base de Datos" FieldName="version_db">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel ID="version_db" ClientInstanceName="version_db" runat="server" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                                <dx:LayoutItem Caption="Cantidad de M&#243;dulos del Entorno" FieldName="number_module" ColSpan="1">
                                                    <LayoutItemNestedControlCollection>
                                                        <dx:LayoutItemNestedControlContainer>
                                                            <dx:ASPxLabel ID="number_module" ClientInstanceName="number_module" runat="server" />
                                                        </dx:LayoutItemNestedControlContainer>
                                                    </LayoutItemNestedControlCollection>
                                                </dx:LayoutItem>
                                            </Items>
                                        </dx:LayoutGroup>
                                    </Items>
                                    <Styles LayoutItem-Caption-Font-Bold="true" />
                                </dx:ASPxFormLayout>
                            </div>
                            <div>
                                <dx:ASPxGridView ID="GridCard" runat="server" DataSourceID="GridDB"
                                    Width="510px" AutoGenerateColumns="False" KeyFieldName="id">
                                    <EditFormLayoutProperties ColCount="2" ColumnCount="2">
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColumnName="name_module" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColumnName="name_database" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColumnName="fk_environment" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                            <dx:EditModeCommandLayoutItem ColSpan="2" ColumnSpan="2" HorizontalAlign="Right"></dx:EditModeCommandLayoutItem>
                                        </Items>
                                    </EditFormLayoutProperties>
                                    <Columns>
                                        <dx:GridViewDataTextColumn VisibleIndex="1" FieldName="id" ReadOnly="True">
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="name_module" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="fk_environment" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn FieldName="name_database" Caption="Nombre del Gestor de Base de Datos" VisibleIndex="3">
                                            <PropertiesComboBox ShowImageInEditBox="True" DataSourceID="ComboBox" ImageUrlField="img" TextField="name_management" ValueField="name_management">
                                                <ItemImage Height="24px" Width="23px" />
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle>
            <Paddings PaddingBottom="5px" />
        </ContentStyle>
        <Border BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="3px" />
    </dx:ASPxPopupControl>

    <div class="row">
        <div class="col-md-4">
            <dx:ASPxCardView Images-PopupEditFormWindowClose-IconID=" " CssClass="card-view" ID="CardView" ClientInstanceName="CardView" runat="server" AutoGenerateColumns="False" DataSourceID="CardView1" KeyFieldName="id" EnableTheming="True" Width="864px" Border-BorderColor="Transparent" Theme="MetropolisBlue">
                <ClientSideEvents CardClick="OnCardSelectionChanged" FocusedCardChanged="OnFocusedCardChanged" CustomButtonClick="function(s, e) { ShowInfo(); }" />
                <SettingsPager>
                    <FirstPageButton>
                        <Image IconID="arrows_prev_svg_16x16">
                        </Image>
                    </FirstPageButton>
                    <LastPageButton>
                        <Image IconID="arrows_prev_svg_16x16">
                        </Image>
                    </LastPageButton>
                    <NextPageButton>
                        <Image IconID="arrows_next_svg_16x16">
                        </Image>
                    </NextPageButton>
                    <PrevPageButton>
                        <Image IconID="arrows_prev_svg_16x16">
                        </Image>
                    </PrevPageButton>
                </SettingsPager>
                <SettingsEditing Mode="PopupEditForm">
                    <BatchEditSettings EditMode="Card" />
                </SettingsEditing>
                <SettingsBehavior AllowFocusedCard="True" AllowSelectByCardClick="true" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="True" ></FilterControl>
                </SettingsPopup>
                <SettingsCommandButton>
                    <EditButton Text=" ">
                        <Image IconID="actions_edit_16x16devav"></Image>
                    </EditButton>
                    <DeleteButton Text=" ">
                        <Image IconID="actions_cancel_16x16"></Image>
                    </DeleteButton>
                    <NewButton Text=" ">
                        <Image IconID="actions_add_16x16"></Image>
                    </NewButton>
                    <UpdateButton Text="Actualizar" RenderMode="Button">
                        <Styles>
                            <Style CssClass="btn" BackColor="#0066CC" Cursor="pointer" ForeColor="White">
                                 <HoverStyle BackColor="#0000CC" ForeColor="White" >
                                 </HoverStyle >
                            </Style>
                        </Styles>
                    </UpdateButton>
                    <CancelButton Text="Cancelar" RenderMode="Button">
                        <Styles>
                            <Style CssClass="btn" BackColor="#0066CC" Cursor="pointer" ForeColor="White">
                                 <HoverStyle BackColor="#0000CC" ForeColor="White" >
                                 </HoverStyle >
                            </Style>
                        </Styles>
                    </CancelButton>
                </SettingsCommandButton>

                <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>

                <SettingsLoadingPanel Text="Cargando..." />

                <SettingsBehavior ConfirmDelete="true" EnableCustomizationWindow="true" EnableCardHotTrack="true" />
                <SettingsText PopupEditFormCaption="Formulario de Edición" ConfirmDelete="¿Desea eliminar el Entorno?" />

                <Columns>
                    <dx:CardViewTextColumn FieldName="id" ReadOnly="True" Visible="False">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="name_environment" VisibleIndex="0">
                        <PropertiesTextEdit Width="90%">
                            <Style Font-Size="Small"></Style>
                        </PropertiesTextEdit>
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="url" VisibleIndex="1">
                        <PropertiesTextEdit>
                            <ValidationSettings>
                                <RegularExpression ErrorText="La URL debe de comenzar con https." ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="ip_server" VisibleIndex="2">
                        <PropertiesTextEdit>
                            <ValidationSettings>
                                <RegularExpression ErrorText="La IP debe de ser 255.255.255.255 u otro formato valido." ValidationExpression="^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="ip_database" VisibleIndex="3">
                        <PropertiesTextEdit>
                            <ValidationSettings>
                                <RegularExpression ErrorText="La IP debe de ser 255.255.255.255 u otro formato valido." ValidationExpression="^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:CardViewTextColumn>
                    <dx:CardViewBinaryImageColumn FieldName="logo" VisibleIndex="6">
                        <PropertiesBinaryImage ImageAlign="Middle" ImageHeight="100px" ImageWidth="125px">
                            <EditingSettings Enabled="True">
                            </EditingSettings>
                        </PropertiesBinaryImage>
                    </dx:CardViewBinaryImageColumn>
                    <dx:CardViewComboBoxColumn FieldName="management_db" VisibleIndex="4">
                        <PropertiesComboBox ShowImageInEditBox="True" EnableCallbackMode="True" EnableSynchronization="True" DataSourceID="ComboBox" ImageUrlField="img" ClientInstanceName="CmbManagemnet" TextField="name_management" ValueField="name_management" LoadDropDownOnDemand="True" Width="90%">
                            <ClientSideEvents ButtonClick="function(s, e) { ShowGridViewComboBox(); }"></ClientSideEvents>

                            <ItemImage Height="24px" Width="23px" />
                            <Buttons>
                                <dx:EditButton ImagePosition="Right">
                                    <Image IconID="spreadsheet_adddatasource_svg_dark_16x16"></Image>
                                </dx:EditButton>
                            </Buttons>
                        </PropertiesComboBox>
                    </dx:CardViewComboBoxColumn>
                    <dx:CardViewComboBoxColumn FieldName="version_db" VisibleIndex="5">
                        <PropertiesComboBox ShowImageInEditBox="True" DataSourceID="ComboBox0" ImageUrlField="img" TextField="name_version" ValueField="name_version" Width="90%">
                            <ClientSideEvents ButtonClick="function(s, e) { ShowGridViewComboBox1(); }"></ClientSideEvents>
                            <ItemImage Height="24px" Width="23px" />
                            <Buttons>
                                <dx:EditButton ImagePosition="Right">
                                    <Image IconID="spreadsheet_adddatasource_svg_dark_16x16"></Image>
                                </dx:EditButton>
                            </Buttons>
                        </PropertiesComboBox>
                    </dx:CardViewComboBoxColumn>
                    <dx:CardViewButtonEditColumn FieldName="number_module" Name="BOTTON" VisibleIndex="7">
                        <PropertiesButtonEdit Width="100%">
                            <ClientSideEvents ButtonClick="function(s, e) {
	                                ShowGridView();
                                }"></ClientSideEvents>
                            <Buttons>
                                <dx:EditButton Position="Left" Text="Agregar Modulo" CssClass="boton_modulos">
                                    <Image IconID="iconbuilder_actions_addcircled_svg_dark_16x16"></Image>
                                </dx:EditButton>
                            </Buttons>

                            <ButtonStyle BackColor="#0066CC" Cursor="pointer" ForeColor="White">
                                <HoverStyle BackColor="#0000CC" ForeColor="White"></HoverStyle>

                                <Paddings Padding="5px"></Paddings>

                                <Border BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"></Border>
                            </ButtonStyle>

                            <Style>
                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px" > </Border >
                            </Style>
                        </PropertiesButtonEdit>
                    </dx:CardViewButtonEditColumn>
                    <dx:CardViewButtonEditColumn Caption="btnUpdate" Name="btnUpdate" VisibleIndex="8">
                        <PropertiesButtonEdit Width="100%">
                            <ClientSideEvents ButtonClick="function(s, e) {
	                                Update_Edit();
                                }"></ClientSideEvents>
                            <Buttons>
                                <dx:EditButton Text="Actualizar"></dx:EditButton>
                            </Buttons>
                            <ButtonStyle BackColor="#0066CC" Cursor="pointer" ForeColor="White">
                                <HoverStyle BackColor="#0000CC" ForeColor="White"></HoverStyle>

                                <Paddings Padding="10px"></Paddings>

                                <Border BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"></Border>
                            </ButtonStyle>

                            <Style Cursor="default">
                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px" > </Border >
                            </Style>
                        </PropertiesButtonEdit>
                    </dx:CardViewButtonEditColumn>
                    <dx:CardViewButtonEditColumn Caption="btnCancel" Name="btnCancel" VisibleIndex="8">
                        <PropertiesButtonEdit Width="100%">
                            <ClientSideEvents ButtonClick="function(s, e) {
	                                Close_Edit();
                                }"></ClientSideEvents>
                            <Buttons>
                                <dx:EditButton Text="Cancelar"></dx:EditButton>
                            </Buttons>
                            <ButtonStyle BackColor="#0066CC" Cursor="pointer" ForeColor="White">
                                <HoverStyle BackColor="#0000CC" ForeColor="White"></HoverStyle>

                                <Paddings Padding="10px"></Paddings>

                                <Border BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px"></Border>
                            </ButtonStyle>

                            <Style Cursor="default">
                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px" > </Border >
                            </Style>
                        </PropertiesButtonEdit>
                    </dx:CardViewButtonEditColumn>
                </Columns>

                <EditFormLayoutProperties AlignItemCaptionsInAllGroups="True">
                    <Items>
                        <dx:CardViewCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                        </dx:CardViewCommandLayoutItem>
                        <dx:CardViewLayoutGroup Caption="Informaci&#243;n del Entorno" ColSpan="1" CssClass="Titulo23">
                            <Items>
                                <dx:CardViewColumnLayoutItem ColumnName="name_environment" Caption="Nombre" ColSpan="1">
                                    <CaptionStyle Font-Bold="False"></CaptionStyle>
                                </dx:CardViewColumnLayoutItem>
                                <dx:CardViewColumnLayoutItem ColumnName="logo" Caption="Logo" ColSpan="1">
                                    <CaptionStyle Font-Bold="False"></CaptionStyle>
                                </dx:CardViewColumnLayoutItem>
                                <dx:CardViewColumnLayoutItem ColumnName="url" Caption="Url" ColSpan="1">
                                    <CaptionStyle Font-Bold="False"></CaptionStyle>
                                </dx:CardViewColumnLayoutItem>
                            </Items>

                            <GroupBoxStyle>
                                <Caption Font-Size="Small" ForeColor="Black"></Caption>

                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="2px"></Border>
                            </GroupBoxStyle>
                        </dx:CardViewLayoutGroup>
                        <dx:CardViewLayoutGroup Caption="Informaci&#243;n de Base de Datos" ColSpan="1">
                            <Items>
                                <dx:CardViewColumnLayoutItem ColumnName="ip_server" Caption="IP Servidor" ColSpan="1"></dx:CardViewColumnLayoutItem>
                                <dx:CardViewColumnLayoutItem ColumnName="ip_database" Caption="IP Base de Datos" ColSpan="1"></dx:CardViewColumnLayoutItem>
                                <dx:CardViewColumnLayoutItem ColumnName="management_db" Caption="Gestor de Base de Datos" ColSpan="1"></dx:CardViewColumnLayoutItem>
                                <dx:CardViewColumnLayoutItem ColumnName="version_db" Caption="Versi&#243;n del Gestor de Base de Datos" ColSpan="1"></dx:CardViewColumnLayoutItem>
                            </Items>

                            <GroupBoxStyle>
                                <Caption Font-Size="Small" ForeColor="Black"></Caption>

                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="2px"></Border>
                            </GroupBoxStyle>
                        </dx:CardViewLayoutGroup>
                        <dx:CardViewLayoutGroup Caption="Informaci&#243;n de Modulos" ColSpan="1">
                            <Items>
                                <dx:CardViewColumnLayoutItem ColumnName="BOTTON" Caption="Cantidad de Modulos" ColSpan="1" Width="0%">
                                    <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                                </dx:CardViewColumnLayoutItem>
                            </Items>

                            <GroupBoxStyle>
                                <Caption Font-Size="Small" ForeColor="Black"></Caption>

                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="2px"></Border>
                            </GroupBoxStyle>
                        </dx:CardViewLayoutGroup>
                        <dx:CardViewColumnLayoutItem ColumnName="btnUpdate" Caption=" " ColSpan="1">
                            <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColumnName="btnCancel" Caption=" " ColSpan="1">
                            <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                        </dx:CardViewColumnLayoutItem>
                    </Items>

                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit"></SettingsAdaptivity>
                </EditFormLayoutProperties>

                <CardLayoutProperties>
                    <Items>
                        <dx:CardViewCommandLayoutItem ColSpan="1" HorizontalAlign="Right"  ShowEditButton="True" >
                        </dx:CardViewCommandLayoutItem>
                        <dx:CardViewColumnLayoutItem Caption=" " ColSpan="1" ColumnName="name_environment" HorizontalAlign="Center" CssClass="NombreCard">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem Caption=" " ColSpan="1" Width="125px" Height="100px" VerticalAlign="Middle" HorizontalAlign="Center" ColumnName="logo">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="url" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="ip_server" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="ip_database" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="management_db" Name="CmbManagement" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="version_db" Name="CmbVersion" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="number_module" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewCommandLayoutItem ColSpan="1" ButtonRenderMode="Button" ShowRecoverButton="False">
                            <CustomButtons>
                                <dx:CardViewCustomCommandButton ID="info" Text="INFORMACIÓN">
                                    <Styles>
                                        <Style CssClass="btn" BackColor="#0066CC" Cursor="pointer" ForeColor="White" Width="100%">
                                                <HoverStyle BackColor="#0000CC" ForeColor="White" >
                                                </HoverStyle >
                                        </Style>
                                    </Styles>
                                </dx:CardViewCustomCommandButton>
                            </CustomButtons>
                        </dx:CardViewCommandLayoutItem>
                    </Items>
                </CardLayoutProperties>

                <Styles>
                    <Card Cursor="pointer" Font-Names="Bodoni MT" ForeColor="#0066FF" HorizontalAlign="Center" Font-Size="40pt">
                        <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </Card>
                    <PagerBottomPanel>
                        <Border BorderStyle="None" />
                    </PagerBottomPanel>
                </Styles>

                <StylesExport>
                    <Card BorderSize="1" BorderSides="All"></Card>

                    <Group BorderSize="1" BorderSides="All"></Group>

                    <TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>

                    <Tab BorderSize="1"></Tab>
                </StylesExport>

                <Images>
                    <LoadingPanel IconID="xaf_action_reload_svg_32x32"></LoadingPanel>
                </Images>

                <StylesEditors>
                    <LoadingPanel BackColor="#0066FF">
                    </LoadingPanel>
                </StylesEditors>

                <Border BorderColor="Transparent"></Border>
            </dx:ASPxCardView>


            <dx:ASPxPopupControl ID="ASPxPopupControl3" runat="server" Width="670px" ContentStyle-Paddings-Padding="10px" CloseAction="CloseButton" CloseOnEscape="True" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcModulos"
                HeaderText='MODULOS' HeaderImage-IconID="spreadsheet_allowuserstoeditranges_32x32" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="True" Theme="MetropolisBlue">
                <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxPanel ID="ASPxPanel3" runat="server" DefaultButton="btOK" Width="458px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxGridView ID="gridView1" runat="server" DataSourceID="GridDB"
                                        AutoGenerateColumns="False" Width="638px" KeyFieldName="id">
                                        <SettingsCommandButton>
                                            <EditButton Text=" ">
                                                <Image IconID="actions_edit_16x16devav"></Image>
                                            </EditButton>
                                            <DeleteButton Text=" ">
                                                <Image IconID="actions_cancel_16x16"></Image>
                                            </DeleteButton>
                                            <NewButton Text=" ">
                                                <Image IconID="actions_add_16x16"></Image>
                                            </NewButton>
                                            <UpdateButton Text="Actualizar" RenderMode="Button">
                                            </UpdateButton>
                                            <CancelButton Text="Cancelar" RenderMode="Button">
                                            </CancelButton>
                                        </SettingsCommandButton>
                                        <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
                                        <SettingsText PopupEditFormCaption="Formulario de Edición" />
                                        <EditFormLayoutProperties ColCount="3" ColumnCount="3">
                                            <Items>
                                                <dx:GridViewLayoutGroup Caption="Modulos" ColSpan="3" ColumnSpan="3">
                                                    <Items>
                                                        <dx:GridViewColumnLayoutItem ColumnName="name_module" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                        <dx:GridViewColumnLayoutItem ColumnName="name_database" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                        <dx:GridViewColumnLayoutItem ColumnName="fk_environment" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                    </Items>

                                                    <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>

                                                    <GroupBoxStyle>
                                                        <Caption Font-Bold="True" ForeColor="Black">
                                                            <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                                                        </Caption>
                                                    </GroupBoxStyle>
                                                </dx:GridViewLayoutGroup>
                                                <dx:EditModeCommandLayoutItem ColSpan="3" ColumnSpan="3" HorizontalAlign="Right"></dx:EditModeCommandLayoutItem>
                                            </Items>
                                            <SettingsAdaptivity />
                                        </EditFormLayoutProperties>
                                        <Columns>
                                            <dx:GridViewCommandColumn Name="Botones" VisibleIndex="6" ShowEditButton="True" ShowDeleteButton="True" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="id" ReadOnly="True">
                                                <EditFormSettings Visible="False"></EditFormSettings>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Nombre del Modulo" VisibleIndex="1" FieldName="name_module"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="fk_environment" ShowInCustomizationForm="True" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="name_database" Caption="Nombre del Gestor de Base de Datos" VisibleIndex="3">
                                                <PropertiesComboBox ShowImageInEditBox="True" DataSourceID="ComboBox" ImageUrlField="img" TextField="name_management" ValueField="name_management">
                                                    <ItemImage Height="24px" Width="23px" />
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                        </Columns>
                                        <SettingsPopup>
                                            <EditForm Width="730">
                                                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
                                            </EditForm>
                                        </SettingsPopup>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <SettingsBehavior ConfirmDelete="true" EnableCustomizationWindow="true" EnableRowHotTrack="true" />
                                        <SettingsText ConfirmDelete="¿Desea eliminar el modulo?" />
                                    </dx:ASPxGridView>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <ContentStyle>
                    <Paddings PaddingBottom="5px" />
                </ContentStyle>
                <Border BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="3px" />
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="PopupComboBox" runat="server" Width="720px" ContentStyle-Paddings-Padding="10px" CloseAction="CloseButton" CloseOnEscape="True" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcManagement"
                HeaderText='GESTOR DE BASE DE DATOS' HeaderImage-IconID="data_database_32x32" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="True" Theme="MetropolisBlue">
                <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxPanel ID="ASPxPanel4" runat="server" DefaultButton="btOK" Width="458px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxGridView ID="GridViewComboBox" runat="server" DataSourceID="ComboBox"
                                        AutoGenerateColumns="False" Width="638px" KeyFieldName="id">
                                        <SettingsCommandButton>
                                            <EditButton Text=" ">
                                                <Image IconID="actions_edit_16x16devav"></Image>
                                            </EditButton>
                                            <DeleteButton Text=" ">
                                                <Image IconID="actions_cancel_16x16"></Image>
                                            </DeleteButton>
                                            <NewButton Text=" ">
                                                <Image IconID="actions_add_16x16"></Image>
                                            </NewButton>
                                            <UpdateButton Text="Actualizar" RenderMode="Button">
                                            </UpdateButton>
                                            <CancelButton Text="Cancelar" RenderMode="Button">
                                            </CancelButton>
                                        </SettingsCommandButton>
                                        <SettingsDataSecurity AllowDelete="False"></SettingsDataSecurity>

                                        <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
                                        <EditFormLayoutProperties ColCount="3" ColumnCount="3">
                                            <Items>
                                                <dx:GridViewLayoutGroup Caption="Gestor de Base de Datos" ColSpan="3" ColumnSpan="3">
                                                    <Items>
                                                        <dx:GridViewColumnLayoutItem ColumnName="name_management" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                        <dx:GridViewColumnLayoutItem ColumnName="img" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                    </Items>

                                                    <GroupBoxStyle>
                                                        <Caption Font-Bold="True" ForeColor="Black"></Caption>

                                                        <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                                                    </GroupBoxStyle>
                                                </dx:GridViewLayoutGroup>
                                                <dx:EditModeCommandLayoutItem ColSpan="3" ColumnSpan="3" HorizontalAlign="Center"></dx:EditModeCommandLayoutItem>
                                            </Items>
                                            <SettingsAdaptivity />
                                        </EditFormLayoutProperties>
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="3" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="id" ReadOnly="True">
                                                <EditFormSettings Visible="False"></EditFormSettings>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Nombre del Gestor de Base de Datos" VisibleIndex="1" FieldName="name_management"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="img" ShowInCustomizationForm="True" Caption="Imagen del Gestor de Base de Datos" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPopup>
                                            <EditForm Width="730">
                                                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
                                            </EditForm>
                                        </SettingsPopup>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <SettingsText PopupEditFormCaption="Formulario de Edición" />
                                    </dx:ASPxGridView>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <ContentStyle>
                    <Paddings PaddingBottom="5px" />
                </ContentStyle>
                <Border BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="3px" />
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" Width="940px" ContentStyle-Paddings-Padding="10px" CloseAction="CloseButton" CloseOnEscape="True" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcVersion"
                HeaderText='VERSION DEL GESTOR DE BASE DE DATOS' HeaderImage-IconID="data_database_32x32" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="True" Theme="MetropolisBlue">
                <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxPanel ID="ASPxPanel2" runat="server" DefaultButton="btOK" Width="458px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="ComboBox0"
                                        AutoGenerateColumns="False" Width="638px" KeyFieldName="id">
                                        <SettingsCommandButton>
                                            <EditButton Text=" ">
                                                <Image IconID="actions_edit_16x16devav"></Image>
                                            </EditButton>
                                            <DeleteButton Text=" ">
                                                <Image IconID="actions_cancel_16x16"></Image>
                                            </DeleteButton>
                                            <NewButton Text=" ">
                                                <Image IconID="actions_add_16x16"></Image>
                                            </NewButton>
                                            <UpdateButton Text="Actualizar" RenderMode="Button">
                                            </UpdateButton>
                                            <CancelButton Text="Cancelar" RenderMode="Button">
                                            </CancelButton>
                                        </SettingsCommandButton>
                                        <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
                                        <EditFormLayoutProperties ColCount="3" ColumnCount="3">
                                            <Items>
                                                <dx:GridViewLayoutGroup Caption="Versi&#243;n del Gestor de Base de Datos" ColSpan="3" ColumnSpan="3">
                                                    <Items>
                                                        <dx:GridViewColumnLayoutItem ColumnName="Nombre de la Versi&#243;n del Gestor de Base de Datos" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                        <dx:GridViewColumnLayoutItem ColumnName="Imagen de la Versi&#243;n del Gestor de Base de Datos" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                        <dx:GridViewColumnLayoutItem ColumnName="fk_management_db" ColSpan="1"></dx:GridViewColumnLayoutItem>
                                                    </Items>
                                                    <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                                                    <GroupBoxStyle>
                                                        <Caption Font-Bold="True" ForeColor="Black"></Caption>

                                                        <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"></Border>
                                                    </GroupBoxStyle>
                                                </dx:GridViewLayoutGroup>
                                                <dx:EditModeCommandLayoutItem ColSpan="3" ColumnSpan="3" HorizontalAlign="Right"></dx:EditModeCommandLayoutItem>
                                            </Items>
                                            <SettingsAdaptivity />
                                        </EditFormLayoutProperties>
                                        <Columns>
                                            <dx:GridViewCommandColumn VisibleIndex="4" ShowEditButton="True" ShowDeleteButton="True" ShowNewButtonInHeader="True"></dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="id" ReadOnly="True">
                                                <EditFormSettings Visible="False"></EditFormSettings>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="name_version" ShowInCustomizationForm="True" Name="Nombre de la Versi&#243;n del Gestor de Base de Datos" Caption="Nombre de la Versi&#243;n del Gestor de Base de Datos" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="img" Name="Imagen de la Versi&#243;n del Gestor de Base de Datos" Caption="Imagen de la Versi&#243;n del Gestor de Base de Datos" VisibleIndex="2"></dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="fk_management_db" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPopup>
                                            <EditForm Width="730">
                                                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
                                            </EditForm>
                                        </SettingsPopup>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <SettingsBehavior ConfirmDelete="true" EnableCustomizationWindow="true" EnableRowHotTrack="true" />
                                        <SettingsText PopupEditFormCaption="Formulario de Edición" ConfirmDelete="¿Desea eliminar la versión del gestor de base de datos?" />
                                    </dx:ASPxGridView>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <ContentStyle>
                    <Paddings PaddingBottom="5px" />
                </ContentStyle>
                <Border BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="3px" />
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="PopupCancel" runat="server" Width="440px" ContentStyle-Paddings-Padding="10px" CloseAction="CloseButton" CloseOnEscape="True" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcCancelar"
                HeaderText="Alerta" HeaderImage-IconID="xaf_state_validation_information_svg_32x32" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="True" Theme="MetropolisBlue">
                <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxPanel ID="ASPxPanel6" runat="server" DefaultButton="btOK" Width="458px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div class="TextoPopup">
                                        <h4>¿Desea cancelar todos los cambios generados en el formulario de edición?</h4>
                                        <div class="btnsPopup">
                                            <asp:Button runat="server" OnClick="Close" Text="Aceptar" CssClass="btns" />
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <ContentStyle>
                    <Paddings PaddingBottom="5px" />
                </ContentStyle>
                <Border BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="3px" />
            </dx:ASPxPopupControl>

            <dx:ASPxPopupControl ID="PopupActualizar" runat="server" Width="440px" ContentStyle-Paddings-Padding="10px" CloseAction="CloseButton" CloseOnEscape="True" Modal="True"
                PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcActualizar"
                HeaderText="Alerta" HeaderImage-IconID="xaf_state_validation_information_svg_32x32" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="True" Theme="MetropolisBlue">
                <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxPanel ID="ASPxPanel5" runat="server" DefaultButton="btOK" Width="458px">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <div class="TextoPopup">
                                        <h4>¿Desea enviar la actualización del formulario de edición?</h4>
                                        <div class="btnsPopup">
                                            <asp:Button runat="server" OnClick="Update" Text="Aceptar" CssClass="btns" />
                                        </div>
                                    </div>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxPanel>
                    </dx:PopupControlContentControl>
                </ContentCollection>
                <ContentStyle>
                    <Paddings PaddingBottom="5px" />
                </ContentStyle>
                <Border BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="3px" />
            </dx:ASPxPopupControl>

            <asp:SqlDataSource runat="server" ID="GridExample" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" DeleteCommand="DELETE FROM [module_Example] WHERE [id] = @id" InsertCommand="INSERT INTO [module_Example] ([name_module], [name_database]) VALUES (@name_module, @name_database)" SelectCommand="SELECT * FROM [module_Example]" UpdateCommand="UPDATE [module_Example] SET [name_module] = @name_module, [name_database] = @name_database WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name_module" Type="String"></asp:Parameter>
                    <asp:Parameter Name="name_database" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name_module" Type="String"></asp:Parameter>
                    <asp:Parameter Name="name_database" Type="String"></asp:Parameter>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ComboBox" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT * FROM [management_db]" DeleteCommand="DELETE FROM [management_db] WHERE [id] = @id" InsertCommand="INSERT INTO [management_db] ([name_management], [img]) VALUES (@name_management, @img)" UpdateCommand="UPDATE [management_db] SET [name_management] = @name_management, [img] = @img WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="name_management" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="name_management" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ComboBox0" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT * FROM [version_db]" DeleteCommand="DELETE FROM [version_db] WHERE [id] = @id" InsertCommand="INSERT INTO [version_db] ([id], [name_version], [img], [fk_management_db]) VALUES (@id, @name_version, @img, @fk_management_db)" UpdateCommand="UPDATE [version_db] SET [name_version] = @name_version, [img] = @img, [fk_management_db] = @fk_management_db WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="name_version" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                    <asp:Parameter Name="fk_management_db" Type="Int32"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name_version" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                    <asp:Parameter Name="fk_management_db" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ComboBox1" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT * FROM [catalogue] WHERE ([name_catalogue] = @name_catalogue)" DeleteCommand="DELETE FROM [catalogue] WHERE [id] = @id" InsertCommand="INSERT INTO [catalogue] ([name_catalogue], [value_catalogue], [img]) VALUES (@name_catalogue, @value_catalogue, @img)" UpdateCommand="UPDATE [catalogue] SET [name_catalogue] = @name_catalogue, [value_catalogue] = @value_catalogue, [img] = @img WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name_catalogue" Type="String"></asp:Parameter>
                    <asp:Parameter Name="value_catalogue" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter DefaultValue="rol" Name="name_catalogue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name_catalogue" Type="String"></asp:Parameter>
                    <asp:Parameter Name="value_catalogue" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="CardView1" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT * FROM [info_environmentt]" DeleteCommand="DELETE FROM [info_environmentt] WHERE [id] = @id" InsertCommand="INSERT INTO [info_environmentt] ([name_environment], [logo], [url], [ip_server], [ip_database], [management_db], [version_db], [number_module]) VALUES (@name_environment, @logo, @url, @ip_server, @ip_database, @management_db, @version_db, @number_module)" UpdateCommand="UPDATE [info_environmentt] SET [name_environment] = @name_environment, [logo] = @logo, [url] = @url, [ip_server] = @ip_server, [ip_database] = @ip_database, [management_db] = @management_db, [version_db] = @version_db, [number_module] = @number_module WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name_environment" Type="String" />
                    <asp:Parameter Name="logo" DbType="Binary" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="ip_server" Type="String" />
                    <asp:Parameter Name="ip_database" Type="String" />
                    <asp:Parameter Name="management_db" Type="String" />
                    <asp:Parameter Name="version_db" Type="String" />
                    <asp:Parameter Name="number_module" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name_environment" Type="String" />
                    <asp:Parameter Name="logo" DbType="Binary" />
                    <asp:Parameter Name="url" Type="String" />
                    <asp:Parameter Name="ip_server" Type="String" />
                    <asp:Parameter Name="ip_database" Type="String" />
                    <asp:Parameter Name="management_db" Type="String" />
                    <asp:Parameter Name="version_db" Type="String" />
                    <asp:Parameter Name="number_module" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="GridDB" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT * FROM [module]" DeleteCommand="DELETE FROM [module] WHERE [id] = @id" InsertCommand="INSERT INTO [module] ([name_module], [name_database], [fk_environment]) VALUES (@name_module, @name_database, @fk_environment)" UpdateCommand="UPDATE [module] SET [name_module] = @name_module, [name_database] = @name_database, [fk_environment] = @fk_environment WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="name_module" Type="String"></asp:Parameter>
                    <asp:Parameter Name="name_database" Type="String"></asp:Parameter>
                    <asp:Parameter Name="fk_environment" Type="Int32"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name_module" Type="String"></asp:Parameter>
                    <asp:Parameter Name="name_database" Type="String"></asp:Parameter>
                    <asp:Parameter Name="fk_environment" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="title-container" style="height: 115px; top: 11px; left: 0px; background: linear-gradient(90deg, rgba(27,202,237,1) 28%, rgba(13,175,179,1) 63%, rgba(93,69,231,1) 100%);">
        <h5 style="text-align: center; padding-top: 14px; margin-bottom: 10px; color: white; font-weight: bold">::ENTORNO::</h5>
        <hr style="text-align: center; margin-top: 10px; margin-bottom: 10px; width: 300px; height: 2px; font-weight: bold; background-color: white" />
        <h6 style="text-align: center; margin-top: 10px; margin-bottom: 10px; color: white; font-weight: bold">ENTORNO DESAROLLO - NOMINA</h6>
        <hr style="text-align: center; margin-top: 10px; margin-bottom: 10px; width: 100%; height: 2px; color: white; font-weight: bold" />
        <h4 style="text-align: center; margin-top: 10px; margin-bottom: 10px; color: white; font-weight: bold">© CG/WEB V.3.0 by Aggity | 2020</h4>
    </div>
</asp:Content>

