using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuRopaPR.TuRopaCN;

namespace TuRopaPR
{
    public partial class PerfilUsuario : System.Web.UI.Page
    {
        DonadorCN donadorLN = new DonadorCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["usuario"] == null || Session["Id_persona"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                CargarDatosPerfil();
            }

        }

        private void CargarDatosPerfil()
        {
            string usuario = Session["Id_persona"].ToString();
            DataTable dt = donadorLN.ObtenerPerfilUsuario(usuario);

            if (dt.Rows.Count > 0)
            {
                DataRow fila = dt.Rows[0];

                txtDocP.Text = fila["doc_per"].ToString();
                txtTipoDocu.Text = fila["tipo_docu"].ToString();
                txtNombres.Text = fila["Nombres"].ToString();
                txtApellidos.Text = fila["Apellidos"].ToString();
                txtCorreo.Text = fila["Correo"].ToString();
                txtTelefono.Text = fila["numer_tele"].ToString();
                txtFechaNaci.Text = Convert.ToDateTime(fila["fecha_naci"]).ToString("yyyy-MM-dd");
                txtContrasenia.Text= fila["contrasenia"].ToString();
            }
            else
            {
                lblMensaje.Text = "No se encontraron datos del perfil.";
                lblMensaje.CssClass = "error";
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string usuario = Session["Id_persona"].ToString();

            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string contrasenia = txtContrasenia.Text.Trim();
            DateTime fechaNaci;

            if (!DateTime.TryParse(txtFechaNaci.Text, out fechaNaci))
            {
                lblMensaje.Text = "La fecha de nacimiento no es válida.";
                lblMensaje.CssClass = "error";
                return;
            }

          

            string mensaje = donadorLN.ActualizarPerfilUsuario(
                usuario, nombres, apellidos, correo, telefono, fechaNaci, contrasenia);

            if (mensaje == "OK")
            {
                CargarDatosPerfil();
                string script = "alert('Datos correctamente Actualizados.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alerta", script, true);
                Response.Redirect("Principal.aspx");
            }
            else
            {
                lblMensaje.Text = mensaje;
                lblMensaje.CssClass = "error";
            }
        }

    }
}