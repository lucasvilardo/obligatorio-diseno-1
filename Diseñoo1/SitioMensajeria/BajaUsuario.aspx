<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BajaUsuario.aspx.cs" Inherits="BajaUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


        .auto-style2 {
            width: 66%;
            height: 77px;
            align-items: center;
            text-align: center;
            margin-left: 134px;
        }
        .auto-style7 {
            height: 108px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        BAJA DE USUARIO</p>
        <table border="1" class="auto-style2">
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnBaja" runat="server" OnClick="btnIngresar_Click" Text="DAR BAJA" Width="328px" Height="58px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        </asp:Content>

