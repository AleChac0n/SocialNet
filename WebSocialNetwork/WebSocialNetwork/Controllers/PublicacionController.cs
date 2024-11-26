using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Controllers
{
    public class PublicacionController(IPublicacionModel _publicacionModel, IHostEnvironment _environment) : Controller
    {

        
        [HttpPost]
        public IActionResult CrearPublicacion(IFormFile imgPublicacion, Publicacion entidad)
        {
            string ext = Path.GetExtension(Path.GetFileName(imgPublicacion.FileName));
            string folder = Path.Combine(_environment.ContentRootPath, "wwwroot\\images\\Publicaciones");

            entidad.UrlFotoPublicacion = "/images/Publicaciones";

            entidad.ID_Usuario = long.Parse(HttpContext.Session.GetString("IdUsuario"));
            var resp = _publicacionModel.CrearPublicacion(entidad);

            if (resp.Codigo == "00")
            {
                string archivo = Path.Combine(folder, resp?.ConsecutivoGenerado + ext);
                using (Stream fileStream = new FileStream(archivo, FileMode.Create))
                {
                    imgPublicacion.CopyTo(fileStream);
                }
                return RedirectToAction("Inicio", "Home");
            }
            else
            {
                return RedirectToAction("Inicio", "Home");
            }
        }

        [HttpPost]
        public IActionResult EliminarPublicacion(long ID_Publicacion)
        {
            _publicacionModel.EliminarPublicacion(ID_Publicacion);
            return RedirectToAction("Inicio", "Home");
        }



        [HttpPost]
        public IActionResult CrearReacciones([FromBody] Publicacion parametros)
        {
            var ID_Publicacion = parametros.ID_Publicacion;
            var ID_Usuario = parametros.ID_Usuario;
            var TipoReaccion = parametros.TipoReaccion;

            var datos = _publicacionModel.CrearReacciones(ID_Publicacion, ID_Usuario, TipoReaccion);
            return Json(datos);

        }


        public IActionResult ConsultarReaccionesPorPublicacion(long ID_Publicacion)
        {
            var datos = _publicacionModel.ConsultarReaccionesPorPublicacion(ID_Publicacion);
            return View(datos);
        }



    }
}
