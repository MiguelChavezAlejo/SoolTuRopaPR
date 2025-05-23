<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regis_Usuario.aspx.cs" Inherits="TuRopaPR.Regis_Usuario" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Registro de Donador - tuRopa</title>
    <style>
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

        input, select {
            width: 100%;
            padding: 10px;
            height: 45px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        input:focus, select:focus {
            border-color: #666;
            outline: none;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 30px;
        }

        button {
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

        button:hover {
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

    <!-- Fondo borroso -->
    <div class="overlay">
        <!-- Formulario centrado -->
        <div class="form-container">
            <h2>Registro de Donador</h2>
            <form action="Regis_Usuario.aspx" method="post">
                <label for="nombres">Nombres:</label>
                <input type="text" id="nombres" name="nombres" required>

                <label for="apellidos">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" required>

                <label for="tipoDocumento">Tipo de documento:</label>
                <select id="tipoDocumento" name="tipoDocumento" required>
                    <option value="">-- Selecciona --</option>
                    <option value="DNI">DNI</option>
                    <option value="Carnet de extranjería">Carnet de extranjería</option>
                </select>

                <label for="numeroDocumento">Nro de Documento:</label>
                <input type="text" id="numeroDocumento" name="numeroDocumento" pattern="\d+" title="Solo números" required>

                  <label for="correo">Correo Electrinoco:</label>
                 <input type="text" id="correo" name="correp" required>

                 <label for="telefono">Telefono:</label>
                <input type="text" id="telefono" name="telefono" required>

                <label for="fechaNacimiento">Fecha de nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>
                              
               <%-- <label for="edad">Edad:</label>
                <input type="number" id="edad" name="edad" min="0" required>

                <label for="genero">Género:</label>
                <select id="genero" name="genero" required>
                    <option value="">-- Selecciona --</option>
                    <option value="Femenino">Femenino</option>
                    <option value="Masculino">Masculino</option>
                    <option value="Otro">Otro</option>
                </select>--%>

                <div class="button-group">
                    <button type="submit">Registrarse</button>
                    <button type="button" class="cancel-button" onclick="location.href='Inicio.aspx'">Cancelar</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
