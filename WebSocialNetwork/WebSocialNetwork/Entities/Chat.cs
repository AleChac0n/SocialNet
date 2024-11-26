using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebSocialNetwork.Entities
{
    public class Chat
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public long IdUsuario1 { get; set; }
        public long IdUsuario2 { get; set; }

        [ForeignKey("IdUsuario1")]
        public UsuarioEntity AppUsuario1 { get; set; }

        [ForeignKey("IdUsuario2")]
        public UsuarioEntity AppUsuario2 { get; set; }
        public ICollection<Mensaje> Messages { get; set; }
    }
}
