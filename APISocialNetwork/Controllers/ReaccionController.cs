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
    public class ReaccionController(IConfiguration _configuration) : ControllerBase
    {
        [HttpPost]
        [Route("CrearReacciones")]
        public IActionResult CrearReacciones(Publicacion entidad)
        {
            Respuesta respuesta = new Respuesta();

            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                var resultado = db.Execute("SP_CrearReacciones", new
                {
                    entidad.ID_Publicacion,
                    entidad.ID_Usuario,
                    entidad.TipoReaccion
                },
                commandType: CommandType.StoredProcedure);

                return Ok(respuesta);
            }
        }

        [HttpGet]
        [Route("ConsultarReaccionesPorPublicacion")]
        public IActionResult ConsultarReaccionesPorPublicacion(long ID_Publicacion)
        {
            PublicacionRespuesta respuesta = new PublicacionRespuesta();

            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                var resultado = db.Query<Publicacion>("SP_ConsultarReaccionesPorPublicacion", new
                {
                    ID_Publicacion
                },
                commandType: CommandType.StoredProcedure).FirstOrDefault();

                respuesta.Dato = resultado;
                return Ok(respuesta);
            }
        }
    }
}
