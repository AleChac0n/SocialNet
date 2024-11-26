namespace WebSocialNetwork.Entities
{
    public class AmistadesEnt
    {
        public long ID_Amistad { get; set; }
        public long ID_UsuarioEmisorSolicitud { get; set; }
        public long ID_UsuarioReceptorSolicitud { get; set; }
        public DateTime FechaInicio { get; set; }
        public int ID_EstadoAmistad { get; set; }
        public string EstadoDescripcion { get; set; }

    }

    public class AmistadesEntRespuesta
    {
        public string Codigo { get; set; }
        public string Mensaje { get; set; }
        public AmistadesEnt Dato { get; set; }
        public List<AmistadesEnt> Datos { get; set; }
    }
}
