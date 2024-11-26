using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Models;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Controllers
{
    public class HomeController(IPublicacionModel _publicacionModel) : Controller
    {

        [Seguridad]
        [HttpGet]
        public IActionResult Inicio()
        {
            var publicaciones = _publicacionModel.ConsultarPublicaciones();

            ViewBag.Publicaciones = publicaciones;

            return View();
        }




    }
}
