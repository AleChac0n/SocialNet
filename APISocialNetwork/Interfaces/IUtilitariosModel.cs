namespace ApiSocialNetwork.Services
{
    public interface IUtilitariosModel
    {
        string GenerarToken(string correo);
        string Encrypt(string texto);
        string GenerarNuevaContrasena();
        void EnviarCorreo(string Destinatario, string Asunto, string Mensaje);
    }
}
