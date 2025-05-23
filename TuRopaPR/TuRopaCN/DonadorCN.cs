using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using TuRopaPR.TuRopaCD;

namespace TuRopaPR.TuRopaCN
{
    public class DonadorCN
    {
        private DonadorCD donadorCD = new DonadorCD();

        public DataTable ValidarLogin(string usuario, string contrasenia)
        {
            return donadorCD.ValidarLogin(usuario, contrasenia);
        }

        public string RegistrarUsuario(
       string doc, string tipoDoc, string nombres, string apellidos,
       string correo, string telefono, DateTime fechaNaci, // ← agregado
       string usuario, string contrasenia, int idRol)
        {
            // Lógica de validación
            if (string.IsNullOrWhiteSpace(doc) || doc.Length < 8)
                return "Documento inválido.";

            if (string.IsNullOrWhiteSpace(nombres) || string.IsNullOrWhiteSpace(apellidos))
                return "Debe ingresar nombres y apellidos.";

            if (!correo.Contains("@"))
                return "Correo inválido.";

            if (fechaNaci > DateTime.Today)
                return "La fecha de nacimiento no puede ser en el futuro.";

            // Llamar al DAO
            return donadorCD.RegistrarUsuario(doc, tipoDoc, nombres, apellidos, correo, telefono, fechaNaci, usuario, contrasenia, idRol);
        }


    }
}