using ApiSocialNetwork.Entities;
using WebSocialNetwork.Entities;

namespace WebSocialNetwork.Services
{
    public interface IUsuarioModel
    {
        Respuesta RegistrarUsuario(Usuario entidad);
        UsuarioRespuesta IniciarSesion(Usuario entidad);
        Usuario PerfilUsuario(long ID_Usuario);
        Respuesta EnviarContrasennaTemporal(Usuario entidad);
        UsuarioRespuesta RestablecerContrasennaEIniciarSesion(Usuario entidad);
        UsuarioRespuesta ModificarPerfil(Usuario entidad, long IdUsuario);
        UsuarioEntity ConsultarUsuarioPorId(long IdUsuario);
        void CrearVariablesDeSesion(UsuarioRespuesta resp, HttpContext httpcontext);
        GenerosUsuarioEntRespuesta ConsultarGenerosUsuario();
        UsuarioRespuesta ConsultarUsuarioPorNombre(string Nombre);

    }
}
