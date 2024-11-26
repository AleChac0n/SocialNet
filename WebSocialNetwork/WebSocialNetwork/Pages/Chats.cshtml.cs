using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace WebSocialNetwork.Pages
{
    public class ChatsModel : PageModel
    {
        private readonly ILogger<ChatsModel> _logger;

        public ChatsModel(ILogger<ChatsModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {

        }
    }
}
