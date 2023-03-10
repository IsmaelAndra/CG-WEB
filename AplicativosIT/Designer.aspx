<%@ Page Title="DESARROLLADOR" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Designer.aspx.cs" Inherits="AplicativosIT.Login" %>
<%@ Register assembly="DevExpress.Web.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .botonExit {
            float: right;
            margin-right: 90px;
            margin-top: -175px;
            background: transparent;
        }
    </style>
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

    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" Width="577px" CloseAction="CloseButton" CloseOnEscape="True" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcInfo"
        HeaderText="Información" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="True" Theme="MetropolisBlue">
        <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="ASPxPanel1" runat="server" DefaultButton="btOK" Width="489px">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT [id], [ip_server], [ip_database], [management_db], [version_db], [number_module] FROM [info_environmentt]" DeleteCommand="DELETE FROM [info_environmentt] WHERE [id] = @id" InsertCommand="INSERT INTO [info_environmentt] ([ip_server], [ip_database], [management_db], [version_db], [number_module]) VALUES (@ip_server, @ip_database, @management_db, @version_db, @number_module)" UpdateCommand="UPDATE [info_environmentt] SET [ip_server] = @ip_server, [ip_database] = @ip_database, [management_db] = @management_db, [version_db] = @version_db, [number_module] = @number_module WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ip_server" Type="String" />
                                    <asp:Parameter Name="ip_database" Type="String" />
                                    <asp:Parameter Name="management_db" Type="String" />
                                    <asp:Parameter Name="version_db" Type="String" />
                                    <asp:Parameter Name="number_module" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ip_server" Type="String" />
                                    <asp:Parameter Name="ip_database" Type="String" />
                                    <asp:Parameter Name="management_db" Type="String" />
                                    <asp:Parameter Name="version_db" Type="String" />
                                    <asp:Parameter Name="number_module" Type="Int32" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="544px" KeyFieldName="id" Theme="MetropolisBlue" Images-DetailCollapsedButton-IconID="iconbuilder_actions_arrow3right_svg_gray_16x16" Images-DetailExpandedButton-IconID="iconbuilder_actions_arrow3up_svg_gray_16x16">
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
                                <SettingsPopup>
                                    <FilterControl AutoUpdatePosition="False">
                                    </FilterControl>
                                </SettingsPopup>
                                <SettingsAdaptivity>
                                    <AdaptiveDetailLayoutProperties>
                                        <Items>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="id">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="ip_server">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="ip_database">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="management_db">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="version_db">
                                            </dx:GridViewColumnLayoutItem>
                                            <dx:GridViewColumnLayoutItem ColSpan="1" ColumnName="number_module">
                                            </dx:GridViewColumnLayoutItem>
                                        </Items>
                                    </AdaptiveDetailLayoutProperties>
                                </SettingsAdaptivity>
                                <Templates>
                                    <DetailRow>
                                        <dx:ASPxGridView ID="detailGrid" runat="server" DataSourceID="SqlDataSource3" KeyFieldName="id;fk_environment"
                                            Width="100%" EnablePagingGestures="True">
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="name_module" ShowInCustomizationForm="True" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="name_database" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowFooter="True" />
                                            <SettingsPager EnableAdaptivity="true" />
                                            <Styles Header-Wrap="True" />
                                        </dx:ASPxGridView>
                                    </DetailRow>
                                </Templates>
                                <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ip_server" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ip_database" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="management_db" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="version_db" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="number_module" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Styles>
                                    <Table>
                                        <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </Table>
                                    <Header BackColor="#0066FF" ForeColor="White">
                                    </Header>
                                </Styles>

                                <Images>
                                    <DetailCollapsedButton IconID="iconbuilder_actions_arrow3right_svg_gray_16x16"></DetailCollapsedButton>

                                    <DetailExpandedButton IconID="iconbuilder_actions_arrow3down_svg_dark_16x16"></DetailExpandedButton>
                                </Images>

                                <Border BorderStyle="None" />
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" DeleteCommand="DELETE FROM [module] WHERE [id] = @id" InsertCommand="INSERT INTO [module] ([name_module], [name_database], [fk_environment]) VALUES (@name_module, @name_database, @fk_environment)" SelectCommand="SELECT * FROM [module]" UpdateCommand="UPDATE [module] SET [name_module] = @name_module, [name_database] = @name_database, [fk_environment] = @fk_environment WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="name_module" Type="String" />
                                    <asp:Parameter Name="name_database" Type="String" />
                                    <asp:Parameter Name="fk_environment" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name_module" Type="String" />
                                    <asp:Parameter Name="name_database" Type="String" />
                                    <asp:Parameter Name="fk_environment" Type="Int32" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
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
            <dx:ASPxCardView CssClass="card-view" ID="CardView" runat="server" AutoGenerateColumns="False" DataSourceID="CardView1" KeyFieldName="id" EnableTheming="True" Width="864px" Border-BorderColor="Transparent" Theme="MetropolisBlue">
                <ClientSideEvents CardClick="OnCardSelectionChanged" CustomButtonClick="function(s, e) { ShowInfo(); }" />
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
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
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
                            <Style BackColor="#0066CC" Cursor="pointer" ForeColor="White">
                                <HoverStyle BackColor="#0000CC" ForeColor="White" >
                                </HoverStyle >
                                <Paddings Padding="5px" />
                            </Style>
                        </Styles>
                    </UpdateButton>
                    <CancelButton Text="Cancelar" RenderMode="Button">
                        <Styles>
                            <Style BackColor="#0066CC" Cursor="pointer" ForeColor="White">
                                <HoverStyle BackColor="#0000CC" ForeColor="White" >
                                </HoverStyle >
                                <Paddings Padding="5px" />
                            </Style>
                        </Styles>
                    </CancelButton>
                </SettingsCommandButton>

                <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>

                <SettingsLoadingPanel Text="Cargando..." />

                <Columns>
                    <dx:CardViewTextColumn FieldName="id" ReadOnly="True" Visible="False">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="name_environment" VisibleIndex="0">
                        <PropertiesTextEdit Width="90%"><Style Font-Size="Small"></Style></PropertiesTextEdit>
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
                    <dx:CardViewTextColumn FieldName="number_module" VisibleIndex="7">
                        <PropertiesTextEdit>
                            <ValidationSettings>
                                <RegularExpression ErrorText="Solo se aceptan números" ValidationExpression="\d+" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:CardViewTextColumn>
                    <dx:CardViewBinaryImageColumn FieldName="logo" VisibleIndex="8">
                        <PropertiesBinaryImage ImageAlign="Middle" ImageHeight="100px" ImageWidth="125px">
                            <EditingSettings Enabled="True">
                            </EditingSettings>
                        </PropertiesBinaryImage>
                    </dx:CardViewBinaryImageColumn>
                    <dx:CardViewComboBoxColumn FieldName="management_db" VisibleIndex="4">
                        <PropertiesComboBox ShowImageInEditBox="True" DataSourceID="ComboBox" ImageUrlField="img" TextField="name_management" ValueField="name_management" Width="90%">
                            <ItemImage Height="24px" Width="23px" />
                            <Buttons>
                                <dx:EditButton ImagePosition="Right">
                                    <Image IconID="spreadsheet_adddatasource_svg_dark_16x16"></Image>
                                </dx:EditButton>
                            </Buttons>
                        </PropertiesComboBox>
                    </dx:CardViewComboBoxColumn>
                    <dx:CardViewComboBoxColumn FieldName="version_db" VisibleIndex="5">
                        <PropertiesComboBox ShowImageInEditBox="True" DataSourceID="ComboBox0" ImageUrlField="img" TextField="name_version" ValueField="name_version" Width="90%" SelectInputTextOnClick="True">
                            <ItemImage Height="24px" Width="23px" />
                            <Buttons>
                                <dx:EditButton ImagePosition="Right">
                                    <Image IconID="spreadsheet_adddatasource_svg_dark_16x16"></Image>
                                </dx:EditButton>
                            </Buttons>
                        </PropertiesComboBox>
                    </dx:CardViewComboBoxColumn>
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
                                <dx:CardViewColumnLayoutItem ColumnName="number_module" Caption="Cantidad de M&#243;dulos del Entorno" ColSpan="1"></dx:CardViewColumnLayoutItem>
                            </Items>

                            <GroupBoxStyle>
                                <Caption Font-Size="Small" ForeColor="Black"></Caption>

                                <Border BorderColor="Transparent" BorderStyle="Solid" BorderWidth="2px"></Border>
                            </GroupBoxStyle>
                        </dx:CardViewLayoutGroup>
                        <dx:EditModeCommandLayoutItem ColSpan="1" HorizontalAlign="Right">
                        </dx:EditModeCommandLayoutItem>
                    </Items>

                    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit"></SettingsAdaptivity>
                </EditFormLayoutProperties>

                <CardLayoutProperties>
                    <Items>
                        <dx:CardViewCommandLayoutItem ColSpan="1" HorizontalAlign="Right" ShowEditButton="True">
                        </dx:CardViewCommandLayoutItem>
                        <dx:CardViewColumnLayoutItem Caption=" " ColSpan="1" ColumnName="name_environment" HorizontalAlign="Center">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem Caption=" " ColSpan="1" Width="125px" Height="100px" VerticalAlign="Middle" HorizontalAlign="Center" ColumnName="logo">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="url" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="ip_server" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="ip_database" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="management_db" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="version_db" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewColumnLayoutItem ColSpan="1" ColumnName="number_module" Visible="False">
                        </dx:CardViewColumnLayoutItem>
                        <dx:CardViewCommandLayoutItem ColSpan="1" ButtonRenderMode="Button" ShowRecoverButton="False">
                            <CustomButtons>
                                <dx:CardViewCustomCommandButton ID="info" Text="INFORMACIÓN">
                                    <Styles>
                                        <Style BackColor="#0066CC" Cursor="pointer" ForeColor="White" Width="100%">
                                            <HoverStyle BackColor="#0000CC" ForeColor="White">
                                            </HoverStyle>
                                            <Paddings Padding="5px" />
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
            <asp:SqlDataSource ID="ComboBox" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT * FROM [management_db]" DeleteCommand="DELETE FROM [management_db] WHERE [id] = @id" InsertCommand="INSERT INTO [management_db] ([id], [name_management], [img]) VALUES (@id, @name_management, @img)" UpdateCommand="UPDATE [management_db] SET [name_management] = @name_management, [img] = @img WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="name_management" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name_management" Type="String"></asp:Parameter>
                    <asp:Parameter Name="img" Type="String"></asp:Parameter>
                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
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
            <asp:SqlDataSource ID="ComboBox1" runat="server" ConnectionString="<%$ ConnectionStrings:Proyecto Final %>" SelectCommand="SELECT * FROM [catalogue] WHERE ([name_catalogue] = @name_catalogue)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="rol" Name="name_catalogue" Type="String" />
                </SelectParameters>
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

