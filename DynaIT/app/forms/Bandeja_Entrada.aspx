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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                                <asp:Label ID="lbl_pendientes" runat="server" Text="En proceso"></asp:Label>
                                <asp:Label ID="Lbl_N_pendientes" runat="server" OnLoad="Lbl_N_pendientes_Load"></asp:Label>
                            </div>
                        </div>
                        <div class="col-3 ">
                            <div class="traerNota">
                                <asp:Label ID="lbl_enp" runat="server" Text="Resuelto"></asp:Label>
                                <asp:Label ID="Lbl_Enproceso" runat="server" OnLoad="Enproceso_Load"></asp:Label>
                            </div>
                        </div>
                        <div class="col-2 ">
                            <div class="traerNota">
                                <asp:Label ID="lbl_" runat="server" Text="cerrado"></asp:Label>
                                <asp:Label ID="Lbl_NResueltos" runat="server" OnLoad="Lbl_NResueltos_Load"></asp:Label>
                            </div>
                        </div>
                        <div class="col-2 ">
                            <div class="traerNota">
                                <asp:Label ID="Label9" runat="server" Text="vencidos"></asp:Label>
                                <asp:linkbutton text="0" runat="server" />
                            </div>
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
            
            <div class="row" style="overflow: auto; height: 85vh;" >
                <div class="col-12">
                    <div class="row">

                          <%--fila2--%><%--<div class="row">--%>
                       
                        <div class="col-6" style="margin: 0; height:581px; overflow:auto;">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="background-color:cadetblue; display:flex; justify-content: space-between; ">
                                    <div>
                                        <i class="fa fa-pie-chart"></i>Ticket cerrados                                       
                                    </div>
                                    <div>
                                        <asp:DropDownList ID="list_top_cerrados" runat="server" AutoPostBack="True" OnSelectedIndexChanged="list_top_cerrados_SelectedIndexChanged">
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="card-body">
                                    
                                    <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="lbl_fecha_inicio" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fec_ini_cerrados" type="date" runat="server" style="font-size: medium" />
                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="lbl_fec_fin_empresas" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fec_fin_cerrados" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" id="Btn_cerrados_agente" OnClick="Btn_cerrados_agente_Click1"/>
                                        </div>
                                    </div>
                                    <%--<--grafica de -->--%>
                                    <asp:Chart runat="server" ID="grafica_cerrados_agente" DataSourceID="Grafica_cerrados_agente_grafica" Width="566px" OnLoad="grafica_cerrados_agente_Load">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="nombre_usuario" YValueMembers="N_Ticket"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                    <asp:GridView visible="false" ID="Grilla_cerrados_por_consultor" runat="server" CssClass="table table-head-fixed text-nowrap" AutoGenerateColumns="False" CellPadding="3" DataSourceID="tablas_cerrados_por_consultor_griv" GridLines="None" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" OnLoad="Grilla_cerrados_por_consultor_Load">
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="Consultor" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_Ticket" HeaderText="Tickets cerrados" ReadOnly="True" SortExpression="N_Ticket" />
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


                                    <asp:SqlDataSource ID="Grafica_cerrados_agente_grafica" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top (@top_cerrados) nombre_usuario, count(id_ticket) as N_Ticket from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where estado_id = 5 and fecha_cierre_ticket between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="list_top_cerrados" DbType="Int32" DefaultValue="5" Name="top_cerrados" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="tablas_cerrados_por_consultor_griv" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(id_ticket) as N_Ticket from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where estado_id = 5 and fecha_cierre_ticket between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="card-footer small text-muted" style="background-color:cadetblue">
                                    <asp:Label ID="lbl_fecha" Text="" runat="server" />
                                    <asp:Button Text="Exportar" runat="server" id="Btn_Todos_cerrados_por_agente" OnClick="Btn_Todos_cerrados_por_agente_Click"/>
                                </div>
                            </div>
                        </div>
                          <div class="col-6" style="margin: 0; height:581px; overflow:auto;">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="background-color:cadetblue; display:flex; justify-content: space-between; ">
                                    <i class="fa fa-pie-chart"></i>Tickets creados y asignados
                                    <asp:Label id="lbl_fecha_dia_hoy_ini" runat="server" Visible="false" />
                                    <asp:Label id="lbl_fecha_dia_hoy_fin" runat="server" Visible="false" />
                                    <div>
                                        <asp:DropDownList ID="List_creados_asignados" runat="server" AutoPostBack="True" OnSelectedIndexChanged="List_creados_asignados_SelectedIndexChanged">
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="card-body">
                                     <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label4" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Inp_fe_ini_creado_asignados" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label6" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="Inp_fe_fin_creado_asignados" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" ID="Btn_buscar_creados_asignados" OnClick="Btn_buscar_creados_asignados_Click" />
                                        </div>
                                    </div>
                                    <asp:Chart runat="server" ID="Grafica_abiertos_asignados_agente" DataSourceID="tickets_creados_y_asignados" Width="568px" OnLoad="Grafica_abiertos_asignados_agente_Load" Visible="true">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="Nombre_usuario_grfica_creados" YValueMembers="N_Ticket_grafica_creados"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>

                                    <%----grilla----%>
                                    <asp:GridView ID="Grilla_tickets_creados" runat="server" AutoGenerateColumns="False" DataSourceID="Tickets_creados_asignados" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None" Visible="False" >
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Nombre_usuario_grfica_creados" HeaderText="nombre_usuario" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_Ticket_grafica_creados" HeaderText="N_tickets" ReadOnly="True" SortExpression="N_tickets" />
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

                                     <asp:SqlDataSource ID="Tickets_creados_asignados" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where Fecha between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                             <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" Name="fecha_fin" PropertyName="Text" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="tickets_creados_y_asignados" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top (@top_creados) nombre_usuario, count(id_ticket) as N_tickets from ticket 
  inner join usuario on usuario.id_usuario = ticket.usuario_id
  where Fecha between @fecha_inicio AND @fecha_fin group by nombre_usuario">
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="List_creados_asignados" DbType="Int32" DefaultValue="5" Name="top_creados" PropertyName="SelectedValue" />
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
                             
                        <div class="col-6" style="margin: 0; height:581px; overflow:auto; " >
                                    

                            <div class="card mb-4" style="overflow:auto;">
                                <div class="card-header" style="background-color:cornflowerblue; display:flex; justify-content: space-between;">
                                    <i class="fa fa-pie-chart"></i>Tickets trabajados
                                    <div>
                                        <asp:DropDownList ID="List_tickets_trabajados" runat="server" AutoPostBack="True" OnSelectedIndexChanged="List_tickets_trabajados_SelectedIndexChanged">
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        </asp:DropDownList></div>
                                </div>
                                <div class="card-body">  
                                   <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label7" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_trabajados_ini" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label8" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_trabajados_fin" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server"  ID="Btn_buscar_trabajados" OnClick="Btn_buscar_trabajados_Click" />
                                        </div>
                                    </div>
                                    <asp:Chart ID="Grafica_Ticket_trabajados" runat="server" DataSourceID="tickets_trabajados" OnLoad="Grafica_Ticket_trabajados_Load" Width="506px">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="nombre_usuario" YValueMembers="N_tickets"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>


                                    <asp:SqlDataSource ID="tickets_trabajados" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top(@top_trabajados) nombre_usuario, count(distinct ticket.id_ticket) as N_tickets from ticket 
  inner join nota on nota.id_ticket = ticket.id_ticket
  inner join usuario on usuario.id_usuario = nota.usuario_id_nota
                 where FechaNota between @fecha_inicio AND @fecha_fin and nota_usuario = 1 group by nombre_usuario ">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="List_tickets_trabajados" DbType="Int32" DefaultValue="5" Name="top_trabajados" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>


                                    <%--grilla--%>
                                    <asp:GridView Visible="false" ID="Grilla_Ticket_trabajado_fecha" runat="server" AutoGenerateColumns="False" DataSourceID="Tickets_trabajados_driv" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None" OnLoad="Grilla_Ticket_trabajado_fecha_Load">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="nombre_usuario" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N_tickets" ReadOnly="True" SortExpression="N_tickets" />
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

                                    

                                    <asp:SqlDataSource ID="Tickets_trabajados_driv" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(ticket.id_ticket) as N_tickets from ticket
  inner join nota on nota.id_ticket = ticket.id_ticket
  inner join usuario on usuario.id_usuario = nota.nota_creada_por
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
                          <%--</div>--%><%--fin fila 2--%>

                        <div class="col-6" style="margin: 0; height:581px; ">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="background-color:cornflowerblue; display:flex; justify-content: space-between;">
                                    <i class="fa fa-pie-chart"></i>Tickets solicitados por Empresas
                                     <div><asp:DropDownList ID="List_tick_empresas" runat="server" AutoPostBack="True" OnSelectedIndexChanged="List_tick_empresas_SelectedIndexChanged">
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        </asp:DropDownList></div>
                                </div>
                                <div class="card-body">
                                    <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label10" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fecha_ini_empresas" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label11" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fecha_fin_empresas" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" id="Btn_buscar_empresas" OnClick="Btn_buscar_empresas_Click"/>
                                        </div>
                                    </div>
                                    <asp:Chart ID="Grafica_tickets_por_empresa" runat="server" DataSourceID="tabla_ticket_empresa_graf" Palette="Bright" Width="500px" OnLoad="Grafica_tickets_por_empresa_Load">
                                        <Series>
                                            <asp:Series Name="Series1" XValueMember="nombre_empresa" YValueMembers="N_Tickets" YValuesPerPoint="4"></asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>

                                    <%--grillaa empresas--%>
                                    <asp:GridView visible="false" ID="grilla_tickets_por_empresa" runat="server" AutoGenerateColumns="False" DataSourceID="tabla_ticket_empresa_grid" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                    <asp:SqlDataSource ID="tabla_ticket_empresa_graf" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top (@top_empresas) nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket 
 inner join cliente on cliente.id_Cliente = ticket.cliente_id
 inner join empresa on empresa.id_empresa = cliente.empresa_id 
