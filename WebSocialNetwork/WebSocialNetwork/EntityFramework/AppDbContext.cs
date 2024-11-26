using Microsoft.EntityFrameworkCore;
using WebSocialNetwork.Entities;

namespace WebSocialNetwork.EntityFramework
{
    public partial class AppDbContext : DbContext
    {
        public AppDbContext()
        {
        }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<UsuarioEntity> Tbl_Usuarios { get; set; }
        public DbSet<Chat> Tbl_Chats { get; set; }
        public DbSet<Mensaje> Tbl_Mensajes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<Chat>()
            .HasOne(s => s.AppUsuario1)
            .WithMany(u => u.Rooms)
            .IsRequired();


            modelBuilder.Entity<Mensaje>()
                .HasOne(s => s.ToRoom)
                    .WithMany(m => m.Messages)
                    .HasForeignKey(s => s.ToRoomId)
                    .OnDelete(DeleteBehavior.Cascade);
        }
        }
}
