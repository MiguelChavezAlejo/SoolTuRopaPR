<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TuRopaPR.Inicio" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Inicio - tuRopa</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url('imagen/fondo1.jpg'); /* Ruta a tu imagen */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }

        /* ENCABEZADO */
        .header {
            background-color: #333;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-left {
            font-size: 1.2em;
            font-weight: bold;
        }

        .header-right a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            font-size: 1em;
        }

        .header-right a:hover {
            text-decoration: underline;
        }

        /* CONTENIDO PRINCIPAL */
        .main-content {
            display: flex;
            height: 800px;
        }

        .text-section {
            width: 50%;
            background-color: #f2f2f2;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4em;
            padding: 40px;
            text-align: center;
            line-height: 1.6em;
        }

        .carousel-container {
            width: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .carousel-box {
            width: 600px;
            height: 600px;
            position: relative;
            border: 4px solid #ccc;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .carousel {
            position: relative;
            width: 100%;
            height: 600px;
        }

        .carousel img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 600px;
            object-fit: cover;
            opacity: 0;
            animation-duration: 20s;
            animation-timing-function: ease-in-out;
            animation-iteration-count: infinite;
        }

        .carousel img:nth-child(1) { animation-name: fade; animation-delay: 0s; }
        .carousel img:nth-child(2) { animation-name: fade; animation-delay: 5s; }
        .carousel img:nth-child(3) { animation-name: fade; animation-delay: 10s; }
        .carousel img:nth-child(4) { animation-name: fade; animation-delay: 15s; }

        @keyframes fade {
            0%   { opacity: 0; }
            10%  { opacity: 1; }
            25%  { opacity: 1; }
            35%  { opacity: 0; }
            100% { opacity: 0; }
        }
    </style>
</head>
<body>

    <!-- ENCABEZADO -->
    <div class="header">
        <div class="header-left">TU ROPA, SU NUEVA HISTORIA</div>
        <div class="header-right">
            <a href="Login.aspx">Iniciar sesión</a>
            <a href="Regis_Usuario.aspx">Registrarse</a>
        </div>
    </div>

    <!-- CONTENIDO PRINCIPAL -->
    <div class="main-content">
        <!-- MENSAJE A LA IZQUIERDA -->
        <div class="text-section">
            <div>
                <strong>Bienvenido</strong>,<br>
                aquí cada prenda tiene una nueva historia que contar.<br><br>
                Creemos en el poder de transformar vidas a través de la ropa,<br>
                ofreciendo calidad y estilo a quienes más lo necesitan,<br>
                sin que el precio sea una barrera.<br><br>
                Aquí, renovar tu estilo es también un acto de solidaridad.<br>
                ¡Únete a nuestra comunidad y viste con corazón!
            </div>
        </div>

        <!-- CARRUSEL A LA DERECHA -->
        <div class="carousel-container">
            <div class="carousel-box">
                <div class="carousel">
                    <img src="imagenes/proyec1.jpg" alt="Imagen 1">
                    <img src="imagenes/proyec2.jpg" alt="Imagen 2">
                    <img src="imagenes/proyec3.jpg" alt="Imagen 3">
                    <img src="imagenes/proyec4.jpg" alt="Imagen 4">
                </div>
            </div>
        </div>
    </div>

</body>
</html>
