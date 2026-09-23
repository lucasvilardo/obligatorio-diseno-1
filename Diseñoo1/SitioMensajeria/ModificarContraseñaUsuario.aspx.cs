using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModificarContraseñaUsuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }



    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        try
        {
            EC.Usuario unUsu = (EC.Usuario)Session["Usuario"];


            string contraActual = txtContraActual.Text.Trim();
            string contraNueva = txtContraNueva.Text.Trim();
            string contraNueva2 = txtContraNueva2.Text.Trim();

            if (contraNueva != contraNueva2)
            {
                lblError.Text = "Las nuevas contraseñas deben coincidir.";
            }
            if (contraActual != unUsu.Contraseña)
            {
                lblError.Text = "La contraseña actual no coincide con la del Usuario";
            }

            EC.Usuario unUsuTemp = new EC.Usuario(unUsu.NomUsuario, unUsu.Mail, unUsu.NomCompleto, contraNueva, unUsu.FechaNacimiento);
            
            Logica.FabricaLogica.GetLogicaUsuario().ModificarContra(unUsuTemp);

            unUsu.Contraseña = contraNueva;
            Session["Usuario"] = unUsu;
            lblError.Text = "Modificación exitosa.";
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}