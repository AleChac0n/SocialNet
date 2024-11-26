using AutoMapper;
using WebSocialNetwork.Entities;
using WebSocialNetwork.ViewModels;


namespace WebSocialNetwork.Mappings
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<UsuarioEntity, UserViewModel>()
                .ForMember(dst => dst.Correo, opt => opt.MapFrom(x => x.Correo));

            CreateMap<UserViewModel, UsuarioEntity>();
        }
    }
}
