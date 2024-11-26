using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using WebSocialNetwork.Hubs;
using WebSocialNetwork.ViewModels;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Services;
using WebSocialNetwork.EntityFramework;
using Microsoft.EntityFrameworkCore;

namespace WebSocialNetwork.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class RoomsController : ControllerBase
    {
        private readonly IMapper _mapper;
        private readonly IHubContext<ChatHub> _hubContext;
        private readonly IUsuarioModel _modelUsuario;
        private readonly AppDbContext _context;

        public RoomsController(IMapper mapper, IHubContext<ChatHub> hubContext, IUsuarioModel modelUsuario, AppDbContext context)
        {
            _mapper = mapper;
            _hubContext = hubContext;
            _modelUsuario = modelUsuario;
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomViewModel>>> Get()
        {
            var usuarioId = long.Parse(HttpContext.Session.GetString("IdUsuario"));

            var chats = await _context.Tbl_Chats
               .Include(r => r.AppUsuario1)
               .Include(r => r.AppUsuario2)
               .Where(r => r.IdUsuario1 == usuarioId || r.IdUsuario2 == usuarioId)
               .ToListAsync();

            var roomsViewModel = _mapper.Map<IEnumerable<Chat>, IEnumerable<RoomViewModel>>(chats);
            return Ok(roomsViewModel);
        }

        //[HttpGet("{id}")]
        //public async Task<ActionResult<Room>> Get(int id)
        //{
        //    var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

        //    var usuario = _context.AppUsuarios.FirstOrDefaultAsync(u => u.Id == userId);

        //    var room = await _context.Rooms.FirstOrDefaultAsync(r => r.Id == id);

        //    if (room == null)
        //        return NotFound();

        //    var roomViewModel = _mapper.Map<Room, RoomViewModel>(room);
        //    return Ok(roomViewModel);
        //}


        [HttpPost]
        public async Task<ActionResult<int>> Create(RoomViewModel viewModel)
        {
            var usuarioId = long.Parse(HttpContext.Session.GetString("IdUsuario"));

            var existingRoom = _context.Tbl_Chats.FirstOrDefault(x =>
                (x.IdUsuario1 == usuarioId && x.IdUsuario2 == viewModel.User) ||
                (x.IdUsuario1 == viewModel.User && x.IdUsuario2 == usuarioId));

            if (existingRoom != null)
            {
                return existingRoom.Id;
            }

            var room = new Chat()
            {
                Name = viewModel.Name,
                IdUsuario1 = usuarioId,
                IdUsuario2 = viewModel.User,
            };

            _context.Tbl_Chats.Add(room);
            await _context.SaveChangesAsync();

            return room.Id;
        }

    }
}
