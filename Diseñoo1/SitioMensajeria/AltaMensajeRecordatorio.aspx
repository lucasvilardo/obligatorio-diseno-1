<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaMensajeRecordatorio.aspx.cs" Inherits="AltaMensajeRecordatorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


         .auto-style10 {
             width: 80%;
             height: 61px;
             margin-left: 210px;
         }
         .auto-style12 {
             height: 54px;
         }
         .auto-style14 {
            height: 174px;
        }
        .auto-style16 {
            height: 42px;
            width: 374px;
        }
        .auto-style15 {
            height: 42px;
            width: 780px;
        }
        .auto-style17 {
            height: 54px;
            width: 342px;
        }
        .auto-style18 {
            height: 174px;
            width: 342px;
        }
        .auto-style19 {
            height: 42px;
            width: 342px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        ALTA MENSAJE DE RECORDATORIO</p>
            <table border="2" class="auto-style10" style="text-align:center">
                <tr>
                    <td class="auto-style12" colspan="2">TEXTO:</td>
                    <td class="auto-style17">ASUNTO:</td>
                </tr>
                <tr>
                    <td class="auto-style14" colspan="2">
                        <asp:TextBox ID="txtTexto" runat="server" Width="650px" Height="142px"></asp:TextBox>
                    </td>
                    <td class="auto-style18">
                        &nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="txtAsunto" runat="server" Width="152px" Height="99px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">
                        Tipo de Recordatorio:
                        <asp:DropDownList ID="ddlTipoRecorda" runat="server" Width="119px">
                            <asp:ListItem>-- Seleccione una opción -- </asp:ListItem>
                            <asp:ListItem>Laboral</asp:ListItem>
                            <asp:ListItem>Estudio</asp:ListItem>
                            <asp:ListItem>Personal</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">
                        Conjunto de Usuarios que envía:&nbsp;&nbsp; &nbsp; <asp:TextBox ID="txtUsuariosEnvia" runat="server" Width="120px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" Text="Agregar" Width="99px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ListBox ID="lbUsuariosEnvia" runat="server" Height="72px" Width="130px"></asp:ListBox>
                    </td>
                    <td class="auto-style19">
                        &nbsp;<asp:Button ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" Width="177px" Height="31px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="3">
                        <asp:Button ID="btnAlta" runat="server" OnClick="btnAlta_Click" Text="ALTA DE MENSAJE COMÚN" Width="583px" Height="30px" />
                        <br />
                        <br />
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Content>

