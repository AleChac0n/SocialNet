using ApiSocialNetwork.Entities;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace ApiSocialNetwork.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Amistades (IConfiguration _configuration) : Controller
    {
        [HttpGet]
        [Route("ConsultarAmistad")]
        public IActionResult ConsultarAmistad(long ID_UsuarioBuscador, long ID_UsuarioPerfil)
        {
            AmistadesEntRespuesta respuesta = new AmistadesEntRespuesta();

            using var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            var resultado = context.Query<AmistadesEnt>("SP_ConsultarAmistad", new { ID_UsuarioBuscador, ID_UsuarioPerfil }, commandType: CommandType.StoredProcedure).FirstOrDefault();

            if (resultado != null)
            {
                respuesta.Dato = resultado;
            }
            else {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = "No hay resultados";
            }

            return Ok(respuesta);
        }

        [HttpPost]
        [Route("EnviarSolicitudAmistad")]
        public IActionResult EnviarSolicitudAmistad(AmistadesEnt entidad)
        {
            AmistadesEntRespuesta respuesta = new AmistadesEntRespuesta();

            using var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            var resultado = context.Execute("SP_EnviarSolicitudAmistad", new { entidad.ID_UsuarioEmisorSolicitud, entidad.ID_UsuarioReceptorSolicitud }, commandType: CommandType.StoredProcedure);

            if (resultado <= 0)
            {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = "No se pudo enviar la invitacion";
            }
            return Ok(respuesta);
        }
    }
}
