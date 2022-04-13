//using MySql.Data;
//using MySql.Data.MySqlClient;
using DynaIT.Clases;
using System;

namespace DynaIT.app.forms
{
    public partial class perfil_Usuario : System.Web.UI.Page
    {

        Clase_Parametros clase_Parametros = new Clase_Parametros();
        Gestion_Datos Gestion_Datos = new Gestion_Datos();
        string correo;
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (!IsPostBack)
            //{
            if (Request.QueryString["correos"] == null)

                return;

            correo = Request.QueryString["correos"].ToString();

            //se declara la variable tipo sesión que permite llevar datos o cadenas de string entre formularios           
            Session["correos_inicio_sesion"] = correo;
            cargar_datos_ticket();
            ocultar_div();

            //}


        }
        private void cargar_datos_ticket()
        {
            string rol_inicio_usuario = (string)Session["rol_usuario"];
            string rol_inicio_cliente = (string)Session["rol_cliente"];

            lbl_correo_cliente.Text = rol_inicio_cliente;
            lbl_correo_usuario.Text = rol_inicio_usuario;


            if (rol_inicio_usuario != null)
            {
                clase_Parametros = Gestion_Datos.traer_nombre_rol_Usuario(correo);

                int id_usuario = clase_Parametros.Id_usuario;
                lbl_nombre_usuario.Text = clase_Parametros.Nombre_Usuario;
                Lbl_cargo.Text =Convert.ToString(clase_Parametros.Rol_usuario);
                Lbl_cargo_tex.Text = clase_Parametros.Rol_usu_tex;

            }
            else
            {
                if (rol_inicio_cliente != null)
                {


                    clase_Parametros = Gestion_Datos.traer_nombre_rol_cliente(correo);

                    int id_usuario = clase_Parametros.idCliente;
                    lbl_nombre_usuario.Text = clase_Parametros.Nombre_Cliente;
                    Lbl_cargo.Text = Convert.ToString(clase_Parametros.Rol_Cliente);
                    int Id_Empresa_cliente = clase_Parametros.Id_Empresa_cliente;
                    Lbl_cargo_tex.Text = clase_Parametros.Rol_Cli;


                }
            }



        }


        private void ocultar_div()
        {
            if (Lbl_cargo.Text == "3")
            {
                Div_menu_tickets.Visible = true;
                idGenerar_Ticket.Visible = false;
                li_acta.Visible = false;
                Li_Dashboard.Visible = false;
            }
            else
            {
                if (Lbl_cargo.Text == "2")
                {
                    Div_menu_tickets.Visible = true;
                    Div_empresas_clientes.Visible = true;
                    Div_usuarios_grupos.Visible = true;
                    Div_actualizaciones.Visible = true;
                }
                else
                {
                    if (Lbl_cargo.Text == "5")
                    {
                        Div_menu_tickets.Visible = true;
                        li_acta.Visible = false;
                        Li_Dashboard.Visible = false;
                    }
                    else
                    {
                        if (Lbl_cargo.Text == "4")
                        {
                            Div_menu_tickets.Visible = true;
                            Div_empresas_clientes.Visible = true;

                            a_crearEmpresa.Visible = false;
                            li_acta.Visible = false;
                            Li_Dashboard.Visible = false;

                        }
                    }

                }

            }
        }




    }
}