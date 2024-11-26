using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Models;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Controllers
{
    public class RecuperarCuenta(IUsuarioModel _usuarioModel, IUtilitariosModel _utilitariosModel) : Controller
    {
        [HttpGet]
        public IActionResult RecuperacionCuenta() { 
            return View();
        }

        [HttpPost]
        public IActionResult RecuperacionCuenta(Usuario entidad)
        {
            //Validacion de que se ingreso el correo
            if (string.IsNullOrEmpty(entidad.Correo)) {
                ViewBag.MsjPantalla = "Ingrese el correo";
                return View();
            }

            var resp = _usuarioModel.EnviarContrasennaTemporal(entidad);

            if (resp.Codigo == "00") {
                TempData["Correo"] = entidad.Correo;
                return RedirectToAction("RestablecerContrasenna", "RecuperarCuenta");
            }
            else {
                ViewBag.MsjPantalla = resp.Mensaje;
            }
            return View();
            
            
        }

        [HttpGet]
        public IActionResult RestablecerContrasenna() {
            Usuario entidad = new Usuario();
            entidad.Correo = TempData["Correo"].ToString();
            return View(entidad);
        }

        [HttpPost]
        public IActionResult RestablecerContrasenna(Usuario entidad)
        {
            //Validacion de que se ingreso el correo
            if (string.IsNullOrEmpty(entidad.Correo) || string.IsNullOrEmpty(entidad.Contrasenna) || string.IsNullOrEmpty(entidad.ContrasennaTemporal))
            {
                ViewBag.MsjPantalla = "Ingrese la contraseña temporal y la nueva contraseña.";
                return View();
            }
            entidad.Contrasenna = _utilitariosModel.Encrypt(entidad.Contrasenna);
            entidad.ContrasennaTemporal = _utilitariosModel.Encrypt(entidad.ContrasennaTemporal);
            var resp = _usuarioModel.RestablecerContrasennaEIniciarSesion(entidad);

            if (resp.Codigo == "00")
            {

                _usuarioModel.CrearVariablesDeSesion(resp,HttpContext);

                TempData["exitoso"] = "¡Bienvenido de vuelta!";
                return RedirectToAction("Inicio", "Home");

            }
            else
            {
                ViewBag.MsjPantalla = resp.Mensaje;
            }

            entidad.Correo = TempData["Correo"].ToString();
            return View(entidad);

        }






    }
}
