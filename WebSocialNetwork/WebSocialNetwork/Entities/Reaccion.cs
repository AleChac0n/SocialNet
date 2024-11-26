namespace WebSocialNetwork.Entities
{
    public class Reaccion
    {
        public long ID_Usuario { get; set; }
        public long ID_Publicacion { get; set; }
        public string TipoReaccion { get; set; }
        public int MeGusta { get; set; }
        public int NoMeGusta { get; set; }
    }

    public class ReaccionRespuesta
    {
        public ReaccionRespuesta()
        {
            Codigo = "00";
            Mensaje = string.Empty;
        }

        public string Codigo { get; set; }
        public string Mensaje { get; set; }
        public Reaccion Dato { get; set; }
        public List<Reaccion> Datos { get; set; }
    }

}
