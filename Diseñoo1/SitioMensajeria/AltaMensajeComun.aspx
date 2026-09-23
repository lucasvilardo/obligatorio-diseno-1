<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AltaMensajeComun.aspx.cs" Inherits="AltaMensajeComun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">


         .auto-style10 {
             width: 60%;
             height: 61px;
             margin-left: 210px;
         }
         .auto-style12 {
             height: 54px;
         }
         .auto-style14 {
            height: 174px;
        }
        .auto-style15 {
            height: 42px;
            width: 814px;
        }
        .auto-style16 {
            height: 42px;
            width: 243px;
        }
        .auto-style17 {
            height: 54px;
            width: 478px;
        }
        .auto-style18 {
            height: 174px;
            width: 478px;
        }
        .auto-style19 {
            height: 42px;
            width: 478px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        ALTA DE MENSAJE COMÚN</p>
    <p>
        &nbsp;</p>
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
                        Categoria:
                        <asp:DropDownList ID="ddlCategorias" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style15">
                        Conjunto de Usuarios que envía:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="txtUsuariosEnvia" runat="server" Width="120px"></asp:TextBox>
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

