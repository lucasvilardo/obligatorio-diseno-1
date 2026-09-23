using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BandejaDeSalida : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Usuario"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }

        if (!IsPostBack)
        {
            try
            {
                EC.Usuario unUsu = (EC.Usuario)Session["Usuario"];
                List<EC.Mensaje> listaTotal = Logica.FabricaLogica.GetLogicaMensaje().ListadoBandejaSal(unUsu);
                Session["ListaTotal"] = listaTotal;

                if (listaTotal.Count > 0)
                {
                    gvEntrada.DataSource = null;
                    gvEntrada.DataSource = (from m in listaTotal
                                            orderby m.FyhEnvio descending
                                            select new
                                            {
                                                m.NumIdenti,
                                                m.FyhEnvio,
                                                m.Asunto,
                                                Remitente = m.UnUsuario.NomUsuario
                                            }).ToList();
                    gvEntrada.DataBind();
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }

    protected void GrillaVentasdArticulo_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {
            int indice = gvEntrada.SelectedIndex;
            int numSeleccionado = Convert.ToInt32(gvEntrada.DataKeys[indice].Value);

            List<EC.Mensaje> lista = (List<EC.Mensaje>)Session["ListaTotal"];
            EC.Mensaje mensajeSel = null;

            foreach (EC.Mensaje m in lista)
            {
                if (m.NumIdenti == numSeleccionado)
                {
                    mensajeSel = m;
                    break;
                }
            }

            if (mensajeSel == null)
                throw new Exception("No se encontró el mensaje.");

            lbMensaje.Items.Clear();


            lbMensaje.Items.Add("Texto: " + mensajeSel.Texto);
            lbMensaje.Items.Add("Asunto: " + mensajeSel.Asunto);
            lbMensaje.Items.Add("Fecha y Hora: " + mensajeSel.FyhEnvio);
            lbMensaje.Items.Add("Numero de identidad: " + mensajeSel.NumIdenti);
            lbMensaje.Items.Add("Usuario que envía: " + mensajeSel.UnUsuario.NomUsuario);


            foreach (EC.Usuario usu in mensajeSel.ColUsu)
            {
                lbMensaje.Items.Add("Usuario que Recibe: " + usu.NomUsuario);
            }

            string tipo = mensajeSel.GetType().Name;
            lbMensaje.Items.Add("Tipo: " + tipo);

            if (mensajeSel is EC.MComun)
            {
                EC.MComun mComun = (EC.MComun)mensajeSel;
                lbMensaje.Items.Add("Categoría: " + mComun.UnaCate.NomCat);
                lbMensaje.Items.Add("Codigo de Categoría: " + mComun.UnaCate.CodCat);
            }
            else if (mensajeSel is EC.MPrivado)
            {
                EC.MPrivado mPriv = (EC.MPrivado)mensajeSel;
                lbMensaje.Items.Add("Fecha de Caducidad: " + (mPriv.FechaCaducidad));
            }
            else if (mensajeSel is EC.MRecordatorio)
            {
                EC.MRecordatorio mRec = (EC.MRecordatorio)mensajeSel;
                lbMensaje.Items.Add("Tipo recordatorio: " + mRec.TipoRecordatorio);
            }
        }
        catch (Exception ex)
        {

            lblError.Text = ex.Message;
        }
    }



    protected void btnFiltrar0_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime paraFecha = Convert.ToDateTime(txtFecha.Text).Date;

            EC.Usuario unUsu = (EC.Usuario)Session["Usuario"];
            List<EC.Mensaje> listaTotal = Logica.FabricaLogica.GetLogicaMensaje().ListadoBandejaSal(unUsu);
            Session["ListaTotal"] = listaTotal;

            EC.Usuario unUsua = (EC.Usuario)Session["Usuario"];
            List<EC.Mensaje> resultado = (from unMen in listaTotal
                                          orderby unMen.FyhEnvio descending
                                          where unMen.FyhEnvio.Date == paraFecha
                                          select unMen).ToList();

            if (resultado.Count == 0)
            {
                lblError.Text = "No hay mensajes con esa fecha";
            }

            gvEntrada.DataSource = (from m in resultado
                                    orderby m.FyhEnvio descending
                                    select new
                                    {
                                        m.NumIdenti,
                                        m.FyhEnvio,
                                        m.Asunto,
                                        Remitente = m.UnUsuario.NomUsuario
                                    }).ToList();

            gvEntrada.DataBind();
        }
        catch (Exception ex)
        {

            lblError.Text = "Error: " + ex.Message;
        }
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        txtFecha.Text = "";
        txtRemite.Text = "";
        DropDownList1.SelectedIndex = 0;

        try
        {
            EC.Usuario unUsu = (EC.Usuario)Session["Usuario"];
            List<EC.Mensaje> listaTotal = Logica.FabricaLogica.GetLogicaMensaje().ListadoBandejaSal(unUsu);
            Session["ListaTotal"] = listaTotal;

            if (listaTotal.Count > 0)
            {
                gvEntrada.DataSource = null;
                gvEntrada.DataSource = (from m in listaTotal
                                        orderby m.FyhEnvio descending
                                        select new
                                        {
                                            m.NumIdenti,
                                            m.FyhEnvio,
                                            m.Asunto,
                                            Remitente = m.UnUsuario.NomUsuario
                                        }).ToList();
                gvEntrada.DataBind();
            }

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

    }

    protected void btnFiltrar_Click(object sender, EventArgs e)
    {
        try
        {
            string usuRemite = txtRemite.Text.Trim().ToLower();
            EC.Usuario unUsu = (EC.Usuario)Session["Usuario"];
            List<EC.Mensaje> listaTotal = Logica.FabricaLogica.GetLogicaMensaje().ListadoBandejaSal(unUsu);
            Session["ListaTotal"] = listaTotal;


            List<EC.Mensaje> resultado = (from unMen in listaTotal where unMen.UnUsuario.NomUsuario.ToLower() == usuRemite select unMen).ToList();

            if (resultado.Count == 0)
            {
                lblError.Text = "No hay mensajes con esa fecha";
            }

            gvEntrada.DataSource = (from m in resultado
                                    orderby m.FyhEnvio descending
                                    select new
                                    {
                                        m.NumIdenti,
                                        m.FyhEnvio,
                                        m.Asunto,
                                        Remitente = m.UnUsuario.NomUsuario
                                    }).ToList();

            gvEntrada.DataBind();
        }
        catch (Exception ex)
        {
            lblError.Text = "Error: " + ex.Message;
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string tipoSeleccionado = DropDownList1.SelectedValue;

            List<EC.Mensaje> listaTotal = Session["ListaTotal"] as List<EC.Mensaje>;

            if (tipoSeleccionado == "Comun")
            {
                List<EC.MComun> resultado = (from m in listaTotal.OfType<EC.MComun>()
                                             select m).ToList();
                gvEntrada.DataSource = (from m in resultado
                                        orderby m.FyhEnvio descending
                                        select new
                                        {
                                            m.NumIdenti,
                                            m.FyhEnvio,
                                            m.Asunto,
                                            Remitente = m.UnUsuario.NomUsuario
                                        }).ToList();

                gvEntrada.DataBind();
            }
            else if (tipoSeleccionado == "Privado")
            {
                List<EC.MPrivado> resultado = (from m in listaTotal.OfType<EC.MPrivado>()
                                               select m).ToList();
                gvEntrada.DataSource = (from m in resultado
                                        orderby m.FyhEnvio descending
                                        select new
                                        {
                                            m.NumIdenti,
                                            m.FyhEnvio,
                                            m.Asunto,
                                            Remitente = m.UnUsuario.NomUsuario
                                        }).ToList();

                gvEntrada.DataBind();
            }
            else if (tipoSeleccionado == "Recordatorio")
            {
                List<EC.MRecordatorio> resultado = (from m in listaTotal.OfType<EC.MRecordatorio>()
                                                    select m).ToList();
                gvEntrada.DataSource = (from m in resultado
                                        orderby m.FyhEnvio descending
                                        select new
                                        {
                                            m.NumIdenti,
                                            m.FyhEnvio,
                                            m.Asunto,
                                            Remitente = m.UnUsuario.NomUsuario
                                        }).ToList();

                gvEntrada.DataBind();
            }


        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message;
        }

    }
}