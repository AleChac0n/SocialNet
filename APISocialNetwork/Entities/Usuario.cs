using System.ComponentModel.DataAnnotations;

namespace ApiSocialNetwork.Entities
{
    public class Usuario
    {
        public long ID_Usuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public string Correo { get; set; }
        public string Contrasenna { get; set; }
        public string ContrasennaTemporal { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public short ID_Genero { get; set; }
        public string Genero { get; set; }
        public string UrlFotoPerfil { get; set; }
        public short ID_Rol { get; set; }
        public string NombreRol { get; set; }
        public string Token { get; set; }
        public int CantidadPublicaciones { get; set; }
        public int CantidadAmistades { get; set; }
        public long TotalMeGusta { get; set; }
        public string SobreMi { get; set; }
        public string FullName { get; set; }
        public string UrlFotoPublicacion { get; set; }
    }

    public class UsuarioEntity
    {

        [Key]
        public long ID_Usuario { get; set; }

        [Required(ErrorMessage = "Debe agregar su nombre")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Debe agregar su primer apellido")]
        [Display(Name = "Primer apellido")]
        public string Apellido1 { get; set; }

        [Required(ErrorMessage = "Debe agregar su segundo apellido ")]
        [Display(Name = "Segundo apellido")]
        public string Apellido2 { get; set; }

        [Required(ErrorMessage = "Debe agregar un correo electrónico")]
        [Display(Name = "Correo electrónico")]
        [EmailAddress(ErrorMessage = "Correo electrónico no válido")]
        public string Correo { get; set; }

        [Required(ErrorMessage = "Debe agregar una contraseña ")]
        [Display(Name = "Contraseña")]
        [DataType(DataType.Password)]
        public string Contrasenna { get; set; }

        public string ContrasennaTemporal { get; set; }


        [Required(ErrorMessage = "Debe agregar su fecha de nacimiento")]
        [Display(Name = "Fecha de nacimiento")]
        public DateTime FechaNacimiento { get; set; }

        [Required(ErrorMessage = "Debe indicar su género")]
        [Display(Name = "Género")]
        public string Genero { get; set; }

        public short ID_Genero { get; set; }


        [Display(Name = "Foto de perfil")]
        public string UrlFotoPerfil { get; set; }
        public int Id_Rol { get; set; }
        public string SobreMi { get; set; }
        public string FullName { get; set; }
        public string Avatar { get; set; }

    }


    public class UsuarioRespuesta
    {
        public UsuarioRespuesta()
        {
            Codigo = "00";
            Mensaje = string.Empty;
        }

        public string Codigo { get; set; }
        public string Mensaje { get; set; }
        public Usuario Dato { get; set; }
        public List<Usuario> Datos { get; set; }
    }
}