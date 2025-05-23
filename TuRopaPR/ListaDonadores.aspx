<%@ Page Title="Lista de Donadores" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ListaDonadores.aspx.cs" Inherits="TuRopaPR.ListaDonadores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow: hidden; /* evita scroll si el fondo sobresale */
        }

        .background-blur {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: url('imagenes/proyec5.jpg') no-repeat center center fixed;
            background-size: cover;
            filter: blur(8px);
            z-index: -1;
        }

        .lista-container {
            background-color: rgba(255, 255, 255, 0.85);
            padding: 30px;
            border-radius: 12px;
            max-width: 1000px;
            margin: 50px auto;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .gridview-style {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview-style th, .gridview-style td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        .gridview-style th {
            background-color: #333;
            color: white;
        }

        .gridview-style tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="background-blur"></div>

    <div class="lista-container">
        <h2>Lista de Donadores</h2>
        <asp:GridView ID="gvDonadores" runat="server" CssClass="gridview-style" AutoGenerateColumns="true" />
    </div>
</asp:Content>
