﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfil_Usuario.aspx.cs" Inherits="DynaIT.app.forms.perfil_Usuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>DynamicsIT</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link href="../style/Style.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="margin: 0; padding: 0; height: auto; overflow:hidden;">
        <div class="row" style="margin: 0; padding: 0;">
            <div class="col-2" style="margin: 0; padding: 0; ">
                <div class="menuLateral">

                    <ul>
                        <li>
                            <a>
                                <div class="imgLogin">

                                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>
                                </div>
                            </a>
                        </li>
                        <li><asp:Label ID="lbl_nombre_usuario" runat="server" Text="nombre usuario"></asp:Label></li>
                        <li> <asp:Label ID="Lbl_cargo" runat="server" Text="cargo usuario" Font-Size="Small"></asp:Label></li>
                        <li id="Li_Dashboard" runat="server"> <a href="Bandeja_Entrada.aspx" target="eliframe" >Dashboard</a></li>
                        <asp:Label ID="lbl_correo_usuario" runat="server" Text="lbl_correo_usuario" Visible="False"></asp:Label>
                        <asp:Label ID="lbl_correo_cliente" runat="server" Text="lbl_correo_cliente" Visible="False"></asp:Label>
                        <li  id="Div_menu_tickets" runat="server" visible="false">
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Tickets
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a runat="server" class="dropdown-item" href="Generar_Ticket_usuario.aspx" target="eliframe" id="idGenerar_Ticket">Crear TICKET</a>
                                    <a class="dropdown-item" href="Tickets_Generados_Usuario.aspx" target="eliframe">Todos los ticket</a>
                                    
                                </div>
                                    
                            </div>

                        </li>

                         <li  id="li_acta" runat="server" visible="true">
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Actas
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a runat="server" class="dropdown-item" href="Lista_actas.aspx" target="eliframe" id="A1">Total actas</a>
                                    
                                </div>
                                    
                            </div>

                        </li>

                        <%--Empresas y clientes--%>
                         <li id="Div_empresas_clientes" runat="server" visible="false">
                            <div class="dropdown">
                                <a id="empresas_clientes" runat="server" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Empresas y clientes  
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a id="a_crearEmpresa" runat="server" class="dropdown-item" href="Crear_Empresa.aspx" target="eliframe">Empresa</a>
                                    <a class="dropdown-item"  href="Crear_Cliente.aspx " target="eliframe">Clientes</a>
                                </div>
                            </div>

                        </li>
                        <%--usuarios y grupos--%>
                        <li id="Div_usuarios_grupos" runat="server" visible="false">
                            <div class="dropdown" >
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    usuarios y grupos
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="padding:0;">
                                    <a class="dropdown-item" href="Crear_Usuario.aspx " target="eliframe">Usuario</a>
                                    <a class="dropdown-item" href="Crear_Grupo_Usuario.aspx" target="eliframe">Areas</a>
                                    
                                </div>
                            </div>
                          </li>
                        <%--Actualizaciones--%>
                        <li id="Div_actualizaciones" runat="server" visible="false">
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Actualizaciones
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="padding:0;">
                                    <a class="dropdown-item" href="crear_Estados_Ticket.aspx" target="eliframe">Agregar estados</a>
                                    <a class="dropdown-item" href="Crear_tipos_ticket.aspx" target="eliframe">Agregar tipos de tickets</a>
                                    

                                </div>
                            </div>
                        </li>
                                        
                        
                        <li><a href="../login.aspx">Cerrar sesión</a></li>
                    </ul>
                </div>
            </div>
            <!-- menu central -->
            <div class="col-10" style="margin:0; padding:0; ">
                <div class="contenido" style="margin:1px; ">

                    <iframe src="Tickets_Generados_Usuario.aspx" name="eliframe" id="eliframe"></iframe>

                </div>

            </div>

        </div>
    </div>

    </form>
</body>
</html>