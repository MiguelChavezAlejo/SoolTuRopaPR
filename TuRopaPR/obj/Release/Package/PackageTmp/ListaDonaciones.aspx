<%@ Page Title="Lista de Donaciones" Language="C#" MasterPageFile="~/SiteAdmin.master" AutoEventWireup="true" CodeBehind="ListaDonaciones.aspx.cs" Inherits="TuRopaPR.ListaDonaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn-ver-mapa {
    display: inline-block;
    padding: 8px 15px;
    background-color: #007bff;
    color: white !important;
    border: none;
    border-radius: 6px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.btn-ver-mapa:hover {
    background-color: #0056b3;
    text-decoration: none;
}
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow: hidden;
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
        <h2>Lista de Donaciones</h2>
           <asp:GridView ID="gvDonaciones" runat="server" CssClass="gridview-style" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="Documento" HeaderText="Documento" />
        <asp:BoundField DataField="Donador" HeaderText="Donador" />
        <asp:BoundField DataField="Dni" HeaderText="DNI" />
        <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
        <asp:BoundField DataField="Direccion" HeaderText="Teléfono" />
        <asp:TemplateField HeaderText="Ubicación">
            <ItemTemplate>
                <asp:HyperLink 
                    ID="hlUbicacion" 
                    runat="server" 
                    NavigateUrl='<%# "https://www.google.com/maps?q=" + Eval("cordenadas") %>' 
                    Target="_blank" 
                    CssClass="btn-ver-mapa">
                    Ver en mapa
                </asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </div>
</asp:Content>
