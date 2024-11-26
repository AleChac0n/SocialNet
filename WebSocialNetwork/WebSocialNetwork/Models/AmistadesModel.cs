using System.Net.Http;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Models
{
    public class AmistadesModel(HttpClient _httpClient, IConfiguration _configuration): IAmistadesModel
    {

        public AmistadesEntRespuesta ConsultarAmistad(long ID_UsuarioBuscador,long ID_UsuarioPerfil)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Amistades/ConsultarAmistad?ID_UsuarioBuscador=" + ID_UsuarioBuscador + "&ID_UsuarioPerfil=" + ID_UsuarioPerfil;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<AmistadesEntRespuesta>().Result;

            return null;
        }

        public AmistadesEntRespuesta EnviarSolicitudAmistad(AmistadesEnt entidad)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Amistades/EnviarSolicitudAmistad";
            JsonContent body = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, body).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<AmistadesEntRespuesta>().Result;

            return null;
        }
    }
}
