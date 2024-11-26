using System.Text.RegularExpressions;
using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using WebSocialNetwork.Entities;
using WebSocialNetwork.EntityFramework;
using WebSocialNetwork.Helpers;
using WebSocialNetwork.Hubs;
using WebSocialNetwork.Models.ViewModels;
using WebSocialNetwork.Services;

namespace WebSocialNetwork.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly int FileSizeLimit;
        private readonly string[] AllowedExtensions;
        private readonly AppDbContext _context;
        private readonly IMapper _mapper;
        private readonly IWebHostEnvironment _environment;
        private readonly IHubContext<ChatHub> _hubContext;
        private readonly IFileValidator _fileValidator;
        private readonly IUsuarioModel _usuario;

        public UploadController(AppDbContext context,
            IMapper mapper,
            IWebHostEnvironment environment,
            IHubContext<ChatHub> hubContext,
            IConfiguration configruation,
            IFileValidator fileValidator, 
            IUsuarioModel usuario)
        {
            _usuario = usuario;
            _context = context;
            _mapper = mapper;
            _environment = environment;
            _hubContext = hubContext;
            _fileValidator = fileValidator;

            FileSizeLimit = configruation.GetSection("FileUpload").GetValue<int>("FileSizeLimit");
            AllowedExtensions = configruation.GetSection("FileUpload").GetValue<string>("AllowedExtensions").Split(",");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Upload([FromForm] UploadViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                if (!_fileValidator.IsValid(viewModel.File))
                    return BadRequest("Validation failed!");

                var fileName = DateTime.Now.ToString("yyyymmddMMss") + "_" + Path.GetFileName(viewModel.File.FileName);
                var folderPath = Path.Combine(_environment.WebRootPath, "uploads");
                var filePath = Path.Combine(folderPath, fileName);
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await viewModel.File.CopyToAsync(fileStream);
                }

                var usuarioId = long.Parse(HttpContext.Session.GetString("IdUsuario"));

                var user = _usuario.ConsultarUsuarioPorId(usuarioId);

                var room = _context.Tbl_Chats.Where(r => r.Id == viewModel.RoomId).FirstOrDefault();
                if (user == null || room == null)
                    return NotFound();

                string htmlImage = string.Format(
                    "<a href=\"/uploads/{0}\" target=\"_blank\">" +
                    "<img src=\"/uploads/{0}\" class=\"post-image\">" +
                    "</a>", fileName);

                var message = new Mensaje()
                {
                    Content = Regex.Replace(htmlImage, @"(?i)<(?!img|a|/a|/img).*?>", string.Empty),
                    Timestamp = DateTime.Now,
                    FromUser = user,
                    ToRoom = room
                };

                await _context.Tbl_Mensajes.AddAsync(message);
                await _context.SaveChangesAsync();

                // Send image-message to group
                var messageViewModel = _mapper.Map<Mensaje, MessageViewModel>(message);
                await _hubContext.Clients.Group(room.Name).SendAsync("newMessage", messageViewModel);

                return Ok();
            }

            return BadRequest();
        }
    }
}
