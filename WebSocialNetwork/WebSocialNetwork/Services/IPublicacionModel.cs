using Microsoft.Extensions.Configuration;
using System.Configuration;
using System.Net.Http;
using WebSocialNetwork.Entities;

namespace WebSocialNetwork.Services
{
    public interface IPublicacionModel
    {
        List<Publicacion> ConsultarPublicaciones();
        List<Publicacion> ConsultarPublicacionesPorUsuario(long ID_Usuario);
        Respuesta CrearPublicacion(Publicacion entidad);
        List<Publicacion> PublicacionesPerfil(long ID_Usuario);
        int EliminarPublicacion(long ID_Publicacion);
        Respuesta CrearReacciones(long ID_Publicacion, long ID_Usuario, string TipoReaccion);
        Publicacion ConsultarReaccionesPorPublicacion(long ID_Publicacion);

    }
}
