using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Models;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.ViewComponents
{
    public class PublicacionesViewComponent(IPublicacionModel _publicacionModel) : ViewComponent
    {
        [Seguridad]
        [HttpGet]
        public IViewComponentResult Invoke(long idUsuario)
        {
            

            var resp = _publicacionModel.PublicacionesPerfil(idUsuario);
            return View(resp);
        }
    }
}
