using Microsoft.AspNetCore.Mvc;

namespace ApiSocialNetwork.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
