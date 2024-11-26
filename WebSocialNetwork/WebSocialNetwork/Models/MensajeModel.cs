using System.Net.Http;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Models
{
    public class MensajeModel(IConfiguration _configuration, HttpClient _httpClient) : IMensajesModel
    {
        public List<Mensaje> ConsultarMensajesPorChat(int ChatId)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Mensajes/ConsultarMensajesPorChat?ChatId=" + ChatId;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<Mensaje>>().Result;

            return null;
        }

        public Mensaje ConsultarMensajePorId(int IdMensaje)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Mensajes/ConsultarMensajePorId?IdMensaje=" + IdMensaje;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<Mensaje>().Result;

            return null;
        }

        public int NuevoMensaje(Mensaje entidad)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Mensajes/NuevoMensaje";
            JsonContent datos = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, datos).Result;

            if (resp.IsSuccessStatusCode)
            {
                return resp.Content.ReadFromJsonAsync<int>().Result;
            }
            return 0;
        }
    }
}
