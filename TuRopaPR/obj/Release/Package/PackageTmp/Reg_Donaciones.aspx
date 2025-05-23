<%@ Page Title="Perfil Usuario" Language="C#" MasterPageFile="~/SiteUser.master" AutoEventWireup="true" CodeBehind="PerfilUsuario.aspx.cs" Inherits="TuRopaPR.PerfilUsuario" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

    .overlay {
        position: fixed;
        top: 0; left: 0; right: 0; bottom: 0;
        background-color: rgba(255, 255, 255, 0.25);
        backdrop-filter: blur(8px);
        z-index: 0;
    }

    .container {
        position: relative;
        z-index: 1;
        max-width: 600px;
        margin: 50px auto 60px;
        background-color: rgba(255, 255, 255, 0.85);
        padding: 30px 40px;
        border-radius: 12px;
        box-shadow: 0 0 20px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"],
    input[type="date"],
    input[type="password"],
    .form-control {
        width: 100%;
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    .form-actions {
        text-align: center;
        margin-top: 20px;
    }

    .form-actions input,
    .form-actions button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #333;
        color: white;
        cursor: pointer;
    }

    .form-actions input:hover,
    .form-actions button:hover {
        background-color: #555;
    }

    .message {
        text-align: center;
        margin-bottom: 15px;
        font-weight: bold;
    }

    .error {
        color: red;
    }

    .success {
        color: green;
    }
</style>

<div class="wrapper">
    <div class="overlay"></div>
    <div class="container">
        <h2>Perfil de Usuario</h2>

        <asp:Label ID="lblMessage" runat="server" CssClass="message" />

        <asp:Panel ID="pnlForm" runat="server">
            <div class="form-group">
                <label for="txtNombres">Nombres</label>
                <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtApellidos">Apellidos</label>
                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtCorreo">Correo</label>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" TextMode="Email" />
            </div>

            <div class="form-group">
                <label for="txtTelefono">Teléfono</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <label for="txtFechaNaci">Fecha de Nacimiento</label>
                <asp:TextBox ID="txtFechaNaci" runat="server" CssClass="form-control" TextMode="Date" />
            </div>

            <div class="form-group">
                <label for="txtContrasenia">Contraseña</label>
                <asp:TextBox ID="txtContrasenia" runat="server" CssClass="form-control" TextMode="Password" />
            </div>

            <div class="form-actions">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Datos" OnClick="btnActualizar_Click" />
            </div>
        </asp:Panel>
    </div>
</div>
</asp:Content>

