using WebSocialNetwork.Entities;

namespace WebSocialNetwork.Services
{
    public interface IAmistadesModel
    {
        AmistadesEntRespuesta ConsultarAmistad(long ID_UsuarioBuscador, long ID_UsuarioPerfil);
        AmistadesEntRespuesta EnviarSolicitudAmistad(AmistadesEnt entidad);
    }
}
