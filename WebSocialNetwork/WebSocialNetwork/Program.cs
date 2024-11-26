using Microsoft.EntityFrameworkCore;
using WebSocialNetwork.EntityFramework;
using WebSocialNetwork.Helpers;
using WebSocialNetwork.Hubs;
using WebSocialNetwork.Models;
using WebSocialNetwork.Services;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddDbContext<AppDbContext>(opciones => opciones.UseSqlServer("name=ConnectionStrings:DefaultConnection"));

builder.Services.AddTransient<IFileValidator, FileValidator>();

builder.Services.AddAutoMapper(typeof(Program));
builder.Services.AddRazorPages();
builder.Services.AddSignalR();


// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddSession();
builder.Services.AddHttpClient();
builder.Services.AddHttpContextAccessor();

builder.Services.AddSingleton<IUsuarioModel, UsuarioModel>();
builder.Services.AddSingleton<IUtilitariosModel, UtilitariosModel>();
builder.Services.AddSingleton<IPublicacionModel, PublicacionModel>();
builder.Services.AddSingleton<IMensajesModel, MensajeModel>();
builder.Services.AddSingleton<IAmistadesModel, AmistadesModel>();


var app = builder.Build();



// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.UseSession();//Reconocer las variables de sesion

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Cuentas}/{action=IniciarSesion}/{id?}");

app.MapRazorPages();

app.MapHub<ChatHub>("/chatHub");

app.Run();
