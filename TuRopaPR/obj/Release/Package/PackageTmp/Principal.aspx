<%@ Page Language="C#" MasterPageFile="~/SiteUser.master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="TuRopaPR.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .background-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-image: url('imagenes/proyec10.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            z-index: -2;
        }
          .background-blur {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            backdrop-filter: blur(6px);
            background-color: rgba(255, 255, 255, 0.3); /* capa blanca leve */
            z-index: -1;
        }
        .main-content {
            position: relative;
            padding: 40px;
        }

        .bienvenida {
            font-size: 1.8em;
            font-weight: bold;
            color: #111; /* negro suave */
        }

        .main-content p {
            color: #222;
            font-size: 1.2em;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Fondo desenfocado -->
    <div class="background-container"></div>
    <div class="background-blur"></div>

    <!-- Contenido principal -->
    <div class="bienvenida">
        ¡Bienvenido, <%= Session["usuario"] ?? "usuario" %>!
    </div>

    <p>Desde aquí puedes acceder a tu perfil o registrar una donación.</p>
</asp:Content>
