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
            SqlCommand cmd = new SqlCommand("SP_RegistrarDonador", cn); // Asegúrate que coincida con el nombre real del SP
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

        public string RegistrarDonacion(
        int idPersona,
        string direccion,
        string coordenadas,
        int cantidad,
        DateTime fechaDona,
        string tipoRopa,
        string estadoRopa,
        byte[] imagen1,
        byte[] imagen2,
        byte[] imagen3)
        {
            SqlConnection cn = ConexionCD.getInstance().conection();
            SqlCommand cmd = new SqlCommand("sp_RegistrarDonacion", cn); // Nombre exacto del SP
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id_persona", idPersona);
            cmd.Parameters.AddWithValue("@direccion", direccion);
            cmd.Parameters.AddWithValue("@cordenadas", coordenadas);
            cmd.Parameters.AddWithValue("@cantidad", cantidad);
            cmd.Parameters.AddWithValue("@Fecha_Dona", fechaDona);
            cmd.Parameters.AddWithValue("@tipo_ropa", tipoRopa);
            cmd.Parameters.AddWithValue("@estado_ropa", estadoRopa);

            cmd.Parameters.Add("@Imagen1", SqlDbType.VarBinary).Value = (object)imagen1 ?? DBNull.Value;
            cmd.Parameters.Add("@Imagen2", SqlDbType.VarBinary).Value = (object)imagen2 ?? DBNull.Value;
            cmd.Parameters.Add("@Imagen3", SqlDbType.VarBinary).Value = (object)imagen3 ?? DBNull.Value;

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


        public DataTable ObtenerPerfilUsuario(string usuario)
        {
            DataTable dt = new DataTable();

            SqlConnection cn = ConexionCD.getInstance().conection();
            SqlCommand cmd = new SqlCommand("sp_ObtenerPerfilUsuarioRestringido", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id_persona", usuario);

            try
            {
                cn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            catch (SqlException ex)
            {
                // Manejar error o lanzar excepción según convenga
                throw new Exception(ex.Message);
            }
            finally
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }

            return dt;
        }

        public string ActualizarPerfilUsuario(
        string usuario,
        string nombres,
        string apellidos,
        string correo,
        string telefono,
        DateTime fechaNaci,
        string contrasenia)
        {
            SqlConnection cn = ConexionCD.getInstance().conection();
            SqlCommand cmd = new SqlCommand("sp_ActualizarPerfilUsuarioRestringido", cn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Id_persona", usuario);
            cmd.Parameters.AddWithValue("@Nombres", nombres);
            cmd.Parameters.AddWithValue("@Apellidos", apellidos);
            cmd.Parameters.AddWithValue("@Correo", correo);
            cmd.Parameters.AddWithValue("@numer_tele", telefono);
            cmd.Parameters.AddWithValue("@fecha_naci", fechaNaci);
            cmd.Parameters.AddWithValue("@contrasenia", contrasenia);

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