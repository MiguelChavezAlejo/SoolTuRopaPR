using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TuRopaPR.TuRopaCD
{
    public class ConexionCD
    {
        #region "PATRÓN SINGLETON"
        private static ConexionCD instancia = null;
        private ConexionCD() { }

        public static ConexionCD getInstance()
        {
            if (instancia == null)
            {
                instancia = new ConexionCD();
            }
            return instancia;
        }
        #endregion

        //Conexión a base de datos principal
        public SqlConnection conection()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = GetConnectionString();
            return conexion;
        }

        private string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        }
    }
}