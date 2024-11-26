using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Models;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Controllers
{
    [ResponseCache(NoStore = true, Duration = 0)]
    public class AmistadesController(IAmistadesModel _amistadesModel) : Controller
    {
        [Seguridad]
        [HttpGet]
        public IActionResult EnviarSolicitudAmistad(long ID_Usuario)
        {

            AmistadesEnt entidad = new AmistadesEnt();
            entidad.ID_UsuarioEmisorSolicitud = int.Parse(HttpContext.Session.GetString("IdUsuario"));
            entidad.ID_UsuarioReceptorSolicitud = ID_Usuario;
            var respuesta = _amistadesModel.EnviarSolicitudAmistad(entidad);
            return Json(respuesta);
        }
    }
}
