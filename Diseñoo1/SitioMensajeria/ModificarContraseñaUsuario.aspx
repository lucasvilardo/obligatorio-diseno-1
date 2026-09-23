<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModificarContraseñaUsuario.aspx.cs" Inherits="ModificarContraseñaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .auto-style2 {
            width: 66%;
            height: 77px;
            align-items: center;
            text-align: center;
            margin-left: 134px;
        }
        .auto-style3 {
            height: 29px;
        }
        .auto-style7 {
            height: 34px;
            width: 177px;
        }
        .auto-style8 {
            width: 84%;
            height: 34px;
        }
        .auto-style10 {
            height: 42px;
            width: 177px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        MODIFICAR LA CONTRASEÑA DEL USUARIO</p>
    <p>
        &nbsp;</p>
        <table border="1" class="auto-style2">
            <tr>
                <td class="auto-style7">Ingresar su Contraseña actual:</td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtContraActual" runat="server" Width="396px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Ingresar su nueva Contraseña:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtContraNueva" runat="server" TextMode="Password" Width="392px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">Ingresar nuevamente su nueva Contraseña</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtContraNueva2" runat="server" TextMode="Password" Width="392px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnModificar" runat="server" OnClick="btnIngresar_Click" Text="MODIFICAR" Width="229px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        </asp:Content>

