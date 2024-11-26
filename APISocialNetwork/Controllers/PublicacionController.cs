using ApiSocialNetwork.Entities;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace ApiSocialNetwork.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PublicacionController(IConfiguration _configuration) : ControllerBase
    {
        
        [HttpGet]
        [Route("ConsultarPublicaciones")]
        public IActionResult ConsultarPublicaciones()
        {
            using var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            return Ok(context.Query<Publicacion>("SP_ConsultarPublicaciones", commandType: CommandType.StoredProcedure).ToList());
        }

        [HttpGet]
        [Route("ConsultarPublicacionesPorUsuario")]
        public IActionResult ConsultarPublicacionesPorUsuario(long ID_Usuario)
        {
            using var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            return Ok(context.Query<Publicacion>("SP_ConsultarPublicacionesPorUsuario", new { ID_Usuario }, commandType: CommandType.StoredProcedure).ToList());
        }

        [HttpGet]
        [Route("PublicacionesPerfil")]
        public IActionResult PublicacionesPerfil(long ID_Usuario)
        {
            using (var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                return Ok(context.Query<Publicacion>("SP_PublicacionesPerfil", new { ID_Usuario }, commandType: CommandType.StoredProcedure).ToList());
            }
        }

        [HttpPost]
        [Route("CrearPublicacion")]
        public IActionResult CrearPublicacion(Publicacion entidad)
        {
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                Respuesta respuesta = new Respuesta();

                var resultado = db.Query<Publicacion>("SP_CrearPublicacion", new 
                { entidad.ID_Usuario,
                    entidad.TextoContenido,
                    entidad.UrlFotoPublicacion,
                    entidad.Pais,
                    entidad.Estado 
                },
                commandType: CommandType.StoredProcedure).FirstOrDefault();

                if (resultado == null)
                {
                    respuesta.Codigo = "-1";
                    respuesta.Mensaje = "No se realizo la publicacion";
                }
                else
                {
                    respuesta.ConsecutivoGenerado = resultado.ID_Publicacion;
                }
                return Ok(respuesta);
            }
        }

        [HttpDelete]
        [Route("EliminarPublicacion")]
        public IActionResult EliminarPublicacion(long ID_Publicacion)
        {
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
               

                var resultado = db.Execute("EliminarPublicacion", new
                {
                    ID_Publicacion
                },
                commandType: CommandType.StoredProcedure);

               
                return Ok(resultado);
            }
        }

    }
}
