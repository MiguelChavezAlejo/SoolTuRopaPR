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

        private DonadorCD donacionCD = new DonadorCD();

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
            // Validaciones básicas
            if (idPersona <= 0)
                return "ID de persona inválido.";

            if (string.IsNullOrWhiteSpace(direccion))
                return "Debe ingresar una dirección.";

            if (cantidad <= 0)
                return "La cantidad debe ser mayor que cero.";

            if (fechaDona <= DateTime.Now)
                return "La fecha de donación no puede ser en el Pasado o para hoy.";

            if (string.IsNullOrWhiteSpace(tipoRopa))
                return "Debe ingresar el tipo de ropa.";

            if (string.IsNullOrWhiteSpace(estadoRopa))
                return "Debe ingresar el estado de la ropa.";

            // Llamar al DAO
            return donacionCD.RegistrarDonacion(idPersona, direccion, coordenadas, cantidad, fechaDona,
                                                tipoRopa, estadoRopa, imagen1, imagen2, imagen3);
        }

        public DataTable ObtenerPerfilUsuario(string usuario)
        {
            return donadorCD.ObtenerPerfilUsuario( usuario);
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
            // Validaciones
            if (string.IsNullOrWhiteSpace(usuario))
                return "El usuario no puede estar vacío.";

            if (string.IsNullOrWhiteSpace(nombres))
                return "Debe ingresar los nombres.";

            if (string.IsNullOrWhiteSpace(apellidos))
                return "Debe ingresar los apellidos.";

            if (string.IsNullOrWhiteSpace(correo))
                return "Debe ingresar el correo electrónico.";

            if (string.IsNullOrWhiteSpace(telefono))
                return "Debe ingresar el número de teléfono.";

            if (fechaNaci >= DateTime.Now)
                return "La fecha de nacimiento debe ser anterior a hoy.";

            if (string.IsNullOrWhiteSpace(contrasenia))
                return "Debe ingresar la contraseña.";

            // Llamar al DAO (donadorCD)
            return donadorCD.ActualizarPerfilUsuario(
                usuario,
                nombres,
                apellidos,
                correo,
                telefono,
                fechaNaci,
                contrasenia
            );
        }



    }
}