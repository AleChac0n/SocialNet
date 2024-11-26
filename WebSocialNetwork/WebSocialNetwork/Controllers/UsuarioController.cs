using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Controllers
{
    public class UsuarioController(IUsuarioModel _usuarioModel) : Controller
    {
        public IActionResult Perfil(long ID_Usuario)
        {
            var resp = _usuarioModel.PerfilUsuario(ID_Usuario);
            return View(resp);
        }

        [HttpGet]
        public IActionResult ConsultarUsuarioPorNombre(string Nombre)
        {
            var usuarios = _usuarioModel.ConsultarUsuarioPorNombre(Nombre);
            if (usuarios.Codigo == "00")
            {
                return Json(usuarios.Datos);
            }
            else {
                return null;
            }
        }
    }
}
