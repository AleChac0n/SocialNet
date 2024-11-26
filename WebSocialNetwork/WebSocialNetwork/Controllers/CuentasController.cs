using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;
using WebSocialNetwork.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using ApiSocialNetwork.Entities;

namespace WebSocialNetwork.Controllers
{
    [ResponseCache(NoStore = true, Duration = 0)]
    public class CuentasController(IUsuarioModel _usuarioModel, IUtilitariosModel _utilitariosModel, IPublicacionModel _publicacionModel, IAmistadesModel _amistadesModel) : Controller
    {

        [HttpGet]
        public IActionResult IniciarSesion()
        {
            HttpContext.Session.Clear();//Limpiar variables de sesion
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult IniciarSesion(Usuario entidad)
        {

            entidad.Contrasenna = _utilitariosModel.Encrypt(entidad.Contrasenna);
            var resp = _usuarioModel.IniciarSesion(entidad);

            if (resp.Codigo == "00")
            {
                HttpContext.Session.SetString("Login", "true");
                HttpContext.Session.SetString("Nombre", resp.Dato.Nombre);
                HttpContext.Session.SetString("Apellido1", resp.Dato.Apellido1);
                HttpContext.Session.SetString("Apellido2", resp.Dato.Apellido2);
                HttpContext.Session.SetString("FotoPerfil", resp.Dato.UrlFotoPerfil);
                HttpContext.Session.SetString("Email", resp.Dato.Correo);
                HttpContext.Session.SetString("IdUsuario", resp.Dato.ID_Usuario.ToString());
                HttpContext.Session.SetString("Token", resp?.Dato?.Token!);

                TempData["exitoso"] = "¡Bienvenido de vuelta!";
                return RedirectToAction("Inicio", "Home");
            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
                return View();
            }

        }

        [HttpGet]
        public IActionResult Registrarse()
        {
            HttpContext.Session.Clear();

            ViewBag.Generos = ObtenerDropDownGeneros();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Registrarse(Usuario entidad)
        {
            if (ModelState.IsValid)
            {
                entidad.Contrasenna = _utilitariosModel.Encrypt(entidad.Contrasenna);
                entidad.FullName = entidad.Nombre + " " + entidad.Apellido1 + " " + entidad.Apellido2;
                var resp = _usuarioModel.RegistrarUsuario(entidad);

                if (resp.Codigo == "00")
                {
                    TempData["exitoso"] = "Registro exitoso, ¡Inicia sesión!";
                    return RedirectToAction(nameof(IniciarSesion));
                }
                else
                {
                    ViewBag.Generos = ObtenerDropDownGeneros();
                    ViewBag.MsjPantalla = resp?.Mensaje;
                    return View(entidad);
                }
            }
            return View(entidad);
        }

        public IActionResult NuevaContrasena()
        {
            return View();
        }

        [Seguridad]
        [HttpGet]
        public IActionResult CerrarSesion()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("IniciarSesion", "Cuentas");
        }



        [Seguridad]
        [HttpGet]
        public IActionResult Perfil(long ID_Usuario)
        {
            var publicaciones = _publicacionModel.ConsultarPublicacionesPorUsuario(ID_Usuario);
            ViewBag.Publicaciones = publicaciones;
            var resp = _usuarioModel.PerfilUsuario(ID_Usuario);
            return View(resp);

        }

        [Seguridad]
        [HttpGet]
        public IActionResult ConfiguracionPerfil()
        {
            Usuario usuario = new Usuario();
            usuario.ID_Usuario = long.Parse(HttpContext.Session.GetString("IdUsuario"));

            var resp = _usuarioModel.PerfilUsuario(usuario.ID_Usuario);
            if (resp != null)
            {
                ViewBag.Generos = ObtenerDropDownGeneros();
                return View(resp);
            }
            else
            {
                return NotFound();
            }
        }


        [Seguridad]
        [HttpPost]
        public IActionResult ConfiguracionPerfil(IFormFile imgPerfil, Usuario entidad, [FromServices] IWebHostEnvironment env)
        {
            Usuario usuario = new Usuario();
            usuario.ID_Usuario = long.Parse(HttpContext.Session.GetString("IdUsuario"));


            if (imgPerfil != null)
            {
                string wwwrootPath = env.WebRootPath;
                string extension = Path.GetExtension(Path.GetFileName(imgPerfil.FileName));
                string ruta = Path.Combine(wwwrootPath, "images\\Perfiles\\", usuario.ID_Usuario + extension);
                entidad.UrlFotoPerfil = "/images/Perfiles/" + usuario.ID_Usuario + extension;

                using (var stream = new FileStream(ruta, FileMode.Create))
                {
                    imgPerfil.CopyTo(stream);
                }

            }
            else
            {
                entidad.UrlFotoPerfil = "";
            }

            var resp = _usuarioModel.ModificarPerfil(entidad, usuario.ID_Usuario);

            if (resp.Codigo == "00")
            {
                HttpContext.Session.SetString("Nombre", resp.Dato.Nombre);
                HttpContext.Session.SetString("Apellido1", resp.Dato.Apellido1);
                HttpContext.Session.SetString("Apellido2", resp.Dato.Apellido2);
                HttpContext.Session.SetString("FotoPerfil", resp.Dato.UrlFotoPerfil);
                HttpContext.Session.SetString("Email", resp.Dato.Correo);
                return RedirectToAction("ConfiguracionPerfil", "Cuentas");
            }
            else
            {
                return NotFound();
            }

        }



        public SelectList ObtenerDropDownGeneros()
        {
            List<GenerosUsuarioEnt> generos = [];
            var resp = _usuarioModel.ConsultarGenerosUsuario();
            if (resp?.Codigo == "00")
            {
                generos = resp.Datos;
            }
            else
            {
                ViewBag.MsjPantalla = resp?.Mensaje;
            }

            return new SelectList(generos, "ID_Genero", "Descripcion");
        }



    }
}
