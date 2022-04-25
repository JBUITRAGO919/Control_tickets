using DynaIT.Clases;
using System;
using System.Web.UI;

namespace DynaIT.app.forms
{
    public partial class Recuperar_Contraseña : System.Web.UI.Page
    {
        Validaciones validaciones = new Validaciones();
        Clase_Parametros Clase_Parametros = new Clase_Parametros();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_recupera_contraseña_Click(object sender, EventArgs e)
        {


            if (Txt_correo_recupera.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'error', title: 'Campo vacio'; text: ' No se ha ingresado el correo ', confirmButtonText: 'Ok' })  ", true);
            }
            else
            {
                if (validaciones.recuperar_contraseña_usuario(Txt_correo_recupera.Text) == true)
                {

                    Response.Redirect("../login.aspx");


                    ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'succes', text: 'Se enviaron las credenciales del usuario al correo', confirmButtonText: 'Ok' })  ", true);


                }
                else
                {
                    if (validaciones.recuperar_contraseña_cliente(Txt_correo_recupera.Text) == true)
                    {
                        Response.Redirect("../login.aspx");

                        ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'succes', text: ' Se enviaron las credenciales del cliente al correo ', confirmButtonText: 'Ok' })  ", true);


                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "", " Swal.fire({ position: 'top-center', icon: 'warning', text: ' El correo ingresado no se encuentra registrado ', confirmButtonText: 'Ok' })  ", true);

                    }
                }





            }
        }
    }
}