using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Models
{
    public class PublicacionModel(HttpClient _httpClient, IConfiguration _configuration) : IPublicacionModel
    {
        public List<Publicacion> ConsultarPublicaciones()
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Publicacion/ConsultarPublicaciones";
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<Publicacion>>().Result;

            return null;
        }

        public List<Publicacion> ConsultarPublicacionesPorUsuario(long ID_Usuario)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Publicacion/ConsultarPublicacionesPorUsuario?ID_Usuario=" + ID_Usuario;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<Publicacion>>().Result;

            return null;
        }

        public Respuesta CrearPublicacion(Publicacion entidad)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Publicacion/CrearPublicacion";
            JsonContent body = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, body).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<Respuesta>().Result;

            return null;
        }

        public List<Publicacion> PublicacionesPerfil(long ID_Usuario)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Publicacion/PublicacionesPerfil?ID_Usuario=" + ID_Usuario;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<List<Publicacion>>().Result;

            return null;
        }
        public int EliminarPublicacion(long ID_Publicacion)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Publicacion/EliminarPublicacion?ID_Publicacion=" + ID_Publicacion;
            var resp = _httpClient.DeleteAsync(url).Result;

            if (resp.IsSuccessStatusCode)
            {
                return resp.Content.ReadFromJsonAsync<int>().Result;
            }

            return 0;
        }

        public Respuesta CrearReacciones(long ID_Publicacion, long ID_Usuario, string TipoReaccion)
        {

            var request = new Publicacion
            {
                ID_Publicacion = ID_Publicacion,
                ID_Usuario = ID_Usuario,
                TipoReaccion = TipoReaccion
            };

            JsonContent body = JsonContent.Create(request);

            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Reaccion/CrearReacciones";
            var resp = _httpClient.PostAsync(url, body).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<Respuesta>().Result;

            return null;
        }

        public Publicacion ConsultarReaccionesPorPublicacion(long ID_Publicacion)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Reaccion/ConsultarReaccionesPorPublicacion?ID_Publicacion=" + ID_Publicacion;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<Publicacion>().Result;

            return null;
        }


    }
}
