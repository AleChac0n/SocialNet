using Microsoft.AspNetCore.Mvc;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Controllers
{
    public class ReaccionController : Controller
    {
        private readonly IPublicacionModel _model;

        public ReaccionController(IPublicacionModel model)
        {
            _model = model;
        }


    }
}
