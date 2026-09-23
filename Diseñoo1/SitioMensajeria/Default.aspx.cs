using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

        if (!IsPostBack)
        {
            Session.Clear();

          
            int resul = (from unUsu in Logica.FabricaLogica.GetLogicaUsuario().ListadoUsuariosAct()select unUsu).Count();
            Label1.Text = "CANTIDAD DE USUARIOS ACTIVOS: " + resul;

            var _listaMens = Logica.FabricaLogica.GetLogicaMensaje().ListarTodos();

            var resulta = from Mensaje in _listaMens group Mensaje by Mensaje.GetType().Name into grupo select new { Tipo = grupo.Key, Cantidad = grupo.Count() };

            ArrayList resultadoFinal = new ArrayList();

            foreach (var item in resulta)
                switch (item.Tipo)
                {
                    case "MComun":
                        Label2.Text = "CANTIDAD DE MENSAJES COMUNES: " + item.Cantidad;
                        break;

                    case "MPrivado":
                        Label3.Text = "CANTIDAD DE MENSAJES PRIVADOS: " + item.Cantidad;
                        break;

                    case "MRecordatorio":
                        Label4.Text = "CANTIDAD DE MENSAJES RECORDATORIO: " + item.Cantidad;
                        break;
                }


            List<EC.Categoria> categorias =
            Logica.FabricaLogica.GetLogicaCategoria().ListarCategorias();

            ddlCate.DataSource = categorias;
            ddlCate.DataTextField = "NomCat";
            ddlCate.DataValueField = "CodCat";
            ddlCate.DataBind();
            ddlCate.Items.Insert(0, new ListItem("-- Seleccione categoría --", ""));

        }
    }



    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        try
        {
            string _Usu = Logueo.UserName.Trim();
            string _Contra = Logueo.Password.Trim();
            EC.Usuario unUsu = Logica.FabricaLogica.GetLogicaUsuario().Logueo(_Usu, _Contra);

            if (unUsu == null)
            {
                LblError.Text = "Usuario o contraseña inválidos.";
                LblError.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Session["Usuario"] = unUsu;
                Response.Redirect("~/PaginaInicio.aspx");
            }
        }
        catch (Exception ex)
        {

            LblError.Text = ex.Message;
        }
    }

    protected void ddlCate_SelectedIndexChanged(object sender, EventArgs e)
    {
        string codCat = ddlCate.SelectedValue;
        Object resultado = (from unM in Logica.FabricaLogica.GetLogicaMensaje().ListarTodos().OfType<EC.MComun>() where unM.UnaCate.CodCat == codCat select unM).Count();

        Label5.Text = "Son: " + resultado + " mensajes para la Categoria: " + ddlCate.SelectedItem;
    }
}