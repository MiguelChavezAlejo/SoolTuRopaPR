<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Regis_Usuario.aspx.cs" Inherits="TuRopaPR.Regis_Usuario" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Registro de Donador - tuRopa</title>
    <style>
        * {
            box-sizing: border-box; /* clave para mantener mismo ancho visual */
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            max-width: 1400px;
            margin: 50px auto;
            padding: 20px;
            gap: 40px;
        }

        .image-box {
            width: 45%;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            padding: 20px;
            height: 650px;
        }

        .image-box img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        .form-container {
            width: 50%;
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
        }

        label {
            display: block;
            margin-top: 20px;
            color: #444;
            font-weight: 500;
            font-size: 15px;
        }

        input, select {
            width: 100%;
            padding: 12px;
            height: 45px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            background-color: #fefefe;
            transition: border-color 0.3s;
            appearance: none;
        }

        input:focus, select:focus {
            border-color: #666;
            outline: none;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            margin-top: 35px;
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

    <div class="container">
        <!-- Imagen a la izquierda -->
        <div class="image-box">
            <img src="imagenes/proyec8.jpg" alt="Imagen decorativa de donación">
        </div>

        <!-- Formulario a la derecha -->
        <div class="form-container">
            <h2>Registro de Donador</h2>
            <form action="RegistroDonador.aspx" method="post">
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

                <label for="fechaNacimiento">Fecha de nacimiento:</label>
                <input type="date" id="fechaNacimiento" name="fechaNacimiento" required>

                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required>

                <label for="distrito">Distrito:</label>
                <input type="text" id="distrito" name="distrito" required>

                <label for="edad">Edad:</label>
                <input type="number" id="edad" name="edad" min="0" required>

                <label for="genero">Género:</label>
                <select id="genero" name="genero" required>
                    <option value="">-- Selecciona --</option>
                    <option value="Femenino">Femenino</option>
                    <option value="Masculino">Masculino</option>
                    <option value="Otro">Otro</option>
                </select>

                <div class="button-group">
                    <button type="submit">Registrarse</button>
                    <button type="button" class="cancel-button" onclick="location.href='Inicio.aspx'">Cancelar</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>

