using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace WebSocialNetwork.Entities
{
    public class Mensaje
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName = "TEXT")]
        public string Content { get; set; }
        public DateTime Timestamp { get; set; }

        public UsuarioEntity FromUser { get; set; }
        public int ToRoomId { get; set; }
        public Chat ToRoom { get; set; }
    }
}
