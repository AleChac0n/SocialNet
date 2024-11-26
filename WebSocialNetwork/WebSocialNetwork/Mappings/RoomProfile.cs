using AutoMapper;
using WebSocialNetwork.Entities;
using WebSocialNetwork.ViewModels;


namespace WebSocialNetwork.Mappings
{
    public class RoomProfile : Profile
    {
        public RoomProfile()
        {
            CreateMap<Chat, RoomViewModel>()
                .ForMember(dst => dst.Admin, opt => opt.MapFrom(x => x.AppUsuario1.Correo));

            CreateMap<RoomViewModel, Chat>();
        }
    }
}
