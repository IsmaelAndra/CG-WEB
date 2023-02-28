<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Index.aspx.cs" Inherits="AplicativosIT.Views.Home.Index" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function login() {
            var password = document.getElementById('Password');
            if (password == 'Admin') {
                window.open("Admin.aspx");
            } else {
                window.open("Designer.aspx");
            }
        }
    </script>
    <div style="position: relative">
            <div style="position: absolute; z-index: 2; width: 100%; height: 100%">
                <h1 class="title" style="text-align: center; font-size: 45px; color: midnightblue">CG/WEB</h1>
                <p class="lead" style="text-align: center; font-size: 30px; color:black;">Sistema Administrativo Financiero</p>
                <p class="lead" style="text-align: center; font-weight:bold; font-size: 30px; color:black;">LOGIN</p>
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
    <br />
    <div>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" Width="100%">
        <LayoutTemplate>
            <div class="header">Login</div>
            <div class="body bg-gray">
                <div class="form-group">
                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Ingrese usuario..."></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Ingrese clave..." TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="footer">
                <asp:Button ID="btnIngresar" CommandName="Login" runat="server" Text="Iniciar Sesión" OnClick="login()" CssClass="btn bg-olive btn-block" />
            </div>
        </LayoutTemplate>
    </asp:Login>
        </div>
    <br />
    <div class="title-container"  style="
        height: 115px; top: 11px; left: 0px; background: linear-gradient(90deg, rgba(27,202,237,1) 28%, rgba(13,175,179,1) 63%, rgba(93,69,231,1) 100%);">
        <h5 style="text-align:center; padding-top: 14px; margin-bottom: 10px; color: white; font-weight: bold">::ENTORNO::</h5>
        <hr style="text-align:center; margin-top: 10px; margin-bottom: 10px; width: 300px; height: 2px; font-weight: bold; background-color: white"/>
        <h6 style="text-align:center; margin-top: 10px; margin-bottom: 10px; color: white; font-weight: bold">ENTORNO DESAROLLO - NOMINA</h6>
        <hr style="text-align:center; margin-top: 10px; margin-bottom: 10px; width: 100%; height: 2px; color: white; font-weight: bold"/>
        <h4 style="text-align:center; margin-top: 10px; margin-bottom: 10px; color: white; font-weight: bold">© CG/WEB V.3.0 by Aggity | 2020</h4>
    </div>
</asp:Content>
