using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using ApiSocialNetwork.Services;
using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;
using ApiSocialNetwork.Entities;
using Microsoft.Extensions.Hosting;

namespace ApiSocialNetwork.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController(IConfiguration _configuration, IUtilitariosModel _utilitariosModel) : ControllerBase
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("IniciarSesion")]
        public IActionResult IniciarSesion(Usuario entidad)
        {

            //Evaluacion de los credenciales si son nulos o no antes de hacer la consulta a la DB
            if (string.IsNullOrEmpty(entidad.Correo) || string.IsNullOrEmpty(entidad.Contrasenna))
            {
                Respuesta respuesta = new Respuesta();
                respuesta.Codigo = "-1";    
                respuesta.Mensaje = "Ingrese la contraseña y el correo";
                return Ok(respuesta);   
            }

            //Caso con los campos correctos:
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                UsuarioRespuesta respuesta = new UsuarioRespuesta();

                var resultado = db.Query<Usuario>("SP_IniciarSesion",
                    new { entidad.Correo, entidad.Contrasenna },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();

                if (resultado == null)
                {
                    respuesta.Codigo = "-2";
                    respuesta.Mensaje = "Los crendenciales no son correctos";
                }
                else
                {
                    respuesta.Dato = resultado;
                    respuesta.Dato.Token = _utilitariosModel.GenerarToken(resultado.Correo ?? string.Empty);
                }

                return Ok(respuesta);
            }
        }


        [AllowAnonymous]
        [HttpPost]
        [Route("RegistrarUsuario")]
        public IActionResult RegistrarUsuario(Usuario entidad)
        {

            Respuesta respuesta = new Respuesta();

            try {
                using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                   

                    var resultado = db.Execute("SP_RegistrarUsuario", new 
                    {
                        entidad.Nombre, 
                        entidad.Apellido1, 
                        entidad.Apellido2, 
                        entidad.Correo, 
                        entidad.Contrasenna, 
                        entidad.FechaNacimiento, 
                        entidad.ID_Genero,
                        entidad.FullName
                    },
                        commandType: CommandType.StoredProcedure);

                    if (resultado <= 0)
                    {
                        respuesta.Codigo = "-1";
                        respuesta.Mensaje = "El correo ingresado ya se encuentra registrado";
                    }

                    return Ok(respuesta);

                }
            }
            catch (Exception e) {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = e.Message;
                return Ok(respuesta);

            }
        }

        [Authorize]
        [HttpGet]
        [Route("PerfilUsuario")]
        public IActionResult PerfilUsuario(long ID_Usuario)
        {
            using (var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                return Ok(context.Query<Usuario>("SP_ConsultarPerfilUsuario", new { ID_Usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault());
            }
        }


        [Authorize]
        [HttpPut]
        [Route("ModificarPerfil")]
        public IActionResult ModificarPerfil(Usuario entidad)
        {
            UsuarioRespuesta respuesta = new UsuarioRespuesta();

            try
            {
                using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
                {
                    var resultado = db.Query<Usuario>("SP_ModificarPerfil", new
                    {
                        entidad.ID_Usuario,
                        entidad.Nombre,
                        entidad.Apellido1,
                        entidad.Apellido2,
                        entidad.FechaNacimiento,
                        entidad.ID_Genero,
                        entidad.UrlFotoPerfil,
                        entidad.SobreMi
                    },
                    commandType: CommandType.StoredProcedure).FirstOrDefault();

                    if (resultado == null)
                    {
                        respuesta.Codigo = "-1";
                        respuesta.Mensaje = "Ha ocurrido un error al actualizar el perfil";
                    }
                    
                    respuesta.Dato = resultado;
                    return Ok(respuesta);

                }

            }
            catch (Exception e)
            {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = e.Message;
                return Ok(respuesta);

            }

        }

        
        [HttpGet]
        [Route("ConsultarUsuarioPorNombre")]
        public IActionResult ConsultarUsuarioPorNombre(string Nombre) {
            UsuarioRespuesta respuesta = new();

            using var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            var resultado = context.Query<Usuario>("SP_ConsultarUsuarioPorNombre", new { Nombre }, commandType: CommandType.StoredProcedure).ToList();
            if (resultado == null)
            {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = "No se encuentran géneros";
            }

            respuesta.Datos = resultado; 
            return Ok(respuesta);
        }


        [HttpGet]
        [Route("ConsultarUsuarioPorId")]
        public IActionResult ConsultarUsuarioPorId(long ID_Usuario)
        {
            using (var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                return Ok(context.Query<UsuarioEntity>("SP_ConsultarUsuarioPorId", new { ID_Usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault());
            }
        }


        [HttpGet]
        [Route("ConsultarGenerosUsuario")]
        public IActionResult ConsultarGenerosUsuario() {

            GenerosUsuarioEntRespuesta respuesta = new();

            using var context = new SqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            var resultado = context.Query<GenerosUsuarioEnt>("SP_ConsultarGenerosUsuario", commandType: CommandType.StoredProcedure).ToList();

            if (resultado == null)
            {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = "No se encuentran géneros";
            }

            respuesta.Datos = resultado;
            return Ok(respuesta);

        }

    }
}
