using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EC;
using Logica;

public partial class AltaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";

        if (!IsPostBack)
        {
            LimpioFormulario();
        }
    }

    private void LimpioFormulario()
    {
        
        txtNomCompleto.Text = "";
        txtMail.Text = "";
        txtFecha.Text = "";
        txtContra.Text = "";
        
        txtNomCompleto.Enabled = true;
        txtMail.Enabled = true;
        txtFecha.Enabled = true;
        txtContra.Enabled = true;

    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpioFormulario();
    }

    

    protected void btnAlta_Click(object sender, EventArgs e)
    {
        try
        {
            string nomUsuario = (string)txtNomUsuario.Text.Trim();
            string nomCompleto = (string)txtNomCompleto.Text.Trim();
            string mail = (string)txtMail.Text.Trim();
            string contra = (string)txtContra.Text.Trim();
            DateTime fecha = DateTime.Parse(txtFecha.Text.Trim());

            Usuario unUsu = new Usuario(nomUsuario, mail, nomCompleto, contra, fecha);

            FabricaLogica.GetLogicaUsuario().AltaUsuario(unUsu);

            LimpioFormulario();
        }
        catch (Exception ex)
        {
            lblError.ForeColor = System.Drawing.Color.Red;
            lblError.Text = ex.Message;
        }
    }

    
}