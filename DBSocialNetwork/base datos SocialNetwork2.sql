USE [master]
GO
/****** Object:  Database [SocialNetwork2]    Script Date: 4/26/2024 6:48:30 PM ******/
CREATE DATABASE [SocialNetwork2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialNetwork2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SocialNetwork2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialNetwork2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SocialNetwork2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SocialNetwork2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialNetwork2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialNetwork2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialNetwork2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialNetwork2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialNetwork2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialNetwork2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialNetwork2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialNetwork2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialNetwork2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialNetwork2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialNetwork2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialNetwork2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialNetwork2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialNetwork2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialNetwork2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialNetwork2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SocialNetwork2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialNetwork2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialNetwork2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialNetwork2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialNetwork2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialNetwork2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialNetwork2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialNetwork2] SET RECOVERY FULL 
GO
ALTER DATABASE [SocialNetwork2] SET  MULTI_USER 
GO
ALTER DATABASE [SocialNetwork2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialNetwork2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialNetwork2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialNetwork2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialNetwork2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocialNetwork2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SocialNetwork2', N'ON'
GO
ALTER DATABASE [SocialNetwork2] SET QUERY_STORE = ON
GO
ALTER DATABASE [SocialNetwork2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SocialNetwork2]
GO
/****** Object:  Table [dbo].[Tbl_Amistades]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Amistades](
	[ID_Amistad] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_UsuarioEmisorSolicitud] [bigint] NOT NULL,
	[ID_UsuarioReceptorSolicitud] [bigint] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[ID_EstadoAmistad] [smallint] NOT NULL,
 CONSTRAINT [PK_Tbl_Amistades] PRIMARY KEY CLUSTERED 
(
	[ID_Amistad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Chats]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Chats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[IdUsuario1] [bigint] NOT NULL,
	[IdUsuario2] [bigint] NOT NULL,
 CONSTRAINT [PK_Tbl_Chats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Comentarios]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Comentarios](
	[ID_Comentario] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[ID_Publicacion] [bigint] NOT NULL,
	[TextoContenido] [varchar](300) NOT NULL,
	[FechaComentario] [date] NOT NULL,
 CONSTRAINT [PK_Tbl_Comentarios] PRIMARY KEY CLUSTERED 
(
	[ID_Comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EstadoAmistad]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_EstadoAmistad](
	[ID_EstadoAmistad] [smallint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_EstadoAmistad] PRIMARY KEY CLUSTERED 
(
	[ID_EstadoAmistad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_EstadoMensaje]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_EstadoMensaje](
	[ID_EstadoMensaje] [smallint] NOT NULL,
	[Descripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tbl_EstadoMensaje] PRIMARY KEY CLUSTERED 
(
	[ID_EstadoMensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_GenerosUsuario]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_GenerosUsuario](
	[ID_Genero] [smallint] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_GenerosUsuario] PRIMARY KEY CLUSTERED 
(
	[ID_Genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Mensajes]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Mensajes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [text] NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[FromUserIdUsuario] [bigint] NOT NULL,
	[ToRoomId] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Mensajes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Publicaciones]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Publicaciones](
	[ID_Publicacion] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[TextoContenido] [varchar](300) NOT NULL,
	[UrlFotoPublicacion] [varchar](400) NOT NULL,
	[FechaPublicacion] [date] NOT NULL,
	[Pais] [varchar](200) NULL,
	[Estado] [varchar](200) NULL,
	[MeGusta] [bigint] NULL,
 CONSTRAINT [PK_Tbl_Publicaciones] PRIMARY KEY CLUSTERED 
(
	[ID_Publicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Reacciones]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Reacciones](
	[ID_Reaccion] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[ID_Publicacion] [bigint] NOT NULL,
	[TipoReaccion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_ReaccionesPublicaciones] PRIMARY KEY CLUSTERED 
(
	[ID_Reaccion] ASC,
	[ID_Usuario] ASC,
	[ID_Publicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Roles](
	[ID_Rol] [smallint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[ID_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Usuarios]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Usuarios](
	[ID_Usuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](100) NOT NULL,
	[ContrasennaTemporal] [varchar](100) NULL,
	[FechaNacimiento] [date] NOT NULL,
	[UrlFotoPerfil] [varchar](100) NULL,
	[SobreMi] [text] NULL,
	[FullName] [varchar](200) NULL,
	[Avatar] [varchar](200) NULL,
	[ID_Genero] [smallint] NOT NULL,
	[ID_Rol] [smallint] NOT NULL,
 CONSTRAINT [PK_Tbl_Usuarios] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Amistades] ON 

INSERT [dbo].[Tbl_Amistades] ([ID_Amistad], [ID_UsuarioEmisorSolicitud], [ID_UsuarioReceptorSolicitud], [FechaInicio], [ID_EstadoAmistad]) VALUES (1, 3, 4, CAST(N'2024-04-25' AS Date), 1)
INSERT [dbo].[Tbl_Amistades] ([ID_Amistad], [ID_UsuarioEmisorSolicitud], [ID_UsuarioReceptorSolicitud], [FechaInicio], [ID_EstadoAmistad]) VALUES (2, 5, 3, CAST(N'2024-04-25' AS Date), 1)
INSERT [dbo].[Tbl_Amistades] ([ID_Amistad], [ID_UsuarioEmisorSolicitud], [ID_UsuarioReceptorSolicitud], [FechaInicio], [ID_EstadoAmistad]) VALUES (3, 3, 6, CAST(N'2024-04-24' AS Date), 2)
INSERT [dbo].[Tbl_Amistades] ([ID_Amistad], [ID_UsuarioEmisorSolicitud], [ID_UsuarioReceptorSolicitud], [FechaInicio], [ID_EstadoAmistad]) VALUES (4, 3, 7, CAST(N'2024-04-25' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Tbl_Amistades] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Chats] ON 

INSERT [dbo].[Tbl_Chats] ([Id], [Name], [IdUsuario1], [IdUsuario2]) VALUES (1, N'Jarod Santiago y Ophelie', 3, 4)
SET IDENTITY_INSERT [dbo].[Tbl_Chats] OFF
GO
INSERT [dbo].[Tbl_EstadoAmistad] ([ID_EstadoAmistad], [Descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[Tbl_EstadoAmistad] ([ID_EstadoAmistad], [Descripcion]) VALUES (2, N'Amigo')
GO
INSERT [dbo].[Tbl_GenerosUsuario] ([ID_Genero], [Descripcion]) VALUES (1, N'Masculino')
INSERT [dbo].[Tbl_GenerosUsuario] ([ID_Genero], [Descripcion]) VALUES (2, N'Femenino')
INSERT [dbo].[Tbl_GenerosUsuario] ([ID_Genero], [Descripcion]) VALUES (3, N'No indicar')
GO
SET IDENTITY_INSERT [dbo].[Tbl_Publicaciones] ON 

INSERT [dbo].[Tbl_Publicaciones] ([ID_Publicacion], [ID_Usuario], [TextoContenido], [UrlFotoPublicacion], [FechaPublicacion], [Pais], [Estado], [MeGusta]) VALUES (1, 3, N'¿Te imaginas volar sobre la ciudad sin tráfico ni preocupaciones?
El Volocopter es un innovador vehículo eléctrico (eVTOL) de transporte urbano desarrollado por Volocopter GmbH en 2013 como alternativa a los densos flujos vehiculares terrestres de grandes ciudades. ', N'/images/Publicaciones', CAST(N'2024-04-24' AS Date), N'Costa Rica', N'Heredia Province', NULL)
INSERT [dbo].[Tbl_Publicaciones] ([ID_Publicacion], [ID_Usuario], [TextoContenido], [UrlFotoPublicacion], [FechaPublicacion], [Pais], [Estado], [MeGusta]) VALUES (2, 5, N'Increíbleeee', N'/images/Publicaciones', CAST(N'2024-04-25' AS Date), N'United States', N'New York', NULL)
INSERT [dbo].[Tbl_Publicaciones] ([ID_Publicacion], [ID_Usuario], [TextoContenido], [UrlFotoPublicacion], [FechaPublicacion], [Pais], [Estado], [MeGusta]) VALUES (3, 19, N'Inteligencia Artificial', N'/images/Publicaciones', CAST(N'2024-04-25' AS Date), N'Costa Rica', N'Alajuela Province', NULL)
INSERT [dbo].[Tbl_Publicaciones] ([ID_Publicacion], [ID_Usuario], [TextoContenido], [UrlFotoPublicacion], [FechaPublicacion], [Pais], [Estado], [MeGusta]) VALUES (4, 19, N'Un hermoso lugar', N'/images/Publicaciones', CAST(N'2024-04-25' AS Date), N'Chile', N'Antofagasta Region', NULL)
INSERT [dbo].[Tbl_Publicaciones] ([ID_Publicacion], [ID_Usuario], [TextoContenido], [UrlFotoPublicacion], [FechaPublicacion], [Pais], [Estado], [MeGusta]) VALUES (5, 19, N'Blbaansdoasndoaii', N'/images/Publicaciones', CAST(N'2024-04-26' AS Date), N'Costa Rica', N'San José Province', NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Publicaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Reacciones] ON 

INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (1, 5, 1, N'MeGusta')
INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (3, 5, 2, N'NoMeGusta')
INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (4, 5, 3, N'NoMeGusta')
INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (5, 19, 4, N'MeGusta')
INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (6, 19, 1, N'NoMeGusta')
INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (7, 16, 2, N'NoMeGusta')
INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (8, 17, 2, N'NoMeGusta')
INSERT [dbo].[Tbl_Reacciones] ([ID_Reaccion], [ID_Usuario], [ID_Publicacion], [TipoReaccion]) VALUES (10, 6, 5, N'MeGusta')
SET IDENTITY_INSERT [dbo].[Tbl_Reacciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Roles] ON 

INSERT [dbo].[Tbl_Roles] ([ID_Rol], [Descripcion]) VALUES (1, N'UsuarioRegular')
INSERT [dbo].[Tbl_Roles] ([ID_Rol], [Descripcion]) VALUES (2, N'Admin')
SET IDENTITY_INSERT [dbo].[Tbl_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Usuarios] ON 

INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (3, N'Jarod Santiago', N'Viquez', N'Salazar', N'jarod281@hotmail.com', N'tUAhzmgC1VCMKwTrZkhXuQ==', NULL, CAST(N'1999-01-28' AS Date), N'/images/Perfiles/3.jpg', N'Estudiante de la Univesidad Fidelitas', N'Jarod Viquez Salazar', NULL, 1, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (4, N'Ophelie', N'Basford', N'Ferronel', N'OphelieBasford123@gmail.com', N'Spuz4Ljo75OTjmoK/AUjoQ==', NULL, CAST(N'1994-07-08' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Ophelie Basford Ferronel', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (5, N'Gunther', N'Maplethorp', N'Di Antonio', N'GuntherMaplethorp123@gmail.com', N'i8nvr1pqcEfrvW4GQ6LYFA==', NULL, CAST(N'2006-04-05' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Gunther Maplethorp Di Antonio', NULL, 1, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (6, N'Belvia', N'Tamas', N'Steade', N'BelviaTamas123@gmail.com', N'zleOh5zfLw3MrUcgSPSFPg==', NULL, CAST(N'2006-04-05' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Belvia Tamas Steade', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (7, N'Corny', N'Newcome', N'Le Strange', N'CornyNewcome123@gmail.com', N'OF5LxKVXblXL3IHKrJuopg==', NULL, CAST(N'2003-03-13' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Corny Newcome Le Strange', NULL, 1, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (8, N'Odella', N'Biasioni', N'Rodgers', N'OdellaBiasioni123@gmail.com', N'+CEzGPvAE6juaPbCK1s+Cg==', NULL, CAST(N'2002-06-13' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Odella Biasioni Rodgers', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (9, N'Sasha', N'Shipway', N'McCrohon', N'SashaShipway123@gmail.com', N'gskTkw/RfK9nEWYLvfcxgQ==', NULL, CAST(N'1997-06-24' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Sasha Shipway McCrohon', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (10, N'Hallie', N'Rasher', N'de Clerk', N'HallieRasher123@gmail.com', N'kpK0p8DUYkkMGRIJRfYsQQ==', NULL, CAST(N'1996-06-15' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Hallie Rasher de Clerk', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (11, N'Rudolf', N'Frossell', N'Kleint', N'RudolfFrossell123@gmail.com', N'F/mw4VaZPFbZSooKcjjWqw==', NULL, CAST(N'2006-04-24' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Rudolf Frossell Kleint', NULL, 1, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (12, N'Milton', N'Hasty', N'Flaws', N'MiltonHasty123@gmail.com', N'6pPpOybmSpJ4Fu9xPTgE4Q==', NULL, CAST(N'2006-04-11' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Milton Hasty Flaws', NULL, 1, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (13, N'Jemimah', N'Philo', N'Hampson', N'JemimahPhilo123@gmail.com', N'BF3mfT5P1oNeONb3ggwxng==', NULL, CAST(N'2006-04-05' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Jemimah Philo Hampson', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (14, N'Reggis', N'Yurin', N'Dodman', N'ReggisYurin123@gmail.com', N'PjALJPA2D9ggpDhW9NhEPQ==', NULL, CAST(N'1995-02-24' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Reggis Yurin Dodman', NULL, 1, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (15, N'Erna', N'Bilam', N'Bernardon', N'ErnaBilam123@gmail.com', N'ZMlicV47xlhvfHgyV4VNWQ==', NULL, CAST(N'2006-04-15' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Erna Bilam Bernardon', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (16, N'Agata', N'Pollok', N'Lyles', N'AgataPollok123@gmail.com', N'INCufkISceOgsXvLdgEzfw==', NULL, CAST(N'2006-04-13' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Agata Pollok Lyles', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (17, N'Phil', N'Challes', N'Undrell', N'PhilChalles123@gmail.com', N'Q5Q+qkygG02I01QuJ0ypgg==', NULL, CAST(N'1989-02-16' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Phil Challes Undrell', NULL, 1, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (18, N'Talyah', N'Fass', N'Janicijevic', N'TalyahFass123@gmail.com', N'wIXaa4XTjmPl8jEdFLMLtA==', NULL, CAST(N'1989-06-14' AS Date), N'/images/avatars/default-avatar.jpg', NULL, N'Talyah Fass Janicijevic', NULL, 2, 1)
INSERT [dbo].[Tbl_Usuarios] ([ID_Usuario], [Nombre], [Apellido1], [Apellido2], [Correo], [Contrasenna], [ContrasennaTemporal], [FechaNacimiento], [UrlFotoPerfil], [SobreMi], [FullName], [Avatar], [ID_Genero], [ID_Rol]) VALUES (19, N'Valeria', N'Garcia', N'Cardenas', N'valeriagc012004@gmail.com', N'O7xmf46u4I4A8FivRNEte4XDFX2/lWG2AqX4AINzTV4=', NULL, CAST(N'2004-10-01' AS Date), N'/images/Perfiles/19.png', NULL, N'Valeria Garcia Cardenas', NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Usuarios] OFF
GO
ALTER TABLE [dbo].[Tbl_Chats]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Chats_Tbl_Usuarios1] FOREIGN KEY([IdUsuario1])
REFERENCES [dbo].[Tbl_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Chats] CHECK CONSTRAINT [FK_Tbl_Chats_Tbl_Usuarios1]
GO
ALTER TABLE [dbo].[Tbl_Chats]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Chats_Tbl_Usuarios2] FOREIGN KEY([IdUsuario2])
REFERENCES [dbo].[Tbl_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Chats] CHECK CONSTRAINT [FK_Tbl_Chats_Tbl_Usuarios2]
GO
ALTER TABLE [dbo].[Tbl_Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Comentarios_Tbl_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Tbl_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Comentarios] CHECK CONSTRAINT [FK_Tbl_Comentarios_Tbl_Usuarios]
GO
ALTER TABLE [dbo].[Tbl_Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Mensajes_Tbl_Chats] FOREIGN KEY([ToRoomId])
REFERENCES [dbo].[Tbl_Chats] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Mensajes] CHECK CONSTRAINT [FK_Tbl_Mensajes_Tbl_Chats]
GO
ALTER TABLE [dbo].[Tbl_Mensajes]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Mensajes_Tbl_Usuarios] FOREIGN KEY([FromUserIdUsuario])
REFERENCES [dbo].[Tbl_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Mensajes] CHECK CONSTRAINT [FK_Tbl_Mensajes_Tbl_Usuarios]
GO
ALTER TABLE [dbo].[Tbl_Publicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Publicaciones_Tbl_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Tbl_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Tbl_Publicaciones] CHECK CONSTRAINT [FK_Tbl_Publicaciones_Tbl_Usuarios]
GO
ALTER TABLE [dbo].[Tbl_Reacciones]  WITH CHECK ADD  CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_Publicaciones] FOREIGN KEY([ID_Publicacion])
REFERENCES [dbo].[Tbl_Publicaciones] ([ID_Publicacion])
GO
ALTER TABLE [dbo].[Tbl_Reacciones] CHECK CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_Publicaciones]
GO
ALTER TABLE [dbo].[Tbl_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Usuarios_Tbl_GenerosUsuario] FOREIGN KEY([ID_Genero])
REFERENCES [dbo].[Tbl_GenerosUsuario] ([ID_Genero])
GO
ALTER TABLE [dbo].[Tbl_Usuarios] CHECK CONSTRAINT [FK_Tbl_Usuarios_Tbl_GenerosUsuario]
GO
ALTER TABLE [dbo].[Tbl_Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Usuarios_Tbl_Roles] FOREIGN KEY([ID_Rol])
REFERENCES [dbo].[Tbl_Roles] ([ID_Rol])
GO
ALTER TABLE [dbo].[Tbl_Usuarios] CHECK CONSTRAINT [FK_Tbl_Usuarios_Tbl_Roles]
GO
/****** Object:  StoredProcedure [dbo].[EliminarPublicacion]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPublicacion]
	@IdPublicacion	 bigint
AS
BEGIN

DELETE FROM [dbo].[Tbl_Publicaciones]
      WHERE @IdPublicacion = ID_Publicacion
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarContrasennaTemporal]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarContrasennaTemporal]
	@Correo VARCHAR(100),
	@ContrasennaTemporal VARCHAR(100)
AS
BEGIN
	UPDATE Tbl_Usuarios SET ContrasennaTemporal = @ContrasennaTemporal where Correo = @Correo
	SELECT Correo, Nombre, Apellido1, Apellido2 from Tbl_Usuarios where Correo = @Correo
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConfirmarSolicitudAmistad]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ConfirmarSolicitudAmistad]
    @ID_UsuarioEmisorSolicitud bigint,
    @ID_UsuarioReceptorSolicitud bigint
AS
BEGIN

DECLARE @FILASCREADAS bit;

    IF EXISTS (
        SELECT 1 FROM Tbl_Amistades WHERE 
        (ID_UsuarioEmisorSolicitud = @ID_UsuarioEmisorSolicitud AND ID_UsuarioReceptorSolicitud = @ID_UsuarioReceptorSolicitud AND ID_EstadoAmistad = 1) 
    )
    BEGIN
        SET @FILASCREADAS = 1;
    END
    ELSE
    BEGIN
        SET @FILASCREADAS = 0;
    END

	IF @FILASCREADAS = 1
    BEGIN
        UPDATE Tbl_Amistades SET ID_EstadoAmistad=2, FechaInicio = GETDATE()
    END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarAmistad]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ConsultarAmistad]
	@ID_UsuarioBuscador bigint,
	@ID_UsuarioPerfil bigint
AS
BEGIN
	SELECT A.ID_Amistad,A.ID_EstadoAmistad,A.ID_UsuarioEmisorSolicitud,A.ID_UsuarioReceptorSolicitud,A.FechaInicio,E.Descripcion 'EstadoDescripcion' FROM Tbl_Amistades A 
	JOIN Tbl_EstadoAmistad E ON A.ID_EstadoAmistad = E.ID_EstadoAmistad
	WHERE ID_UsuarioEmisorSolicitud = @ID_UsuarioBuscador AND ID_UsuarioReceptorSolicitud = @ID_UsuarioPerfil 
	OR ID_UsuarioEmisorSolicitud = @ID_UsuarioPerfil AND ID_UsuarioReceptorSolicitud = @ID_UsuarioBuscador 
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarGenerosUsuario]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarGenerosUsuario]
AS
BEGIN
	SELECT ID_Genero, Descripcion FROM Tbl_GenerosUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPerfilUsuario]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarPerfilUsuario]
	@ID_Usuario bigint
AS 
BEGIN

    DECLARE @CantidadPublicaciones int
	DECLARE @TotalMeGusta int
	DECLARE @CantidadAmistades int


    SELECT @CantidadPublicaciones = COUNT(*), @TotalMeGusta = SUM(MeGusta) 
    FROM Tbl_Publicaciones
    WHERE ID_Usuario = @ID_Usuario

	SELECT @CantidadAmistades = COUNT(*)
	FROM Tbl_Amistades
	WHERE (ID_UsuarioEmisorSolicitud = @ID_Usuario OR ID_UsuarioReceptorSolicitud = @ID_Usuario) AND ID_EstadoAmistad = 2


	SELECT 
	ID_Usuario,
	Correo,
    Nombre,
    Apellido1,
    Apellido2,
	G.ID_Genero,
	G.Descripcion 'Genero',
    FechaNacimiento,
    UrlFotoPerfil,
	SobreMi,
	@TotalMeGusta AS totalMeGusta,
	@CantidadPublicaciones AS cantidadPublicaciones,
	@CantidadAmistades AS cantidadAmistades
	FROM dbo.Tbl_Usuarios U
	JOIN Tbl_GenerosUsuario G ON U.ID_Genero = G.ID_Genero
	WHERE ID_Usuario = @ID_Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPublicaciones]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarPublicaciones]

AS 
BEGIN

SELECT P.ID_Publicacion, 
           P.TextoContenido, 
           P.FechaPublicacion, 
           P.Pais, 
           P.Estado, 
           U.UrlFotoPerfil, 
           U.Nombre, 
           P.UrlFotoPublicacion + '/' + CONVERT(VARCHAR, P.ID_Publicacion) + '.png' AS UrlFotoPublicacion, 
           P.ID_Usuario,
           (SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'MeGusta') AS MeGusta,
           (SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'NoMeGusta') AS NoMeGusta
    FROM Tbl_Publicaciones P
    INNER JOIN Tbl_Usuarios U ON P.ID_Usuario = U.ID_Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPublicacionesPorUsuario]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarPublicacionesPorUsuario]
@ID_Usuario BIGINT
AS 
BEGIN
	SELECT P.ID_Publicacion, P.TextoContenido, P.FechaPublicacion, P.Pais, P.Estado, P.UrlFotoPublicacion + '/'+ CONVERT(VARCHAR, P.ID_Publicacion) + '.png' UrlFotoPublicacion,  
	U.ID_Usuario,U.Nombre,U.Apellido1,U.Apellido2,U.UrlFotoPerfil,
	C.TextoContenido 'Comentario', C.FechaComentario  
	FROM Tbl_Publicaciones P
	INNER JOIN Tbl_Usuarios U ON P.ID_Usuario = U.ID_Usuario
	LEFT JOIN Tbl_Comentarios C ON P.ID_Publicacion = C.ID_Publicacion
	LEFT JOIN Tbl_Usuarios UC ON C.ID_Usuario = UC.ID_Usuario
	WHERE P.ID_Usuario = @ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarReaccionesPorPublicacion]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarReaccionesPorPublicacion]
    @ID_Publicacion bigint
AS 
BEGIN
	SELECT P.ID_Publicacion, 
           P.ID_Usuario,
           (SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'MeGusta') AS MeGusta,
           (SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'NoMeGusta') AS NoMeGusta
    FROM Tbl_Publicaciones P
    INNER JOIN Tbl_Usuarios U ON P.ID_Usuario = U.ID_Usuario
	WHERE ID_Publicacion = @ID_Publicacion;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarUsuarioPorId]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarUsuarioPorId]
	@ID_Usuario bigint
AS
BEGIN
	select * from Tbl_Usuarios where ID_Usuario = @ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarUsuarioPorNombre]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarUsuarioPorNombre]
	@Nombre VARCHAR(100) 
AS
BEGIN
	SELECT ID_Usuario,Nombre, Apellido1, Apellido2, UrlFotoPerfil  
	FROM Tbl_Usuarios 
	WHERE FullName LIKE '%' +  @Nombre  + '%';
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearPublicacion]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearPublicacion]
	@ID_Usuario bigint,
	@TextoContenido varchar(300),
	@UrlFotoPublicacion varchar(100),
	@Pais varchar(200),
	@Estado varchar(200)

AS 
BEGIN

	INSERT INTO Tbl_Publicaciones(ID_Usuario,TextoContenido,UrlFotoPublicacion,FechaPublicacion,Pais,Estado)
	VALUES (@ID_Usuario,@TextoContenido,@UrlFotoPublicacion,GETDATE(),@Pais,@Estado)

	SELECT @@IDENTITY 'ID_Publicacion'

END
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearReacciones]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearReacciones]
    @ID_Publicacion bigint,
    @ID_Usuario bigint,
    @TipoReaccion varchar(50)
AS 
BEGIN
    IF @TipoReaccion = 'MeGusta' OR @TipoReaccion = 'NoMeGusta' OR @TipoReaccion = ''
    BEGIN
        IF @TipoReaccion = ''
        BEGIN
            -- Si el tipo de reacción es una cadena vacía, eliminamos la reacción
            DELETE FROM Tbl_Reacciones WHERE ID_Publicacion = @ID_Publicacion AND ID_Usuario = @ID_Usuario
        END
        ELSE
        BEGIN
            IF EXISTS (SELECT * FROM Tbl_Reacciones WHERE ID_Publicacion = @ID_Publicacion AND ID_Usuario = @ID_Usuario)
            BEGIN
                -- Si ya existe una reacción del usuario a la publicación, actualizamos el tipo de reacción
                UPDATE Tbl_Reacciones SET TipoReaccion = @TipoReaccion WHERE ID_Publicacion = @ID_Publicacion AND ID_Usuario = @ID_Usuario
            END
            ELSE
            BEGIN
                -- Si no existe una reacción del usuario a la publicación, la insertamos
                INSERT INTO Tbl_Reacciones (ID_Usuario, ID_Publicacion, TipoReaccion) VALUES (@ID_Usuario, @ID_Publicacion, @TipoReaccion)
            END
        END
    END

	SELECT P.ID_Publicacion, 
           P.ID_Usuario,
           (SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'MeGusta') AS MeGusta,
           (SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'NoMeGusta') AS NoMeGusta
    FROM Tbl_Publicaciones P
    INNER JOIN Tbl_Usuarios U ON P.ID_Usuario = U.ID_Usuario
	WHERE ID_Publicacion = @ID_Publicacion;


END
GO
/****** Object:  StoredProcedure [dbo].[SP_EnviarSolicitudAmistad]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EnviarSolicitudAmistad]
    @ID_UsuarioEmisorSolicitud bigint,
    @ID_UsuarioReceptorSolicitud bigint
AS
BEGIN

DECLARE @FILASCREADAS bit;

    IF EXISTS (
        SELECT 1 FROM Tbl_Amistades WHERE 
        (ID_UsuarioEmisorSolicitud = @ID_UsuarioEmisorSolicitud AND ID_UsuarioReceptorSolicitud = @ID_UsuarioReceptorSolicitud) OR
        (ID_UsuarioEmisorSolicitud = @ID_UsuarioReceptorSolicitud AND ID_UsuarioReceptorSolicitud = @ID_UsuarioEmisorSolicitud)
    )
    BEGIN
        SET @FILASCREADAS = 1;
    END
    ELSE
    BEGIN
        SET @FILASCREADAS = 0;
    END

	IF @FILASCREADAS = 0
    BEGIN
        INSERT INTO Tbl_Amistades
            (ID_UsuarioEmisorSolicitud, ID_UsuarioReceptorSolicitud, ID_EstadoAmistad, FechaInicio)
        VALUES
            (@ID_UsuarioEmisorSolicitud, @ID_UsuarioReceptorSolicitud, 1, GETDATE())
    END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_IniciarSesion]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_IniciarSesion]
	@Correo			VARCHAR(200),
    @Contrasenna	VARCHAR(200)
AS
BEGIN
	
	  SELECT ID_Usuario,Correo,U.Nombre,U.Apellido1, U.Apellido2,U.FechaNacimiento,G.ID_Genero,G.Descripcion 'Genero',U.UrlFotoPerfil, U.ID_Rol, R.Descripcion 'NombreRol'
	  FROM	Tbl_Usuarios U
	  INNER JOIN Tbl_Roles R ON U.ID_Rol = R.ID_Rol
	  INNER JOIN Tbl_GenerosUsuario G ON U.ID_Genero = G.ID_Genero
	  WHERE	Correo = @Correo
	  AND Contrasenna = @Contrasenna
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ModificarPerfil]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ModificarPerfil]
    @ID_Usuario bigint,
    @Nombre varchar(200),
    @Apellido1 varchar (50),
    @Apellido2 varchar (50),
    @FechaNacimiento date,
    @ID_Genero varchar (50),
    @UrlFotoPerfil varchar (100),
    @SobreMi text
AS
BEGIN
    -- Actualizar el perfil del usuario
    UPDATE [dbo].[Tbl_Usuarios]
    SET [Nombre] = @Nombre,
        [Apellido1] = @Apellido1,
        [Apellido2] = @Apellido2,
        [FechaNacimiento] = @FechaNacimiento,
        [ID_Genero] = @ID_Genero, 
        [UrlFotoPerfil] = CASE WHEN @UrlFotoPerfil = '' THEN UrlFotoPerfil
                              ELSE @UrlFotoPerfil
                         END,
        [SobreMi] = @SobreMi
    WHERE ID_Usuario = @ID_Usuario;

    -- Seleccionar el perfil actualizado del usuario
    SELECT ID_Usuario,
           Correo,
           U.Nombre,
           U.Apellido1,
           U.Apellido2,
           U.FechaNacimiento,
           G.ID_Genero,
           G.Descripcion AS 'Genero',
           U.UrlFotoPerfil,
           U.ID_Rol,
           R.Descripcion AS 'NombreRol'
    FROM Tbl_Usuarios U
    INNER JOIN Tbl_Roles R ON U.ID_Rol = R.ID_Rol
    INNER JOIN Tbl_GenerosUsuario G ON U.ID_Genero = G.ID_Genero
    WHERE ID_Usuario = @ID_Usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublicacionesPerfil]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PublicacionesPerfil]
	@ID_Usuario BIGINT 
AS 
BEGIN

	SELECT 
		ID_Publicacion, 
		TextoContenido, 
		UrlFotoPublicacion + '/'+ CONVERT(VARCHAR, ID_Publicacion) + '.png' UrlFotoPublicacion, 
		FechaPublicacion, 
		Pais, 
		Estado, 
		Nombre, 
		UrlFotoPerfil, 
		P.ID_Usuario,
		(SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'MeGusta') AS MeGusta,
        (SELECT COUNT(*) FROM Tbl_Reacciones R WHERE R.ID_Publicacion = P.ID_Publicacion AND R.TipoReaccion = 'NoMeGusta') AS NoMeGusta

	FROM Tbl_Publicaciones P
	INNER JOIN Tbl_Usuarios U ON P.ID_Usuario = U.ID_Usuario
	WHERE u.ID_Usuario = @ID_Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarUsuario]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RegistrarUsuario]
	@Nombre	VARCHAR(100),
	@Apellido1	VARCHAR(100),
	@Apellido2	VARCHAR(100),
	@Correo VARCHAR(200),
    @Contrasenna VARCHAR(200),
	@FechaNacimiento Date,
	@ID_Genero smallint,
	@FullName VARCHAR(200)
    
AS
BEGIN
	IF NOT EXISTS(SELECT 1 FROM Tbl_Usuarios WHERE Correo = @Correo)
	BEGIN
		INSERT INTO Tbl_Usuarios(Nombre, Apellido1, Apellido2, Correo, Contrasenna,FechaNacimiento,ID_Genero,UrlFotoPerfil, Id_Rol, FullName)
		VALUES (@Nombre, @Apellido1, @Apellido2,@Correo,@Contrasenna,@FechaNacimiento,@ID_Genero,'/images/avatars/default-avatar.jpg',1, @FullName)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RestablecerContrasennaEIniciarSesion]    Script Date: 4/26/2024 6:48:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RestablecerContrasennaEIniciarSesion]
	@Correo VARCHAR(100),
	@Contrasenna VARCHAR(100),
	@ContrasennaTemporal VARCHAR(100)
AS
BEGIN

	UPDATE Tbl_Usuarios SET 
	ContrasennaTemporal = NULL, 
	Contrasenna = @Contrasenna
	WHERE Correo = @Correo
	AND @ContrasennaTemporal = @ContrasennaTemporal;

    EXEC IniciarSesion @Correo, @Contrasenna;

END
GO
USE [master]
GO
ALTER DATABASE [SocialNetwork2] SET  READ_WRITE 
GO
