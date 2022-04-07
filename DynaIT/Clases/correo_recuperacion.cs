namespace DynaIT.Clases
{
    public class correo_recuperacion : Correo_servidor
    {
        public correo_recuperacion()
        {
            senderMail = "micjbuitragov@gmail.com";
            password = "Zafiro1020";
            host = "smtp.gmail.com";
            port = 587;
            ssl = true;

            initializeSmtpClient();

        }
    }
}