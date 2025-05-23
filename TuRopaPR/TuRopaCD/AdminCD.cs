using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TuRopaPR.TuRopaCD
{
    public class AdminCD
    {

        public DataTable listarDonaodres()
        {
            SqlConnection cn = ConexionCD.getInstance().conection();
            SqlCommand cmd = new SqlCommand("SP_ListarDonadoresConCantidad", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            try
            {
                cn.Open();
                da.Fill(dt);
            }
            finally
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }

            return dt;
        }
        public DataTable listarDonaciones()
        {
            SqlConnection cn = ConexionCD.getInstance().conection();
            SqlCommand cmd = new SqlCommand("SP_ListarDonadciones", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            try
            {
                cn.Open();
                da.Fill(dt);
            }
            finally
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }

            return dt;
        }

    }
}