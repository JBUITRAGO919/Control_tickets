﻿using DynaIT.Clases;

using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynaIT.app.forms
{
    public partial class Bandeja_Entrada : System.Web.UI.Page
    {

        Clase_Parametros myparametro = new Clase_Parametros();
        Clases.Gestion_Datos datos = new Clases.Gestion_Datos();
        Visualizar_Tickets Visualizar_Tickets = new Visualizar_Tickets();


        protected void Page_Load(object sender, EventArgs e)
        {
            string hora_inicio = "00:00:00", hora_fin = "23:59:59";
            string fecha_dia_anterior_inicio = DateTime.Now.ToShortDateString();

            DateTime fecha_inicio = Convert.ToDateTime("" + fecha_dia_anterior_inicio + " " + hora_inicio + "");
            DateTime fecha_fin = Convert.ToDateTime("" + fecha_dia_anterior_inicio + " " + hora_fin + "");
            lbl_fecha_dia_hoy_ini.Text = Convert.ToString(fecha_inicio);
            lbl_fecha_dia_hoy_fin.Text = Convert.ToString(fecha_fin);
            if (!IsPostBack)
            {
                inp_fec_ini_cerrados.Value = fecha_inicio.ToString("yyyy-MM-dd");
                inp_fec_fin_cerrados.Value = fecha_fin.ToString("yyyy-MM-dd");

                Inp_fe_ini_creado_asignados.Value = fecha_inicio.ToString("yyyy-MM-dd");
                Inp_fe_fin_creado_asignados.Value = fecha_fin.ToString("yyyy-MM-dd");

                inp_trabajados_ini.Value = fecha_inicio.ToString("yyyy-MM-dd");
                inp_trabajados_fin.Value = fecha_fin.ToString("yyyy-MM-dd");

                inp_fecha_ini_estados.Value = fecha_inicio.ToString("yyyy-MM-dd");
                inp_fecha_fin_estados.Value = fecha_fin.ToString("yyyy-MM-dd");

                inp_fecha_ini_empresas.Value = fecha_inicio.ToString("yyyy-MM-dd");
                inp_fecha_fin_empresas.Value = fecha_fin.ToString("yyyy-MM-dd");

                inp_fecha_ini_creditos.Value = fecha_inicio.ToString("yyyy-MM-dd");
                inp_fecha_fin_creditos.Value = fecha_fin.ToString("yyyy-MM-dd");
            }



        }



        protected void Lbl_N_Abiertos_Load(object sender, EventArgs e)
        {
            myparametro = datos.traer_abiertos();
            Lbl_N_Abiertos.Text = Convert.ToString(myparametro.N_abiertos);
        }

        protected void Lbl_N_pendientes_Load(object sender, EventArgs e)
        {
            myparametro = datos.traer_pendientes();
            Lbl_N_pendientes.Text = Convert.ToString(myparametro.N_Pendientes);
        }

        protected void Lbl_NResueltos_Load(object sender, EventArgs e)
        {
            myparametro = datos.traer_resueltos();
            Lbl_NResueltos.Text = Convert.ToString(myparametro.N_Resueltos);

        }
       

        protected void Enproceso_Load(object sender, EventArgs e)
        {
            myparametro = datos.traer_Enproceso();
            Lbl_Enproceso.Text = Convert.ToString(myparametro.N_Cerrados);

        }



        protected void exportar_empresa_Click(object sender, EventArgs e)
        {
            grilla_tickets_por_empresa.Visible = true;
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Lista tickets creados por empresa" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            grilla_tickets_por_empresa.GridLines = GridLines.Both;
            grilla_tickets_por_empresa.HeaderStyle.Font.Bold = true;
            grilla_tickets_por_empresa.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            grilla_tickets_por_empresa.Visible = false;
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // necesario para evitar el error de tiempo de ejecución "
            // El control 'GridView1' de tipo 'GridView' debe colocarse dentro de una etiqueta de formulario con runat = server.
        }

        protected void Btn_Todos_cerrados_por_agente_Click(object sender, EventArgs e)
        {
            Grilla_cerrados_por_consultor.Visible = true;
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Lista tickets cerrados por consultor" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            Grilla_cerrados_por_consultor.GridLines = GridLines.Both;
            Grilla_cerrados_por_consultor.HeaderStyle.Font.Bold = true;
            Grilla_cerrados_por_consultor.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            Grilla_cerrados_por_consultor.Visible = false;
        }

        protected void Btn_exportar_tickets_estados_Click(object sender, EventArgs e)
        {
            Grilla_por_estados.Visible = true;

            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Lista de tickets por estado" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            Grilla_por_estados.GridLines = GridLines.Both;
            Grilla_por_estados.HeaderStyle.Font.Bold = true;
            Grilla_por_estados.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

            Grilla_por_estados.Visible = false;


        }

        protected void Btn_exportar_tickets_creados_Click(object sender, EventArgs e)
        {
            Grilla_tickets_creados.Visible = true;
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Tickets Creados" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            Grilla_tickets_creados.GridLines = GridLines.Both;
            Grilla_tickets_creados.HeaderStyle.Font.Bold = true;
            Grilla_tickets_creados.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            Grilla_tickets_creados.Visible = false;
        }

        protected void Btn_exportar_Trabajados_Click(object sender, EventArgs e)
        {
            Grilla_Ticket_trabajado_fecha.Visible = true;
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Lista tickets trabajados" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            Grilla_Ticket_trabajado_fecha.GridLines = GridLines.Both;
            Grilla_Ticket_trabajado_fecha.HeaderStyle.Font.Bold = true;
            Grilla_Ticket_trabajado_fecha.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            Grilla_Ticket_trabajado_fecha.Visible = false;



            
        }

       

        protected void Btn_creditos_por_consultor_Click(object sender, EventArgs e)
        {
            Grilla_creditos_tickets2.Visible = true;
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Lista tickets trabajados" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application / vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            Grilla_creditos_tickets2.GridLines = GridLines.Both;
            Grilla_creditos_tickets2.HeaderStyle.Font.Bold = true;
            Grilla_creditos_tickets2.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            Grilla_creditos_tickets2.Visible = false;
        }

        protected void cerrados_por_agente()
        {
            if (inp_fec_ini_cerrados.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de inicio vacio', confirmButtonText: 'Ok' })  ", true);
            }
            else
            {
                if (inp_fec_fin_cerrados.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de fin vacio', confirmButtonText: 'Ok' })  ", true);
                }
                else
                {
                    string hora_inicio = "00:00:00", hora_fin = "23:59:59";

                    List<Visualizar_Tickets> visualizar = new List<Visualizar_Tickets>();
                    List<Visualizar_Tickets> visualizar_grafica = new List<Visualizar_Tickets>();
                    DateTime fecha_ini = Convert.ToDateTime(inp_fec_ini_cerrados.Value + " " + hora_inicio + "");
                    DateTime fecha_fin = Convert.ToDateTime(inp_fec_fin_cerrados.Value + " " + hora_fin + "");
                    int top_cerrados = Convert.ToInt32(list_top_cerrados.SelectedValue);


                    visualizar_grafica = datos.lista_tickets_cerrados_grafica(top_cerrados, fecha_ini, fecha_fin);
                    visualizar = datos.lista_tickets_cerrados_grilla(fecha_ini, fecha_fin);


                    Grilla_cerrados_por_consultor.DataSourceID = "";
                    Grilla_cerrados_por_consultor.DataSource = visualizar;
                    Grilla_cerrados_por_consultor.DataBind();

                    grafica_cerrados_agente.DataSourceID = "";
                    grafica_cerrados_agente.DataSource = visualizar_grafica/* Grilla_cerrados_por_consultor.DataSource*/;
                    grafica_cerrados_agente.DataBind();



                }
            }
        }
        protected void Btn_cerrados_agente_Click1(object sender, EventArgs e)
        {

            cerrados_por_agente();
        }
        protected void grafica_cerrados_agente_Load(object sender, EventArgs e)
        {
            cerrados_por_agente();


        }
        protected void Grilla_cerrados_por_consultor_Load(object sender, EventArgs e)
        {
            cerrados_por_agente();

        }

        protected void list_top_cerrados_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Grilla_cerrados_por_consultor.DataSourceID == "")
            {
                cerrados_por_agente();
            }

        }
        protected void creados_y_asignados_por_agente()
        {
            if (Inp_fe_ini_creado_asignados.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de inicio vacio', confirmButtonText: 'Ok' })  ", true);
            }
            else
            {
                if (Inp_fe_fin_creado_asignados.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de fin vacio', confirmButtonText: 'Ok' })  ", true);
                }
                else
                {
                    string hora_inicio = "00:00:00", hora_fin = "23:59:59";

                    List<Visualizar_Tickets> visualizar = new List<Visualizar_Tickets>();
                    List<Visualizar_Tickets> visualizar_grafica = new List<Visualizar_Tickets>();
                    DateTime fecha_ini = Convert.ToDateTime(Inp_fe_ini_creado_asignados.Value + " " + hora_inicio + "");
                    DateTime fecha_fin = Convert.ToDateTime(Inp_fe_fin_creado_asignados.Value + " " + hora_fin + "");
                    int top_cerrados = Convert.ToInt32(List_creados_asignados.SelectedValue);


                    visualizar_grafica = datos.lista_tickets_creados_grafica(top_cerrados, fecha_ini, fecha_fin);
                    visualizar = datos.lista_tickets_creados_grilla(fecha_ini, fecha_fin);


                    Grilla_tickets_creados.DataSourceID = "";
                    Grilla_tickets_creados.DataSource = visualizar;
                    Grilla_tickets_creados.DataBind();

                    Grafica_abiertos_asignados_agente.DataSourceID = "";
                    Grafica_abiertos_asignados_agente.DataSource = visualizar_grafica /*Grilla_tickets_creados.DataSource = visualizar*/;
                    Grafica_abiertos_asignados_agente.DataBind();

                }
            }
        }

        protected void Btn_buscar_creados_asignados_Click(object sender, EventArgs e)
        {
            creados_y_asignados_por_agente();

        }

        protected void Grafica_abiertos_asignados_agente_Load(object sender, EventArgs e)
        {
            creados_y_asignados_por_agente();
        }

        protected void Grilla_tickets_creados_Load(object sender, EventArgs e)
        {
            creados_y_asignados_por_agente();
        }

        protected void List_creados_asignados_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Grilla_tickets_creados.DataSourceID == "")
            {
                creados_y_asignados_por_agente();
            }
        }

        protected void trabajados_por_agente()
        {
            if (inp_trabajados_ini.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de inicio vacio', confirmButtonText: 'Ok' })  ", true);
            }
            else
            {
                if (inp_trabajados_fin.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de fin vacio', confirmButtonText: 'Ok' })  ", true);
                }
                else
                {
                    string hora_inicio = "00:00:00", hora_fin = "23:59:59";
                    List<Visualizar_Tickets> tickets_trabajados_griv = new List<Visualizar_Tickets>();
                    List<Visualizar_Tickets> tickets_trabajados_grafica = new List<Visualizar_Tickets>();
                    DateTime fecha_ini = Convert.ToDateTime(inp_trabajados_ini.Value + " " + hora_inicio + "");
                    DateTime fecha_fin = Convert.ToDateTime(inp_trabajados_fin.Value + " " + hora_fin + "");
                    int top_trabajados = Convert.ToInt32(List_tickets_trabajados.SelectedValue);

                    tickets_trabajados_grafica = datos.lista_tickets_trabajados_grafica(top_trabajados, fecha_ini, fecha_fin);
                    tickets_trabajados_griv = datos.lista_tickets_trabajados_grilla(fecha_ini, fecha_fin);

                    Grilla_Ticket_trabajado_fecha.DataSourceID = "";
                    Grilla_Ticket_trabajado_fecha.DataSource = tickets_trabajados_griv;
                    Grilla_Ticket_trabajado_fecha.DataBind();

                    Grafica_Ticket_trabajados.DataSourceID = "";
                    Grafica_Ticket_trabajados.DataSource = tickets_trabajados_grafica;
                    Grafica_Ticket_trabajados.DataBind();
                }
            }
        }

        protected void Btn_buscar_trabajados_Click(object sender, EventArgs e)
        {
            trabajados_por_agente();
        }

        protected void List_tickets_trabajados_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Grafica_Ticket_trabajados.DataSourceID == "")
            {
                trabajados_por_agente();
            }
        }



        protected void Grilla_Ticket_trabajado_fecha_Load(object sender, EventArgs e)
        {
            trabajados_por_agente();
        }

        protected void Grafica_Ticket_trabajados_Load(object sender, EventArgs e)
        {
            trabajados_por_agente();
        }

        protected void tickets_por_estados()
        {
            if (inp_fecha_ini_estados.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de inicio vacio', confirmButtonText: 'Ok' })  ", true);
            }
            else
            {
                if (inp_fecha_fin_estados.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de fin vacio', confirmButtonText: 'Ok' })  ", true);
                }
                else
                {
                    string hora_inicio = "00:00:00", hora_fin = "23:59:59";
                    List<Visualizar_Tickets> Tickets_estados_griv = new List<Visualizar_Tickets>();
                    List<Visualizar_Tickets> Tickets_estados_grafica = new List<Visualizar_Tickets>();
                    DateTime fecha_ini = Convert.ToDateTime(inp_fecha_ini_estados.Value + " " + hora_inicio + "");
                    DateTime fecha_fin = Convert.ToDateTime(inp_fecha_fin_estados.Value + " " + hora_fin + "");
                    int top_trabajados = Convert.ToInt32(List_tickets_trabajados.SelectedValue);

                    Tickets_estados_griv = datos.lista_tickets_por_estado_grilla(fecha_ini, fecha_fin);
                    Tickets_estados_grafica = datos.lista_tickets_por_estado_grafica(fecha_ini, fecha_fin);

                    Grilla_por_estados.DataSourceID = "";
                    Grilla_por_estados.DataSource = Tickets_estados_griv;
                    Grilla_por_estados.DataBind();

                    Grafica_tickets_por_estado.DataSourceID = "";
                    Grafica_tickets_por_estado.DataSource = Tickets_estados_grafica;
                    Grafica_tickets_por_estado.DataBind();






                }
            }
        }

        protected void Btn_buscar_estados_Click(object sender, EventArgs e)
        {
            tickets_por_estados();
        }

        protected void Grafica_tickets_por_estado_Load(object sender, EventArgs e)
        {
            tickets_por_estados();
        }


        protected void tickets_por_empresas()
        {
            if (inp_fecha_ini_empresas.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de inicio vacio', confirmButtonText: 'Ok' })  ", true);
            }
            else
            {
                if (inp_fecha_fin_empresas.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de fin vacio', confirmButtonText: 'Ok' })  ", true);
                }
                else
                {
                    string hora_inicio = "00:00:00", hora_fin = "23:59:59";
                    List<Visualizar_Tickets> tickets_empresas_griv = new List<Visualizar_Tickets>();
                    List<Visualizar_Tickets> tickets_empresas_grafica = new List<Visualizar_Tickets>();
                    DateTime fecha_ini = Convert.ToDateTime(inp_fecha_ini_empresas.Value + " " + hora_inicio + "");
                    DateTime fecha_fin = Convert.ToDateTime(inp_fecha_fin_empresas.Value + " " + hora_fin + "");
                    int top_trabajados = Convert.ToInt32(List_tick_empresas.SelectedValue);

                    tickets_empresas_griv = datos.lista_tickets_por_empresa_grilla(fecha_ini, fecha_fin);
                    tickets_empresas_grafica = datos.lista_tickets_por_empresa_grafica(top_trabajados, fecha_ini, fecha_fin);


                    grilla_tickets_por_empresa.DataSourceID = "";
                    grilla_tickets_por_empresa.DataSource = tickets_empresas_griv;
                    grilla_tickets_por_empresa.DataBind();

                    Grafica_tickets_por_empresa.DataSourceID = "";
                    Grafica_tickets_por_empresa.DataSource = tickets_empresas_grafica;
                    Grafica_tickets_por_empresa.DataBind();

                    SetFocus(Grafica_tickets_por_empresa);

                }
            }
        }

        protected void Btn_buscar_empresas_Click(object sender, EventArgs e)
        {
            
            tickets_por_empresas();
        }

        protected void List_tick_empresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            tickets_por_empresas();

        }
        protected void Grafica_tickets_por_empresa_Load(object sender, EventArgs e)
        {
            tickets_por_empresas();
        }

        protected void Creditos_por_consultor()
        {
            if (inp_fecha_ini_creditos.Value == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de inicio vacio', confirmButtonText: 'Ok' })  ", true);
            }
            else
            {
                if (inp_fecha_fin_creditos.Value == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', title: 'Campo vacio', text: ' Rango de fecha de fin vacio', confirmButtonText: 'Ok' })  ", true);
                }
                else
                {
                    string hora_inicio = "00:00:00", hora_fin = "23:59:59";
                    List<Visualizar_Tickets> tickets_creditos_consultor_griv = new List<Visualizar_Tickets>();
                    List<Visualizar_Tickets> tickets_creditos_consultor_grafica = new List<Visualizar_Tickets>();
                    DateTime fecha_ini = Convert.ToDateTime(inp_fecha_ini_creditos.Value + " " + hora_inicio + "");
                    DateTime fecha_fin = Convert.ToDateTime(inp_fecha_fin_creditos.Value + " " + hora_fin + "");
                    int top_trabajados = Convert.ToInt32(List_creditos_consult.SelectedValue);

                    tickets_creditos_consultor_grafica = datos.lista_creditos_por_agente_grilla(top_trabajados, fecha_ini, fecha_fin);
                    tickets_creditos_consultor_griv = datos.lista_creditos_por_agente_grilla_export(fecha_ini, fecha_fin);

                    Grilla_creditos_tickets.DataSourceID = "";
                    Grilla_creditos_tickets.DataSource = tickets_creditos_consultor_grafica;
                    Grilla_creditos_tickets.DataBind();

                    Grilla_creditos_tickets2.DataSourceID = "";
                    Grilla_creditos_tickets2.DataSource = tickets_creditos_consultor_griv;
                    Grilla_creditos_tickets2.DataBind();

                }
            }
        }

        protected void Btn_Buscar_creditos_Click(object sender, EventArgs e)
        {
            Creditos_por_consultor();
        }

        protected void Grilla_creditos_tickets_Load(object sender, EventArgs e)
        {
            Creditos_por_consultor();
        }

        protected void List_creditos_consult_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Grilla_creditos_tickets.DataSourceID == "")
            {
                Creditos_por_consultor();
            }
            
        }
    }    
}