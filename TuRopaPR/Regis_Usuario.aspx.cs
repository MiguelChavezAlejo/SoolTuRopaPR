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
            // Capturamos los valores del formulario
            string nombres = Request.Form["nombres"];
            string apellidos = Request.Form["apellidos"];
            string tipoDoc = Request.Form["tipoDocumento"];
            string nroDoc = Request.Form["numeroDocumento"];
            string correo = Request.Form["correo"];
            string telefono = Request.Form["telefono"];
            string fechaNaciStr = Request.Form["fechaNacimiento"];
            DateTime fechaNaci = DateTime.Parse(fechaNaciStr); // Mejor con TryParse para robustez

            string usuario = nroDoc; // Usamos el DNI como usuario
            string contrasenia = "123456"; // Contraseña por defecto o generada
            int idRol = 2; // Donador

            DonadorCN negocio = new DonadorCN();
            string resultado = negocio.RegistrarUsuario(
                nroDoc, tipoDoc, nombres, apellidos, correo, telefono, fechaNaci, usuario, contrasenia, idRol);

            if (resultado == "OK")
            {
                string mensaje = "¡Registro exitoso! Tu usuario es tu DNI y tu contraseña es 123456.";
                string script = $"alert('{mensaje}'); window.location='Login.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
            else
            {
                // Mostrar el error al usuario
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{resultado}');", true);
            }
        }
    }
}