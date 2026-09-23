using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EC;

public partial class AltaMensajeComun : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }

        if (!IsPostBack)
        {
            List<Categoria> categorias =
        Logica.FabricaLogica.GetLogicaCategoria().ListarCategorias();

           
            ddlCategorias.DataSource = categorias;
            ddlCategorias.DataTextField = "NomCat"; 
            ddlCategorias.DataValueField = "CodCat";  

          
            ddlCategorias.DataBind();

           
            ddlCategorias.Items.Insert(0, new ListItem("-- Seleccione categoría --", ""));
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
        lbUsuariosEnvia.Items.Clear();
        txtUsuariosEnvia.Text = "";
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

            string codCat = ddlCategorias.SelectedValue;
            Categoria cate = Logica.FabricaLogica.GetLogicaCategoria().Buscar(codCat);

            string asunto = txtAsunto.Text;
            string texto = txtTexto.Text;
            Usuario unUsua = (Usuario)Session["Usuario"];

           

            EC.MComun unMenC = new MComun(asunto, texto, 0, DateTime.Now, unUsua, _lista, cate);

            Logica.FabricaLogica.GetLogicaMensaje().AltaMensaje(unMenC);

            lblError.Text = "Mensaje dado de alta con éxito!";
        }
        catch (Exception ex)
        {

            lblError.Text = ex.Message;
        }
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