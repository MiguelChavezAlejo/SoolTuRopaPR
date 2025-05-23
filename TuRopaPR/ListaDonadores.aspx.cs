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
    public partial class ListaDonadores : System.Web.UI.Page
    {
        private AdminCN adminCN = new AdminCN();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDonadores();
        }
        private void CargarDonadores()
        {
            try
            {
                DataTable dt = adminCN.listarDonaodres(); // Aunque el método se llame ValidarLogin, internamente llama listarDonaodres()
                gvDonadores.DataSource = dt;
                gvDonadores.DataBind();
            }
            catch (Exception ex)
            {
                // Podrías mostrar un mensaje o loguear el error
                Response.Write("<script>alert('Error al cargar los donadores: " + ex.Message + "');</script>");
            }
        }

    }
}