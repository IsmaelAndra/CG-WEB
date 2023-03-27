<%@ Page Title="INICIO" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AplicativosIT._Default" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .botonLogin {
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
        function ShowLogOn() {
            window.location = "Login.aspx";
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
    <link href="./Styles/Card.css" rel="Stylesheet" type="text/css" />
    <div style="position: relative">
        <div style="position: absolute; z-index: 2; width: 100%; height: 100%">
            <h1 class="title" style="text-align: center; font-size: 45px; color: midnightblue">CG/WEB</h1>
            <p class="lead" style="text-align: center; font-size: 30px; color: black;">Sistema Administrativo Financiero</p>
            <p class="lead" style="text-align: center; font-weight: bold; font-size: 30px; color: black;">MENU PRINCIPAL</p>
            <dx:ASPxButton ID="Button1" runat="server" Image-IconID="xaf_filtereditor_user_svg_dark_32x32" AutoPostBack="False" UseSubmitBehavior="False" CssClass="botonLogin">
                <ClientSideEvents Click="function(s, e) { ShowLogOn(); }" />
                <Border BorderColor="Transparent"></Border>
            </dx:ASPxButton>
        </div>
        <div style="background-image: linear-gradient(90deg, rgba(27,202,237,1) 28%, rgba(13,175,179,1) 63%, rgba(93,69,231,1) 100%);">
            <div class="title-container" style="display: grid; grid-template-columns: repeat(3, 1fr); margin-bottom: 11px; padding: 15px; opacity: 0.4; background-image: url(https://img.freepik.com/foto-gratis/empresaria-usando-tableta-analizar-concepto-exito-estadisticas-estrategia-financiera-empresa-planificacion-futuro-sala-oficina_74952-1410.jpg?w=2000);">
            </div>
        </div>
        <svg class="waves" style="position: absolute" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
            <path fill="#ffffff" fill-opacity="1" d="M0,256L48,234.7C96,213,192,171,288,176C384,181,480,235,576,261.3C672,288,768,288,864,261.3C960,235,1056,181,1152,160C1248,139,1344,149,1392,154.7L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
        </svg>
    </div>
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
                <SettingsBehavior AllowFocusedCard="True" AllowSelectByCardClick="true" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsLoadingPanel Text="Cargando..." />
                <Columns>
                    <dx:CardViewTextColumn FieldName="id" ReadOnly="True" Visible="False">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="name_environment" VisibleIndex="0" Caption=" ">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="url" VisibleIndex="2">
                        <PropertiesTextEdit Width="100%">
                            <ValidationSettings>
                                <RegularExpression ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="ip_server" VisibleIndex="3">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="ip_database" VisibleIndex="4">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="management_db" VisibleIndex="5">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="version_db" VisibleIndex="6">
                    </dx:CardViewTextColumn>
                    <dx:CardViewTextColumn FieldName="number_module" VisibleIndex="7">
                    </dx:CardViewTextColumn>
                    <dx:CardViewBinaryImageColumn FieldName="logo" VisibleIndex="1">
                    </dx:CardViewBinaryImageColumn>
                </Columns>

                <Templates>
                    <Card>
                        <dx:ASPxBinaryImage ID="logo" runat="server" Value='<%# Eval("logo") %>' Width="225px" Height="175px" Cursor="pointer" />
                        <div class="info">
                            <p><dx:ASPxLabel runat="server" Cursor="pointer" Text='<%# Eval("name_environment") %>' /></p>
                        </div>
                    </Card>
                </Templates>
                <Styles>
                    <Card CssClass="card" Cursor="pointer">
                        <Border BorderStyle="None" />
                    </Card>
                    <PagerBottomPanel>
                        <Border BorderStyle="None" />
                    </PagerBottomPanel>
                </Styles>
                <Images>
                    <LoadingPanel IconID="xaf_action_reload_svg_32x32"></LoadingPanel>
                </Images>
                <Border BorderColor="Transparent"></Border>
            </dx:ASPxCardView>
            <asp:SqlDataSource ID="CardView1" runat="server" ConnectionString="<%$ ConnectionStrings:Final %>" SelectCommand="SELECT * FROM [info_environmentt]">
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
