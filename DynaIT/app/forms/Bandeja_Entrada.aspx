<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bandeja_Entrada.aspx.cs" Inherits="DynaIT.app.forms.Bandeja_Entrada" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>DynamicsIT</title> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
   
    <link href="../style/Style.css" rel="stylesheet" />
    <script src="../js/Validacion_JavaScript.js"></script>

   
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid" style="margin: 2px;">
            <asp:ScriptManager ID="aaaa" runat="server"></asp:ScriptManager>
            <%-- barra de notificaciones--%>
            <div class="row" style="height: 15vh;">
                <div class="col-12">
                    <div class="row" style="margin-top: 20px">
                        <div class="col-2">
                            <div class="traerNota">
                                <asp:Label ID="lbl_abiertos" runat="server" Text="Abiertos"></asp:Label>
                                <asp:Label ID="Lbl_N_Abiertos" runat="server" OnLoad="Lbl_N_Abiertos_Load"></asp:Label>
                            </div>
                        </div>
                        <div class="col-2 ">
                            <div class="traerNota">
                                <asp:Label ID="lbl_pendientes" runat="server" Text="Pendiente"></asp:Label>
                                <asp:Label ID="Lbl_N_pendientes" runat="server" OnLoad="Lbl_N_pendientes_Load"></asp:Label>
                            </div>
                        </div>
                        <div class="col-3 ">
                            <div class="traerNota">
                                <asp:Label ID="lbl_enp" runat="server" Text="En proceso"></asp:Label>
                                <asp:Label ID="Lbl_Enproceso" runat="server" OnLoad="Enproceso_Load"></asp:Label>
                            </div>
                        </div>
                        <div class="col-2 ">
                            <div class="traerNota">
                                <asp:Label ID="lbl_" runat="server" Text="Resuelto"></asp:Label>
                                <asp:Label ID="Lbl_NResueltos" runat="server" OnLoad="Lbl_NResueltos_Load"></asp:Label>
                            </div>
                        </div>
                        <div class="col-2 ">
                            <div class="traerNota">
                                <asp:Label ID="Label9" runat="server" Text="Cerrados"></asp:Label>
                                <asp:Label ID="Lbl_N_Cerrados" runat="server" OnLoad="Lbl_N_Cerrados_Load"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
            
            <div class="row" style="overflow: auto; height: 85vh;">
                <div class="col-12">
                    <div class="row">

                          <%--fila2--%>
                      <%--<div class="row">--%>
                       
                        <div class="col-6" style="margin: 0;">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="background-color:cadetblue">
                                    <i class="fa fa-pie-chart"></i>Ticket cerrados por agente ayer
                                    <asp:Label id="lbl_fecha_dia_anterior_ini" runat="server" Visible="false" />
                                    <asp:Label id="lbl_fecha_dia_anterior_fin" runat="server" Visible="false" />
                                </div>
                                <div class="card-body">
                                    
                                    <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="lbl_fecha_inicio" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Txt_fecha_inicio" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="lbl_fecha_fin" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Txt_fecha_fin" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" />
                                        </div>
                                    </div>
                                   
                                    <asp:Chart runat="server" ID="grafica_empresas" DataSourceID="tablas_empresas_grafica" Width="566px">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="nombre_usuario" YValueMembers="N_tickets"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart> <asp:GridView visible="false" ID="Grilla_cerrados_por_consultor" runat="server" CssClass="table table-head-fixed text-nowrap" AutoGenerateColumns="False" CellPadding="3" DataSourceID="tablas_empresas_griv" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="Consultor" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="Tickets cerrados" ReadOnly="True" SortExpression="N_tickets" />
                                        </Columns>
                                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                                    </asp:GridView>


                                    <asp:SqlDataSource ID="tablas_empresas_grafica" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top (5) nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where estado_id = 5 and fecha_cierre_ticket between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_anterior_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_anterior_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="tablas_empresas_griv" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where estado_id = 5 and fecha_cierre_ticket between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_anterior_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_anterior_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="card-footer small text-muted" style="background-color:cadetblue">
                                    <asp:Label ID="lbl_fecha" Text="" runat="server" />
                                    <asp:Button Text="Exportar" runat="server" id="Btn_Todos_cerrados_por_agente" OnClick="Btn_Todos_cerrados_por_agente_Click"/>
                                </div>
                            </div>
                        </div>
                          <div class="col-6" style="margin: 0;">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="background-color:cadetblue">
                                    <i class="fa fa-pie-chart"></i>Numero de Tickets creados y asignados a <asp:Label id="lbl_fecha_dia_hoy_ini" runat="server" Visible="false" />
                                    <asp:Label id="lbl_fecha_dia_hoy_fin" runat="server" Visible="false" />
                                </div>
                                <div class="card-body">
                                     <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label4" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date1" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label6" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date2" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" />
                                        </div>
                                    </div>
                                    <asp:Chart runat="server" ID="Chart3" DataSourceID="tickets_creados_y_asignados" Width="568px">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="nombre_usuario" YValueMembers="N_tickets"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>

                                    <%----grilla----%>
                                    <asp:GridView visible="false" ID="Grilla_tickets_creados" runat="server" CssClass="table table-head-fixed text-nowrap" AutoGenerateColumns="False" CellPadding="3" DataSourceID="tickets_creados_y_asignados_griv" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1">
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="Consultor" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N tickets" ReadOnly="True" SortExpression="N_tickets" />
                                        </Columns>
                                        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                                        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                                        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                                        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#594B9C" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#33276A" />
                                    </asp:GridView>

                                    <asp:SqlDataSource ID="tickets_creados_y_asignados" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top (10) nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where Fecha between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                          <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="tickets_creados_y_asignados_griv" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where Fecha between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                          <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="card-footer small text-muted" style="background-color:cadetblue">
                                    <asp:Button Text="Exportar" runat="server" id="Btn_exportar_tickets_creados" OnClick="Btn_exportar_tickets_creados_Click"/>
                                
                                </div>
                            </div>
                        </div>
                             
                        <div class="col-6">
                                    

                            <div class="card mb-4">
                                <div class="card-header" style="background-color:cornflowerblue">
                                    <i class="fa fa-pie-chart"></i>Tickets trabajados
                                    
                                </div>
                                <div class="card-body">  
                                   <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label7" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date3" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label8" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date4" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" />
                                        </div>
                                    </div>
                                    <asp:Chart ID="Chart4" runat="server" DataSourceID="Tickets_trabajados" Width="532px">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="nombre_usuario" YValueMembers="N_tickets"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>

                                    <%--grilla--%>
                                    <asp:GridView visible="false" ID="Grilla_Ticket_trabajado_fecha" runat="server" AutoGenerateColumns="False" DataSourceID="Tickets_trabajados_driv" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="Consultor" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N tickets Trabajados" ReadOnly="True" SortExpression="N_tickets" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                    <asp:SqlDataSource ID="Tickets_trabajados" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top(5) nombre_usuario, count(ticket.id_ticket) as N_tickets from ticket
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  inner join nota on nota.id_ticket = ticket.id_ticket
  where FechaNota between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="Tickets_trabajados_driv" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(ticket.id_ticket) as N_tickets from ticket
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  inner join nota on nota.id_ticket = ticket.id_ticket
  where FechaNota between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                                <div class="card-footer small text-muted" style="background-color:cornflowerblue">
                                    <asp:Label ID="Label5" Text="" runat="server" />
                                    <asp:Button Text="Exportar" runat="server" id="Btn_exportar_Trabajados" OnClick="Btn_exportar_Trabajados_Click"/>
                                </div>
                                
                            </div>
                        <div>
                            
                            <asp:Panel runat="server" ID="panel1"></asp:Panel>
                        </div>
                    </div>
                <%--</div>--%>
                    <%--fin fila 2--%>

                        <div class="col-6" style="margin: 0;">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="background-color:brown">
                                    <i class="fa fa-pie-chart"></i>Empresas
                                </div>
                                <div class="card-body">
                                    <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label10" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date5" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label11" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date6" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" />
                                        </div>
                                    </div>
                                    <asp:Chart ID="Chart1" runat="server" DataSourceID="tabla_ticket_estados" Palette="Bright" Height="342px" Width="500px">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="Nombre_Empresa" YValueMembers="N_tickets" YValuesPerPoint="4"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>

                                    <%--grillaa empresas--%>
                                    <asp:GridView visible="false" ID="grilla_tickets_por_empresa" runat="server" AutoGenerateColumns="False" DataSourceID="tabla_ticket_estados_grid" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="nombre_empresa" HeaderText="Empresa" SortExpression="nombre_empresa" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N tickets" ReadOnly="True" SortExpression="N_tickets" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>
                                    <%--grillaa empresas--%>
                                    <asp:SqlDataSource ID="tabla_ticket_estados" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top (5) nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket 
 inner join cliente on cliente.id_Cliente = ticket.cliente_id
 inner join empresa on empresa.id_empresa = cliente.empresa_id
 group by nombre_empresa
 order by COUNT (2)"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="tabla_ticket_estados_grid" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket 
 inner join cliente on cliente.id_Cliente = ticket.cliente_id
 inner join empresa on empresa.id_empresa = cliente.empresa_id
 group by nombre_empresa
 order by COUNT (2)"></asp:SqlDataSource>
                                </div>
                                <div class="card-footer small text-muted" style="background-color:brown"> 
                                    <asp:Label ID="Label1" Text="" runat="server" />
                                <asp:Button Text="Exportar" runat="server" id="exportar_empresa" OnClick="exportar_empresa_Click" />
                                </div>
                            </div>
                       

                </div>
                    
                        <div class="col-6" style="margin: 0;">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="background-color:brown">
                                    <i class="fa fa-pie-chart"></i>Estados 
                                </div>
                                <div class="card-body">
                                    <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label12" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date7" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label13" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date8" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" />
                                        </div>
                                    </div>
                                    <asp:Chart ID="Chart2" runat="server" DataSourceID="ticket_estados_" Height="342px" Width="500px" ImageType="Jpeg" ImageStorageMode="UseImageLocation" ViewStateMode="Enabled">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="estado_Ticket" YValueMembers="N_tickets"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                    <%--grillaa estados--%>
                                    <asp:GridView visible="false" ID="Grilla_por_estados" runat="server" CssClass="table table-head-fixed text-nowrap" AutoGenerateColumns="False" CellPadding="4" DataSourceID="ticket_estados_grid" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="estado_Ticket" HeaderText="Estado" SortExpression="estado_Ticket" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N tickets" ReadOnly="True" SortExpression="N_tickets" />
                                        </Columns>
                                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                        <SortedDescendingHeaderStyle BackColor="#820000" />
                                    </asp:GridView>
                                    <%--grillaa estados--%>
                                    <asp:SqlDataSource ID="ticket_estados_" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand=" select top(5) estado_Ticket, COUNT(id_Estado_Ticket) as N_tickets from ticket 
         inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id
         group by estado_Ticket
         order by COUNT (2)"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="ticket_estados_grid" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand=" select estado_Ticket, COUNT(id_Estado_Ticket) as N_tickets from ticket 
         inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id
         group by estado_Ticket
         order by COUNT (2)"></asp:SqlDataSource>
                                </div>
                                <div class="card-footer small text-muted" style="background-color:brown">
                                    <asp:Label ID="Label2" Text="" runat="server" />
                                    <asp:Button Text="Exportar" runat="server" ID="Btn_exportar_tickets_estados" OnClick="Btn_exportar_tickets_estados_Click"/>
                                </div>
                            </div>
                        </div>
                <%--</div>--%>
                  
                     <%--fila3-----------------------------------------------------%>
                      <%--<div class="row">--%>
                       
                        
                            
                          <div class="col-6">
                                    

                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fa fa-pie-chart"></i>Creditos por consultor hoy
                                    
                                </div>
                                <div class="card-body">
                                   <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label14" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date9" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label15" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Date10" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" />
                                        </div>
                                    </div>
                                    <asp:GridView ID="Grilla_creditos_tickets" runat="server" AutoGenerateColumns="False" DataSourceID="N_creditos_consultor" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="Consultor" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N tickets" ReadOnly="True" SortExpression="N_tickets" />
                                            <asp:BoundField DataField="N_creditos" HeaderText="N creditos" ReadOnly="True" SortExpression="N_creditos" />
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                    </asp:GridView>

                                    <asp:SqlDataSource ID="N_creditos_consultor" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(ticket.id_ticket) as N_tickets, sum(n_creditos_acta) as N_creditos from acta
inner join ticket on ticket.id_ticket = acta.ticket_id
inner join usuario on usuario.id_usuario = acta.fk_usuario_id 
where acta.fecha_crea_acta  between @fecha_inicio AND @fecha_fin  group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                </div>
                                <div class="card-footer small text-muted">
                                    <asp:Label ID="Label3" Text="" runat="server" />
                                </div>
                                <asp:Label Text="text" runat="server" ID="lblnombres" />
                            </div>
                        <div>
                            <asp:Panel runat="server" ID="panel_grilla"></asp:Panel>
                        </div>
                    </div>
                       
                </div>
                    <%--fin fila 3--%>
                </div>               
            </div>
                  
            </div>
        

       
    </form>
    
</body>
</html>