where Fecha between @fecha_inicio AND @fecha_fin group by nombre_empresa order by COUNT (2)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="List_tick_empresas" DbType="Int32" DefaultValue="5" Name="top_empresas" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="tabla_ticket_empresa_grid" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_empresa, COUNT(id_Empresa) as N_tickets from ticket 
 inner join cliente on cliente.id_Cliente = ticket.cliente_id
 inner join empresa on empresa.id_empresa = cliente.empresa_id
 group by nombre_empresa
 order by COUNT (2)"></asp:SqlDataSource>
                                </div>
                                <div class="card-footer small text-muted" style="background-color:cornflowerblue"> 
                                    <asp:Label ID="Label1" Text="" runat="server" />
                                <asp:Button Text="Exportar" runat="server" id="exportar_empresa" OnClick="exportar_empresa_Click" />
                                </div>
                            </div>
                       

                </div>
                    
                        <div class="col-6" style="margin: 0; height:581px;">
                            <!-- Example Pie Chart Card-->
                            <div class="card mb-4">
                                <div class="card-header" style="display:flex; justify-content: center;">
                                    <i class="fa fa-pie-chart"></i>Estados 
                                </div>
                                <div class="card-body">
                                    <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label12" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fecha_ini_estados" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label13" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fecha_fin_estados" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" runat="server" ID="Btn_buscar_estados" OnClick="Btn_buscar_estados_Click" />
                                        </div>
                                    </div>
                                    <asp:Chart ID="Grafica_tickets_por_estado" runat="server" DataSourceID="ticket_estados_" Height="342px" Width="500px" ImageType="Jpeg" ImageStorageMode="UseImageLocation" ViewStateMode="Enabled" OnLoad="Grafica_tickets_por_estado_Load">
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
                                    <asp:SqlDataSource ID="ticket_estados_" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand=" select  estado_Ticket, COUNT(id_Estado_Ticket) as N_tickets from ticket 
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id where Fecha between @fecha_inicio AND @fecha_fin group by estado_Ticket order by COUNT (2)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="ticket_estados_grid" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand=" select  estado_Ticket, COUNT(id_Estado_Ticket) as N_tickets from ticket 
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id where Fecha between @fecha_inicio AND @fecha_fin group by estado_Ticket order by COUNT (2)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" DefaultValue="0" Name="fecha_inicio" PropertyName="Text" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" ConvertEmptyStringToNull="False" DbType="DateTime" DefaultValue="0" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="card-footer small text-muted" style="">
                                    <asp:Label ID="Label2" Text="" runat="server" />
                                    <asp:Button Text="Exportar" runat="server" ID="Btn_exportar_tickets_estados" OnClick="Btn_exportar_tickets_estados_Click"/>
                                </div>
                            </div>
                        </div>
                          <%--</div>--%>                     <%--fila3-----------------------------------------------------%><%--<div class="row">--%>
                       
                        
                            
                          <div id="creditos" class="col-6" style="margin: 0; height:581px;">
                                    

                            <div class="card mb-4" style="overflow:auto; height:550px">
                                <div class="card-header" style="display:flex; justify-content: space-between;">
                                    <i class="fa fa-pie-chart"></i>Creditos por consultor
                                    <div>   
                                        <asp:DropDownList ID="List_creditos_consult" runat="server" AutoPostBack="True" OnSelectedIndexChanged="List_creditos_consult_SelectedIndexChanged">
                                            <asp:ListItem>5</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="card-body" style="overflow: auto; ">
                                   <div style="display:flex; justify-content: space-around;  margin-bottom:20px;">
                                        <div class="">
                        <div style="">
                            <asp:Label ID="Label14" runat="server" Text="Fecha inicio" Font-Size="Medium"></asp:Label>

                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fecha_ini_creditos" type="date" runat="server" style="font-size: medium" />

                        </div>
                    </div>
                    <div class="">
                        <div style="">
                            <asp:Label ID="Label15" runat="server" Text="Fecha Fin" Font-Size="Medium"></asp:Label>
                        </div>
                        <div style="display: flex; padding: 0;">
                            <input id="inp_fecha_fin_creditos" type="date" runat="server" style="font-size: Medium" />
                        </div>

                    </div>
                                        <div> 
                                            <asp:Button Text="Buscar" href="#creditos" runat="server" id="Btn_Buscar_creditos" OnClick="Btn_Buscar_creditos_Click"/>
                                        </div>
                                    </div>
                                    <asp:GridView ID="Grilla_creditos_tickets" runat="server" AutoGenerateColumns="False" DataSourceID="N_creditos_consultor" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None" OnLoad="Grilla_creditos_tickets_Load">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="Consultor" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N actas" ReadOnly="True" SortExpression="N_tickets" />
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
                                     <asp:GridView visible="false" ID="Grilla_creditos_tickets2" runat="server" AutoGenerateColumns="False" DataSourceID="N_creditos_consultor2" CssClass="table table-head-fixed text-nowrap" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="nombre_usuario" HeaderText="Consultor" SortExpression="nombre_usuario" />
                                            <asp:BoundField DataField="N_tickets" HeaderText="N actas" ReadOnly="True" SortExpression="N_tickets" />
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
                                    <asp:SqlDataSource ID="N_creditos_consultor" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select top(@top_creditos_cosnul)  nombre_usuario, count(ticket.id_ticket) as N_tickets, sum(n_creditos_acta) as N_creditos from acta
inner join ticket on ticket.id_ticket = acta.ticket_id
inner join usuario on usuario.id_usuario = acta.fk_usuario_id 
where acta.fecha_crea_acta  between @fecha_inicio AND @fecha_fin  group by nombre_usuario">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="List_creditos_consult" DbType="Int32" DefaultValue="5" Name="top_creditos_cosnul" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_ini" DbType="DateTime" Name="fecha_inicio" PropertyName="Text" DefaultValue="" />
                                            <asp:ControlParameter ControlID="lbl_fecha_dia_hoy_fin" DbType="DateTime" Name="fecha_fin" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="N_creditos_consultor2" runat="server" ConnectionString="<%$ ConnectionStrings:Myconexion2 %>" SelectCommand="select nombre_usuario, count(ticket.id_ticket) as N_tickets, sum(n_creditos_acta) as N_creditos from acta
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
                                    <asp:Button Text="Exportar" runat="server" id="Btn_creditos_por_consultor" OnClick="Btn_creditos_por_consultor_Click"/>
                                </div>
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
