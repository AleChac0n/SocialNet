using WebSocialNetwork.Entities;

namespace WebSocialNetwork.Services
{
    public interface IMensajesModel
    {
        public List<Mensaje> ConsultarMensajesPorChat(int ChatId);
        public Mensaje ConsultarMensajePorId(int IdMensaje);
        public int NuevoMensaje(Mensaje entidad);
    }
}
