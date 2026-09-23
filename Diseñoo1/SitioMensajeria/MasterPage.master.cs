using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EC;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string nomUsu;
            Usuario unUsu;


            if (Session["Usuario"] != null)
            {
                unUsu = (Usuario)Session["Usuario"];
                nomUsu = unUsu.NomUsuario;

                MenuItem usuarioItem = new MenuItem("|| Usuario: " + nomUsu + "|| ");

                Menu1.Items.AddAt(1, usuarioItem);
            }


        }
    }
}
