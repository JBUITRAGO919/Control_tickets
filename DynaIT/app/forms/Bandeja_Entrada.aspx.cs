using DynaIT.Clases;

using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop.Excel;
using DataTable = System.Data.DataTable;
using ClosedXML.Excel;

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
            DateTime fecha_inicio_ayer = fecha_inicio.AddDays(-1);
            DateTime fecha_fin_ayer = fecha_fin.AddDays(-1);
            lbl_fecha_dia_anterior_ini.Text = Convert.ToString(fecha_inicio_ayer);
            lbl_fecha_dia_anterior_fin.Text = Convert.ToString(fecha_fin_ayer);

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

        protected void Lbl_N_Cerrados_Load(object sender, EventArgs e)
        {
            myparametro = datos.traer_cerrados();
            Lbl_N_Cerrados.Text = Convert.ToString(myparametro.N_Cerrados);

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

        protected void Btn_Buscar_creditos_Click(object sender, EventArgs e)
        {

        }
    }
}