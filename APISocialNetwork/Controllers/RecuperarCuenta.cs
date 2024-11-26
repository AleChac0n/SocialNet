using ApiSocialNetwork.Entities;
using ApiSocialNetwork.Services;
using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Data;

namespace ApiSocialNetwork.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RecuperarCuenta(IConfiguration _configuration, IUtilitariosModel _utilitariosModel, IHostEnvironment _hostEnvironment) : ControllerBase
    {


        [AllowAnonymous]
        [HttpPut]
        [Route("EnviarContrasennaTemporal")]
        public IActionResult EnviarContrasennaTemporal(Usuario entidad)
        {

            Respuesta respuesta = new Respuesta();

            //Evaluacion del correo antes de hacer la consulta a la DB
            if (string.IsNullOrEmpty(entidad.Correo))
            {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = "Correo no ingresado. Ingrese el correo registrado";
                return Ok(respuesta);
            }

            //Ejecucion:
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                var contrasenaTemporal = _utilitariosModel.GenerarNuevaContrasena();
                var contrasenaTemporalEncrypted = _utilitariosModel.Encrypt(contrasenaTemporal);
                var resultado = db.Query<Usuario>("SP_AgregarContrasennaTemporal", new { entidad.Correo, ContrasennaTemporal = contrasenaTemporalEncrypted }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                if (resultado == null)
                {
                    respuesta.Codigo = "-2";
                    respuesta.Mensaje = "Correo no existente";
                }
                else
                {
                    //Enviar correo al usuario con la nueva contraseña
                    string ruta = Path.Combine(_hostEnvironment.ContentRootPath, "Correos", "ContrasennaTemporal.html");
                    string htmlBody = System.IO.File.ReadAllText(ruta);
                    htmlBody = htmlBody.Replace("@Usuario@", resultado.Nombre + " " + resultado.Apellido1 + " " + resultado.Apellido2);
                    htmlBody = htmlBody.Replace("@Contrasenna@", contrasenaTemporal);
                    _utilitariosModel.EnviarCorreo(entidad.Correo, "Contraseña Temporal", htmlBody);

                    respuesta.Mensaje = "Contraseña temporal registrada y correo enviado";
                    
                }

                return Ok(respuesta);
            }
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("RestablecerContrasennaEIniciarSesion")]
        public IActionResult RestablecerContrasenna(Usuario entidad)
        {

            UsuarioRespuesta respuesta = new UsuarioRespuesta();

            //Validar campos nulos
            if (string.IsNullOrEmpty(entidad.Correo) || string.IsNullOrEmpty(entidad.Contrasenna) || string.IsNullOrEmpty(entidad.ContrasennaTemporal))
            {
                respuesta.Codigo = "-1";
                respuesta.Mensaje = "Ingrese el Correo, contraseña temporal y la nueva contraseña";
                return Ok(respuesta);
            }
            //Validar contraseñas iguales
            if (entidad.Contrasenna == entidad.ContrasennaTemporal)
            {
                respuesta.Codigo = "-2";
                respuesta.Mensaje = "La contraseña nueva no debe de ser igual a la temporal";
                return Ok(respuesta);
            }
            //Ejecucion
            using (var db = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                
                
                var resultado = db.Query<Usuario> ("SP_RestablecerContrasennaEIniciarSesion", new { entidad.Correo, entidad.Contrasenna, entidad.ContrasennaTemporal }, commandType: CommandType.StoredProcedure).FirstOrDefault();
                if (resultado == null)
                {
                    respuesta.Codigo = "-3";
                    respuesta.Mensaje = "Error. Revisar la contraseña temporal y el correo";
                }
                else {
                    respuesta.Dato = resultado;
                }

                return Ok(respuesta);
            }
        }

    }
}
