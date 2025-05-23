using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuRopaPR.TuRopaCN;

namespace TuRopaPR
{
    public partial class Reg_Donaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUbicacion.Attributes.Add("readonly", "readonly");
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                DonadorCN donador=new DonadorCN();
                // Suponiendo que obtienes el ID de persona desde sesión (ajústalo si no usas sesión)
                int idPersona = Convert.ToInt32(Session["Id_persona"]);
                string direccion = txtDireccion.Text.Trim();
                string coordenadas = txtUbicacion.Text.Trim();
                int cantidad = int.Parse(txtCantidad.Text);
                DateTime fechaDona = DateTime.Parse(txtFecha.Text);
                string tipoRopa = txtTipoRopa.Text.Trim();
                string estadoRopa = txtEstadoRopa.Text.Trim();

                byte[] imagen1 = ObtenerBytesImagen(fuImagen1);
                byte[] imagen2 = ObtenerBytesImagen(fuImagen2);
                byte[] imagen3 = ObtenerBytesImagen(fuImagen3);

                // Llamar a la capa de negocio
                string resultado = donador.RegistrarDonacion(
                    idPersona, direccion,coordenadas, cantidad, fechaDona,
                    tipoRopa, estadoRopa, imagen1, imagen2, imagen3
                );

                if (resultado == "OK")
                {
                    lblMensaje.CssClass = "success";
                    lblMensaje.Text = "Donación registrada exitosamente.";
                    LimpiarFormulario();
                    Response.Redirect("Principal.aspx");
                }
                else
                {
                    lblMensaje.CssClass = "error";
                    lblMensaje.Text = "Error: " + resultado;
                }
            }
            catch (Exception ex)
            {
                lblMensaje.CssClass = "error";
                lblMensaje.Text = "Excepción: " + ex.Message;
            }
        }

        private byte[] ObtenerBytesImagen(FileUpload fileUpload)
        {
            if (fileUpload.HasFile)
            {
                using (BinaryReader reader = new BinaryReader(fileUpload.PostedFile.InputStream))
                {
                    return reader.ReadBytes(fileUpload.PostedFile.ContentLength);
                }
            }
            return null;
        }

        private void LimpiarFormulario()
        {
            txtDireccion.Text = "";
            txtUbicacion.Text = "";
            txtCantidad.Text = "";
            txtFecha.Text = "";
            txtTipoRopa.Text = "";
            txtEstadoRopa.Text = "";
        }
    }
}