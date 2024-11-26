namespace WebSocialNetwork.Entities
{
    public class Publicacion
    {
        public long ID_Usuario { get; set; }
        public long ID_Publicacion { get; set; }
        public string TextoContenido { get; set; }
        public string UrlFotoPublicacion { get; set; }
        public string Pais { get; set; }
        public string Estado { get; set; }
        public string Nombre { get; set; }
        public string UrlFotoPerfil{ get; set; }
        public int MeGusta { get; set; }
        public int NoMeGusta { get; set; }
        public string TipoReaccion { get; set; }
    }

    public class PublicacionRespuesta
    {
        public PublicacionRespuesta()
        {
            Codigo = "00";
            Mensaje = string.Empty;
        }

        public string Codigo { get; set; }
        public string Mensaje { get; set; }
        public Publicacion Dato { get; set; }
        public List<Publicacion> Datos { get; set; }
    }
}
