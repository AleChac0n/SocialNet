using WebSocialNetwork.Services;
using WebSocialNetwork.Entities;
using Microsoft.EntityFrameworkCore;
using System.Net.Http.Headers;
using ApiSocialNetwork.Entities;

namespace WebSocialNetwork.Models
{
    public class UsuarioModel(HttpClient _httpClient, IConfiguration _configuration, IHttpContextAccessor _context) : IUsuarioModel
    {
        public Respuesta RegistrarUsuario(Usuario entidad)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Usuario/RegistrarUsuario";
            JsonContent body = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, body).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<Respuesta>().Result;

            return null;
        }

        public UsuarioRespuesta IniciarSesion(Usuario entidad)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Usuario/IniciarSesion";
            JsonContent body = JsonContent.Create(entidad);
            var resp = _httpClient.PostAsync(url, body).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<UsuarioRespuesta>().Result;

            return null;
        }

        public Usuario PerfilUsuario(long ID_Usuario)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Usuario/PerfilUsuario?ID_Usuario=" + ID_Usuario;

            string token = _context.HttpContext?.Session.GetString("Token")!;
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var resp = _httpClient.GetAsync(url).Result;


            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<Usuario>().Result;

            return null;
        }


        public Respuesta EnviarContrasennaTemporal(Usuario entidad)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/RecuperarCuenta/EnviarContrasennaTemporal";
            JsonContent body = JsonContent.Create(entidad);
            var resp = _httpClient.PutAsync(url, body).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<Respuesta>().Result;

            return null;
        }


        public UsuarioRespuesta RestablecerContrasennaEIniciarSesion(Usuario entidad)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/RecuperarCuenta/RestablecerContrasennaEIniciarSesion";
            JsonContent body = JsonContent.Create(entidad);
            var resp = _httpClient.PutAsync(url, body).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<UsuarioRespuesta>().Result;

            return null;
        }


        public UsuarioRespuesta ModificarPerfil(Usuario entidad, long IdUsuario)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Usuario/ModificarPerfil?IdUsuario=" + IdUsuario;
            JsonContent datos = JsonContent.Create(entidad);

            string token = _context.HttpContext?.Session.GetString("Token")!;
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var resp = _httpClient.PutAsync(url, datos).Result;


            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<UsuarioRespuesta>().Result;

            return null;
        }

        public UsuarioEntity ConsultarUsuarioPorId(long IdUsuario)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Usuario/ConsultarUsuarioPorId?IdUsuario=" + IdUsuario;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<UsuarioEntity>().Result;

            return null;
        }

        public UsuarioRespuesta ConsultarUsuarioPorNombre(string Nombre)
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Usuario/ConsultarUsuarioPorNombre?Nombre=" + Nombre;
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<UsuarioRespuesta>().Result;

            return null;
        }


        public void CrearVariablesDeSesion(UsuarioRespuesta resp, HttpContext httpcontext)
        {

            httpcontext.Session.SetString("Login", "true");
            httpcontext.Session.SetString("Nombre", resp.Dato.Nombre);
            httpcontext.Session.SetString("Apellido1", resp.Dato.Apellido1);
            httpcontext.Session.SetString("Apellido2", resp.Dato.Apellido2);
            httpcontext.Session.SetString("FotoPerfil", resp.Dato.UrlFotoPerfil);
            httpcontext.Session.SetString("IdUsuario", resp.Dato.ID_Usuario.ToString());

        }


        public GenerosUsuarioEntRespuesta ConsultarGenerosUsuario()
        {
            string url = _configuration.GetSection("settings:UrlWebApi").Value + "api/Usuario/ConsultarGenerosUsuario";
            var resp = _httpClient.GetAsync(url).Result;

            if (resp.IsSuccessStatusCode)
                return resp.Content.ReadFromJsonAsync<GenerosUsuarioEntRespuesta>().Result;

            return null;
        }

    }
}
