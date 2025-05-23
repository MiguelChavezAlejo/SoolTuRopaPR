<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regis_Usuario.aspx.cs" Inherits="TuRopaPR.Regis_Usuario" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Registro de Donador - tuRopa</title>
    <style>
        /* Mismos estilos tuyos con mejoras mínimas */
        * {
            box-sizing: border-box;
        }

        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('imagenes/proyec8.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            width: 100%;
            height: 100%;
            backdrop-filter: blur(8px);
            background-color: rgba(255, 255, 255, 0.2);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.6);
            padding: 40px;
            border-radius: 12px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(4px);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #444;
        }

        input, select, .aspNetInput {
            width: 100%;
            padding: 10px;
            height: 45px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 30px;
        }

        .btn {
            width: 100%;
            padding: 14px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #555;
        }

        .cancel-button {
            background-color: #888;
        }

        .cancel-button:hover {
            background-color: #aaa;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="overlay">
            <div class="form-container">
                <h2>Registro de Donador</h2>

                <label for="txtNombres">Nombres:</label>
                <asp:TextBox ID="txtNombres" runat="server" CssClass="aspNetInput" />

                <label for="txtApellidos">Apellidos:</label>
                <asp:TextBox ID="txtApellidos" runat="server" CssClass="aspNetInput" />

                <label for="ddlTipoDocumento">Tipo de documento:</label>
                <asp:DropDownList ID="ddlTipoDocumento" runat="server" CssClass="aspNetInput">
                    <asp:ListItem Text="-- Selecciona --" Value="" />
                    <asp:ListItem Text="DNI" Value="DNI" />
                    <asp:ListItem Text="Carnet de extranjería" Value="Carnet de extranjería" />
                </asp:DropDownList>

                <label for="txtNumeroDocumento">Nro de Documento:</label>
                <asp:TextBox ID="txtNumeroDocumento" runat="server" CssClass="aspNetInput" />

                <label for="txtCorreo">Correo Electrónico:</label>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="aspNetInput" TextMode="Email" />

                <label for="txtTelefono">Teléfono:</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="aspNetInput" />

                <label for="txtFechaNacimiento">Fecha de nacimiento:</label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="aspNetInput" TextMode="Date" />

                <div class="button-group">
                    <asp:Button ID="btnRegistrar" runat="server" Text="Registrarse" OnClick="btnRegistrar_Click" CssClass="btn" />
                    <button type="button" class="btn cancel-button" onclick="location.href='Inicio.aspx'">Cancelar</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
