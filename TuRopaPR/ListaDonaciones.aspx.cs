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
    public partial class ListaDonaciones : System.Web.UI.Page
    {
        private AdminCN adminCN = new AdminCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDonaciones();
        }

        private void CargarDonaciones()
        {
            try
            {
                DataTable dt = adminCN.listarDonaciones(); // Aunque el método se llame ValidarLogin, internamente llama listarDonaodres()
                gvDonaciones.DataSource = dt;
                gvDonaciones.DataBind();
            }
            catch (Exception ex)
            {
                // Podrías mostrar un mensaje o loguear el error
                Response.Write("<script>alert('Error al cargar los donadores: " + ex.Message + "');</script>");
            }
        }

        protected void btnUbicacion_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string coordenadas = btn.CommandArgument;

            // Verifica que las coordenadas estén en formato válido
            if (!string.IsNullOrEmpty(coordenadas))
            {
                string url = "https://www.google.com/maps?q=" + coordenadas;
                Response.Redirect(url, false); // false para evitar ThreadAbortException
            }
        }

    }
}