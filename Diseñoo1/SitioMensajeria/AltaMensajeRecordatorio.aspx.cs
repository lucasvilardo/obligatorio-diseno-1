using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EC;

public partial class AltaMensajeRecordatorio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        List<Usuario> _lista = new List<Usuario>();
        Usuario unUsu;


        try
        {
            foreach (ListItem lugar in lbUsuariosEnvia.Items)
            {
                unUsu = Logica.FabricaLogica.GetLogicaUsuario().Buscar(lugar.Text.Trim());

                _lista.Add(unUsu);
            }

            string tipoRecorda = ddlTipoRecorda.SelectedValue;

            string asunto = txtAsunto.Text;
            string texto = txtTexto.Text;
            Usuario unUsua = (Usuario)Session["Usuario"];



            EC.MRecordatorio unMenR = new MRecordatorio(asunto, texto, 0, DateTime.Now, unUsua, _lista, tipoRecorda);

            Logica.FabricaLogica.GetLogicaMensaje().AltaMensaje(unMenR);

            lblError.Text = "Mensaje dado de alta con éxito!";
        }
        catch (Exception ex)
        {

            lblError.Text = ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }

    public void LimpioFormulario()
    {
        txtAsunto.Text = "";
        txtTexto.Text = "";
        txtUsuariosEnvia.Text = "";
        ddlTipoRecorda.SelectedValue = ddlTipoRecorda.Items[0].Text;
        txtUsuariosEnvia.Text = "";
        lbUsuariosEnvia.Items.Clear();
    }


    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        if (txtUsuariosEnvia.Text.Trim().Length > 0)
        {
            lbUsuariosEnvia.Items.Add(txtUsuariosEnvia.Text.Trim());
            txtUsuariosEnvia.Text = "";
            lblError.Text = "Se agregó correctamente a la lista.";
        }
        else
        {
            lblError.Text = "No hay usuario ingresado.";
        }
    }
}