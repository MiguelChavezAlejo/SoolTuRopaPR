using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace TuRopaPR.TuRopaCD
{
    public class DonadorCD
    {
        public DataTable ValidarLogin(string usuario, string contrasenia)
        {
            SqlConnection cn = ConexionCD.getInstance().conection();
            SqlCommand cmd = new SqlCommand("SP_ValidarLogin", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Usuario", usuario);
            cmd.Parameters.AddWithValue("@Contrasenia", contrasenia);

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

        public string RegistrarUsuario(
            string doc, string tipoDoc, string nombres, string apellidos,
            string correo, string telefono, DateTime fechaNaci, // ← agregado aquí
            string usuario, string contrasenia, int idRol)
        {
            SqlConnection cn = ConexionCD.getInstance().conection();
            SqlCommand cmd = new SqlCommand("SP_RegistrarUsuario", cn); // Asegúrate que coincida con el nombre real del SP
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@doc_per", doc);
            cmd.Parameters.AddWithValue("@tipo_docu", tipoDoc);
            cmd.Parameters.AddWithValue("@Nombres", nombres);
            cmd.Parameters.AddWithValue("@Apellidos", apellidos);
            cmd.Parameters.AddWithValue("@Correo", correo);
            cmd.Parameters.AddWithValue("@numer_tele", telefono);
            cmd.Parameters.AddWithValue("@fecha_naci", fechaNaci); // ← nuevo parámetro
            cmd.Parameters.AddWithValue("@usuario", usuario);
            cmd.Parameters.AddWithValue("@contrasenia", contrasenia);
            cmd.Parameters.AddWithValue("@Id_Rol", idRol);

            try
            {
                cn.Open();
                cmd.ExecuteNonQuery();
                return "OK";
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
            finally
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
        }

    }

}