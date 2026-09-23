<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AltaUsuario.aspx.cs" Inherits="AltaUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

         .auto-style10 {
             width: 80%;
             height: 61px;
             margin-left: 210px;
         }
         .auto-style13 {
             height: 54px;
             width: 270px;
         }
         .auto-style12 {
             height: 54px;
         }
         .auto-style3 {
            width: 270px;
            height: 33px;
        }
        .auto-style4 {
            height: 80px;
        }
        .auto-style4 {
            height: 33px;
        }
        
       
        .auto-style5 {
            height: 42px;
        }
        .auto-style5 {
            height: 31px;
        }
         .auto-style11 {
             height: 42px;
             width: 270px;
         }
         .auto-style8 {
            height: 18px;
            width: 381px;
        }
        .auto-style9 {
            height: 18px;
        }
         </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            ALTA DE USUARIO<br />
            <br />
            <table border="3" class="auto-style10" style="text-align:center">
                <tr>
                    <td class="auto-style13">Nombre de Usuario:</td>
                    <td class="auto-style12" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtNomUsuario" runat="server" Width="258px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Contraseña:</td>
                    <td class="auto-style4" colspan="2">
                        <asp:TextBox ID="txtContra" runat="server" Width="273px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Nombre Completo:</td>
                    <td class="auto-style4" colspan="2">
                        <asp:TextBox ID="txtNomCompleto" runat="server" Width="273px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Fecha de Nacimiento:</td>
                    <td class="auto-style4" colspan="2">
                        <asp:TextBox ID="txtFecha" runat="server" Width="273px" TextMode="Date"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Mail de contacto:</td>
                    <td class="auto-style4" colspan="2">
                        <asp:TextBox ID="txtMail" runat="server" Width="273px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="3">
                        <asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Width="365px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11"></td>
                    <td class="auto-style8">&nbsp;&nbsp; &nbsp;
                        <asp:Button ID="btnAlta" runat="server" OnClick="btnAlta_Click" Text="ALTA" Width="154px" />
                    </td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="3">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hlVolver" runat="server" NavigateUrl="~/Default.aspx">VOLVER</asp:HyperLink>
    </form>
</body>
</html>
