using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuRopaPR.TuRopaCN;

namespace TuRopaPR
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {

            string usuario = txtUsuario.Text.Trim();
            string clave = txtClave.Text.Trim();

            DonadorCN personaCN = new DonadorCN();
            DataTable dt = personaCN.ValidarLogin(usuario, clave);

            if (dt.Rows.Count > 0)
            {
                // Guardar nombre y rol en sesión
                Session["usuario"] = dt.Rows[0]["Nombres"].ToString();
                Session["rol"] = dt.Rows[0]["id_rol"].ToString();
                Session["Id_persona"] = dt.Rows[0]["Id_persona"].ToString();

                // Obtener rol para decidir a qué página redirigir
                string rol = dt.Rows[0]["id_rol"].ToString();
                
                if (rol == "2")
                {
                    Response.Redirect("Principal.aspx");
                }
                else if (rol == "1" || rol == "3")
                {
                    Response.Redirect("PrincipalAdmi.aspx");
                }
                else
                {
                    // Opcional: manejar rol desconocido
                    string script = "alert('Rol de usuario no permitido.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "alerta", script, true);
                }
            }
            else
            {
                string script = "alert('Usuario o contraseña incorrectos.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alerta", script, true);
            }
        }

    }
}