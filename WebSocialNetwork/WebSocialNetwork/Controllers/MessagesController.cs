using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using System.Text.RegularExpressions;
using WebSocialNetwork.Hubs;
using WebSocialNetwork.Services;
using WebSocialNetwork.Entities;
using WebSocialNetwork.ViewModels;
using WebSocialNetwork.EntityFramework;
using WebSocialNetwork.Models;

namespace WebSocialNetwork.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class MessagesController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext;
        private readonly AppDbContext _context;
        private readonly IUsuarioModel _usuarioModel;

        public MessagesController(IMapper mapper, IHubContext<ChatHub> hubContext, AppDbContext context, IUsuarioModel usuarioModel)
        {
            _mapper = mapper;
            _hubContext = hubContext;
            _context = context;
            _usuarioModel = usuarioModel;
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<Chat>> Get(int id)
        {

            var mensaje = await _context.Tbl_Mensajes.FindAsync(id);

            if (mensaje == null)
                return NotFound();

            var messageViewModel = _mapper.Map<Mensaje, MessageViewModel>(mensaje);
            return Ok(messageViewModel);
        }

        [HttpGet("Room/{roomName}")]
        public IActionResult GetMessages(string roomName)
        {

            var chat = _context.Tbl_Chats.FirstOrDefault(x => x.Name == roomName);

            if (chat == null)
                return BadRequest();

            var mensajes = _context.Tbl_Mensajes.Where(m => m.ToRoomId == chat.Id)
               .Include(m => m.FromUser)
               .Include(m => m.ToRoom)
               .OrderByDescending(m => m.Timestamp)
               .AsEnumerable()
               .Reverse()
               .ToList();

            var messagesViewModel = _mapper.Map<IEnumerable<Mensaje>, IEnumerable<MessageViewModel>>(mensajes);

            return Ok(messagesViewModel);
        }

        [HttpPost]
        public async Task<ActionResult<Mensaje>> Create(MessageViewModel viewModel)
        {

            var usuarioId = long.Parse(HttpContext.Session.GetString("IdUsuario"));
            var usuario = _usuarioModel.ConsultarUsuarioPorId(usuarioId);
            var usua = _context.Tbl_Usuarios.FirstOrDefault(x=>x.Correo == usuario.Correo);

            var chat = _context.Tbl_Chats.FirstOrDefault(x => x.Name == viewModel.Room);

            if (chat == null)
                return BadRequest();

            var msg = new Mensaje()
            {
                Content = Regex.Replace(viewModel.Content, @"<.*?>", string.Empty),
                FromUser = usua,
                ToRoom = chat,
                Timestamp = DateTime.Now
            };

            _context.Tbl_Mensajes.Add(msg);
            await _context.SaveChangesAsync();

            var mensajeCreado = _mapper.Map<Mensaje, MessageViewModel>(msg);
            await _hubContext.Clients.Group(chat.Name).SendAsync("newMessage", mensajeCreado);

            return CreatedAtAction(nameof(Get), new { id = msg.Id }, mensajeCreado);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {

            var emailUsuario = HttpContext.Session.GetString("Email");

            var message = await _context.Tbl_Mensajes
                .Include(u => u.FromUser)
                .Where(m => m.Id == id && m.FromUser.Correo == emailUsuario)
                .FirstOrDefaultAsync();

            if (message == null)
                return NotFound();

            _context.Tbl_Mensajes.Remove(message);
            await _context.SaveChangesAsync();

            await _hubContext.Clients.All.SendAsync("removeChatMessage", message.Id);

            return Ok();
        }
    }
}
