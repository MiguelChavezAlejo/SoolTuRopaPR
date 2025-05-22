<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TuRopaPR.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Iniciar sesión - tuRopa</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f7f7f7;
            overflow: hidden;
        }

        .background-blur {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('imagenes/proyec6.jpg'); /* Cambia esto por tu ruta */
            background-size: cover;
            background-position: center;
            filter: blur(8px);
            z-index: 0;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.3); /* Opcional: capa translúcida */
            z-index: 1;
        }

        .login-box {
            position: relative;
            z-index: 2;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            width: 350px;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-box label {
            display: block;
            margin-bottom: 5px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        .login-box input[type="submit"],
        .login-box input[type="button"] {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-btn {
            background-color: #333;
            color: white;
        }

        .cancel-btn {
            background-color: #ccc;
            color: black;
        }

        .error {
            color: red;
            font-size: 0.9em;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="background-blur"></div>
    <div class="overlay"></div>

    <form id="form1" runat="server">
        <div class="login-box">
            <h2>Iniciar sesión</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario:" />
            <asp:TextBox ID="txtUsuario" runat="server" />
            <asp:Label ID="lblClave" runat="server" Text="Contraseña:" />
            <asp:TextBox ID="txtClave" runat="server" TextMode="Password" />

            <div class="button-container">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="login-btn" OnClick="btnIngresar_Click" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="cancel-btn" CausesValidation="false" PostBackUrl="~/Inicio.aspx" />
            </div>
        </div>
    </form>
</body>
</html>
