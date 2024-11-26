using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;
using WebSocialNetwork.Entities;
using WebSocialNetwork.Models;
using WebSocialNetwork.Services;
using WebSocialNetwork.ViewModels;

namespace WebSocialNetwork.Hubs
{
    
    public class ChatHub : Hub
    {

        public readonly static List<UserViewModel> _Connections = new List<UserViewModel>();
        private readonly static Dictionary<string, string> _ConnectionsMap = new Dictionary<string, string>();

        private readonly IUsuarioModel _model;
        private readonly IMapper _mapper;

        public ChatHub(IUsuarioModel model, IMapper mapper)
        {
            _model = model;
            _mapper = mapper;
        }

        public async Task Join(string roomName)
        {
            try
            {
                var httpContext = Context.GetHttpContext();
                var usuarioId = long.Parse(httpContext.Session.GetString("IdUsuario"));
                var usuario = _model.ConsultarUsuarioPorId(usuarioId);

                var user = _Connections.Where(u => u.Correo == usuario.Correo).FirstOrDefault();
                if (user != null && user.ChatActual != roomName)
                {
                    if (!string.IsNullOrEmpty(user.ChatActual))
                        await Clients.OthersInGroup(user.ChatActual).SendAsync("removeUser", user);

                    await Leave(user.ChatActual);
                    await Groups.AddToGroupAsync(Context.ConnectionId, roomName);
                    user.ChatActual = roomName;

                    await Clients.OthersInGroup(roomName).SendAsync("addUser", user);
                }
            }
            catch (Exception ex)
            {
                await Clients.Caller.SendAsync("onError", "You failed to join the chat room!" + ex.Message);
            }
        }

        public async Task Leave(string roomName)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, roomName);
        }

        public IEnumerable<UserViewModel> GetUsers(string roomName)
        {
            return _Connections.Where(u => u.ChatActual == roomName).ToList();
        }

        public override Task OnConnectedAsync()
        {
            try
            {
                var httpContext = Context.GetHttpContext();
                var usuarioId = long.Parse(httpContext.Session.GetString("IdUsuario"));
                var usuario = _model.ConsultarUsuarioPorId(usuarioId);

                var userViewModel = _mapper.Map<UsuarioEntity, UserViewModel>(usuario);
                userViewModel.Dispositivo = GetDevice();
                userViewModel.ChatActual = "";

                if (!_Connections.Any(u => u.Correo == usuario.Correo))
                {
                    _Connections.Add(userViewModel);
                    _ConnectionsMap.Add(usuario.Correo, Context.ConnectionId);
                }

                Clients.Caller.SendAsync("getProfileInfo", userViewModel);
            }
            catch (Exception ex)
            {
                Clients.Caller.SendAsync("onError", "OnConnected:" + ex.Message);
            }
            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            try
            {
                var httpContext = Context.GetHttpContext();
                var usuarioId = long.Parse(httpContext.Session.GetString("IdUsuario"));
                var usuario = _model.ConsultarUsuarioPorId(usuarioId);

                var user = _Connections.Where(u => u.Correo == usuario.Correo).First();
                _Connections.Remove(user);

                Clients.OthersInGroup(user.ChatActual).SendAsync("removeUser", user);

                _ConnectionsMap.Remove(user.Correo);
            }
            catch (Exception ex)
            {
                Clients.Caller.SendAsync("onError", "OnDisconnected: " + ex.Message);
            }

            return base.OnDisconnectedAsync(exception);
        }
       
        private string GetDevice()
        {
            var device = Context.GetHttpContext().Request.Headers["Device"].ToString();
            if (!string.IsNullOrEmpty(device) && (device.Equals("Desktop") || device.Equals("Mobile")))
                return device;

            return "Web";
        }
    }
}







