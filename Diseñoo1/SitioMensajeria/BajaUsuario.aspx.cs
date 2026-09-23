using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BajaUsuario : System.Web.UI.Page
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
            EC.Usuario unUsuario = (EC.Usuario)Session["Usuario"];
            Logica.FabricaLogica.GetLogicaUsuario().BajaUsuario(unUsuario);

            lblError.Text = "Baja con Éxito";

            Session["Usuario"] = null;
        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }
    }
}