using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuRopaPR.TuRopaCN;

namespace TuRopaPR
{
    public partial class Regis_Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string tipoDoc = ddlTipoDocumento.SelectedValue;
            string nroDoc = txtNumeroDocumento.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string fechaNaciStr = txtFechaNacimiento.Text;

            DateTime fechaNaci;
            if (!DateTime.TryParse(fechaNaciStr, out fechaNaci))
            {
                // Mostrar error
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Fecha de nacimiento inválida');", true);
                return;
            }

            string usuario = nroDoc;
            string contrasenia = "123456";
            int idRol = 2;

            DonadorCN negocio = new DonadorCN();
            string resultado = negocio.RegistrarUsuario(nroDoc, tipoDoc, nombres, apellidos, correo, telefono, fechaNaci, usuario, contrasenia, idRol);

            if (resultado == "OK")
            {
                string mensaje = "¡Registro exitoso! Tu usuario es tu DNI y tu contraseña es 123456.";
                string script = $"alert('{mensaje}'); window.location='Login.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{resultado}');", true);
            }
        }

    }
}