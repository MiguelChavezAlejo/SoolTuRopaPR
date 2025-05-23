<%@ Page Title="Mi Perfil" Language="C#" MasterPageFile="~/SiteUser.master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="TuRopaPR.PerfilUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('imagenes/proyec5.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
            z-index: 0;
        }

        .wrapper {
            position: relative;
            min-height: 100vh;
        }

        .perfil-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 12px;
            max-width: 600px;
            margin: 40px auto;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        label {
            font-weight: bold;
        }

        input, .aspNetDisabled {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn-update {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-update:hover {
            background-color: #555;
        }

        /* Toast */
        .toast {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #28a745;
            color: #fff;
            text-align: center;
            border-radius: 10px;
            padding: 16px;
            position: fixed;
            z-index: 1000;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        .toast.show {
            visibility: visible;
            opacity: 1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="background-blur"></div>

        <div class="perfil-container">
            <h2>Mi Perfil</h2>
            <asp:Label ID="lblMensaje" runat="server" />

            <label for="txtDocP">Documento</label>
            <asp:TextBox ID="txtDocP" runat="server" />

            <label for="txtTipoDocu">Tipo de Documento</label>
            <asp:TextBox ID="txtTipoDocu" runat="server" />

            <label for="txtNombres">Nombres</label>
            <asp:TextBox ID="txtNombres" runat="server" />

            <label for="txtApellidos">Apellidos</label>
            <asp:TextBox ID="txtApellidos" runat="server" />

            <label for="txtCorreo">Correo</label>
            <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" />

            <label for="txtTelefono">Teléfono</label>
            <asp:TextBox ID="txtTelefono" runat="server" />

            <label for="txtFechaNaci">Fecha de nacimiento</label>
            <asp:TextBox ID="txtFechaNaci" runat="server" TextMode="Date" />

            <label for="txtContrasenia">Contraseña</label>
            <asp:TextBox ID="txtContrasenia" runat="server" TextMode="Password" />

            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Datos" CssClass="btn-update" OnClick="btnActualizar_Click" />
        </div>

        <!-- Toast flotante -->
        <div id="toast" class="toast">Sus datos han sido actualizados correctamente.</div>
    </div>
</asp:Content>
