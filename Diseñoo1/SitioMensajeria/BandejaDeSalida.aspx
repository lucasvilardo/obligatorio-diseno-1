<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BandejaDeSalida.aspx.cs" Inherits="BandejaDeSalida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style7 {
            height: 86px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        BANDEJA DE SALIDA</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;
        <asp:GridView ID="gvEntrada" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="grid" DataKeyNames="NumIdenti" GridLines="Vertical" Height="129px" OnSelectedIndexChanged="GrillaVentasdArticulo_SelectedIndexChanged" Width="496px">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="FyhEnvio" HeaderText="Fecha" />
        <asp:BoundField DataField="Asunto" HeaderText="Asunto" />
        <asp:BoundField DataField="Remitente" HeaderText="Remitente" />
        <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        Mensaje Completo:&nbsp;&nbsp;&nbsp;
        <asp:ListBox ID="lbMensaje" runat="server" Height="97px" Width="510px"></asp:ListBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblError" runat="server"></asp:Label>
    </p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p class="auto-style7">
        FILTRAR GRILLA POR: Tipo de Mensaje:&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Height="20px" Width="122px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Seleccione un Tipo de Mensaje</asp:ListItem>
            <asp:ListItem>Comun</asp:ListItem>
            <asp:ListItem>Privado</asp:ListItem>
            <asp:ListItem>Recordatorio</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp; Por fecha de Recepcion:&nbsp;&nbsp;
        <asp:TextBox ID="txtFecha" runat="server" Width="98px" TextMode="Date" ></asp:TextBox>
&nbsp;&nbsp;&nbsp;<asp:Button ID="btnFiltrar0" runat="server" Text="FILTRAR" Width="154px" OnClick="btnFiltrar0_Click" />
        &nbsp; Por Usuario Remitente:&nbsp;&nbsp;
        <asp:TextBox ID="txtRemite" runat="server" Width="98px"></asp:TextBox>
&nbsp;
        <asp:Button ID="btnFiltrar" runat="server" Text="FILTRAR" Width="154px" OnClick="btnFiltrar_Click" />
    &nbsp;&nbsp;
        <asp:Button ID="btnLimpiar" runat="server" Text="LIMPIAR FILTROS" OnClick="btnLimpiar_Click" />
    </p>
    <p class="auto-style7">
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>

