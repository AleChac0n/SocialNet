﻿namespace ApiSocialNetwork.Entities
{
    public class GenerosUsuarioEnt
    {
        public short ID_Genero { get; set; }
        public string Descripcion { get; set; }
    }

    public class GenerosUsuarioEntRespuesta
    {
        public string Codigo { get; set; }
        public string Mensaje { get; set; }
        public GenerosUsuarioEnt Dato { get; set; }
        public List<GenerosUsuarioEnt> Datos { get; set; }
    }
}