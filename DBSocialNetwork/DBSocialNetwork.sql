DROP DATABASE [SocialNetwork]

CREATE[SocialNetwork]
USE [SocialNetwork]
GO
/****** Object:  Table [dbo].[Tbl_Amistades]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Amistades](
	[ID_Amistad] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_UsuarioEmisorSolictud] [bigint] NOT NULL,
	[ID_UsuarioReceptorSolictud] [bigint] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[ID_EstadoAmistad] [smallint] NOT NULL,
 CONSTRAINT [PK_Tbl_Amistades] PRIMARY KEY CLUSTERED 
(
	[ID_Amistad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Chats]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_Comentarios]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_EstadoAmistad]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_EstadoMensaje]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_GenerosUsuario]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_Mensajes]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_Publicaciones]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_ReaccionesComentarios]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ReaccionesComentarios](
	[ID_ReaccionComentario] [bigint] NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[ID_Comentario] [bigint] NOT NULL,
	[ID_TipoReaccion] [smallint] NOT NULL,
 CONSTRAINT [PK_Tbl_ReaccionesComentarios] PRIMARY KEY CLUSTERED 
(
	[ID_ReaccionComentario] ASC,
	[ID_Usuario] ASC,
	[ID_Comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ReaccionesPublicaciones]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ReaccionesPublicaciones](
	[ID_ReaccionPublicacion] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Usuario] [bigint] NOT NULL,
	[ID_Publicacion] [bigint] NOT NULL,
	[ID_TipoReaccion] [smallint] NOT NULL,
 CONSTRAINT [PK_Tbl_ReaccionesPublicaciones] PRIMARY KEY CLUSTERED 
(
	[ID_ReaccionPublicacion] ASC,
	[ID_Usuario] ASC,
	[ID_Publicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Roles]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  Table [dbo].[Tbl_TipoReaccion]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_TipoReaccion](
	[ID_TipoReaccion] [smallint] NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Tbl_TipoReaccion] PRIMARY KEY CLUSTERED 
(
	[ID_TipoReaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Usuarios]    Script Date: 4/24/2024 3:50:37 PM ******/
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
INSERT [dbo].[Tbl_EstadoAmistad] ([ID_EstadoAmistad], [Descripcion]) VALUES (1, N'NoAmigo')
INSERT [dbo].[Tbl_EstadoAmistad] ([ID_EstadoAmistad], [Descripcion]) VALUES (2, N'Pendiente')
INSERT [dbo].[Tbl_EstadoAmistad] ([ID_EstadoAmistad], [Descripcion]) VALUES (3, N'Amigo')
GO
INSERT [dbo].[Tbl_GenerosUsuario] ([ID_Genero], [Descripcion]) VALUES (1, N'Masculino')
INSERT [dbo].[Tbl_GenerosUsuario] ([ID_Genero], [Descripcion]) VALUES (2, N'Femenino')
INSERT [dbo].[Tbl_GenerosUsuario] ([ID_Genero], [Descripcion]) VALUES (3, N'No indicar')
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
ALTER TABLE [dbo].[Tbl_ReaccionesComentarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ReaccionesComentarios_Tbl_Comentarios] FOREIGN KEY([ID_Comentario])
REFERENCES [dbo].[Tbl_Comentarios] ([ID_Comentario])
GO
ALTER TABLE [dbo].[Tbl_ReaccionesComentarios] CHECK CONSTRAINT [FK_Tbl_ReaccionesComentarios_Tbl_Comentarios]
GO
ALTER TABLE [dbo].[Tbl_ReaccionesComentarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ReaccionesComentarios_Tbl_ReaccionesComentarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Tbl_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Tbl_ReaccionesComentarios] CHECK CONSTRAINT [FK_Tbl_ReaccionesComentarios_Tbl_ReaccionesComentarios]
GO
ALTER TABLE [dbo].[Tbl_ReaccionesComentarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ReaccionesComentarios_Tbl_TipoReaccion] FOREIGN KEY([ID_TipoReaccion])
REFERENCES [dbo].[Tbl_TipoReaccion] ([ID_TipoReaccion])
GO
ALTER TABLE [dbo].[Tbl_ReaccionesComentarios] CHECK CONSTRAINT [FK_Tbl_ReaccionesComentarios_Tbl_TipoReaccion]
GO
ALTER TABLE [dbo].[Tbl_ReaccionesPublicaciones]  WITH CHECK ADD  CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_Publicaciones] FOREIGN KEY([ID_Publicacion])
REFERENCES [dbo].[Tbl_Publicaciones] ([ID_Publicacion])
GO
ALTER TABLE [dbo].[Tbl_ReaccionesPublicaciones] CHECK CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_Publicaciones]
GO
ALTER TABLE [dbo].[Tbl_ReaccionesPublicaciones]  WITH CHECK ADD  CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_TipoReaccion] FOREIGN KEY([ID_TipoReaccion])
REFERENCES [dbo].[Tbl_TipoReaccion] ([ID_TipoReaccion])
GO
ALTER TABLE [dbo].[Tbl_ReaccionesPublicaciones] CHECK CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_TipoReaccion]
GO
ALTER TABLE [dbo].[Tbl_ReaccionesPublicaciones]  WITH CHECK ADD  CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_Usuarios] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Tbl_Usuarios] ([ID_Usuario])
GO
ALTER TABLE [dbo].[Tbl_ReaccionesPublicaciones] CHECK CONSTRAINT [FK_TblReaccionesPublicaciones_Tbl_Usuarios]
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
/****** Object:  StoredProcedure [dbo].[CrearPublicacion]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearPublicacion]
	@ID_Usuario bigint,
	@TextoContenido varchar(300),
	@UrlFotoPublicacion varchar(100),
	@Pais varchar(200),
	@Estado varchar(200)

AS 
BEGIN

	INSERT INTO [dbo].[Tbl_Publicaciones]([ID_Usuario],[TextoContenido],[UrlFotoPublicacion],[FechaPublicacion],[Pais],[Estado])
	VALUES (@ID_Usuario,@TextoContenido,@UrlFotoPublicacion,GETDATE(),@Pais,@Estado)

	SELECT @@IDENTITY 'ID_Publicacion'

END

GO
/****** Object:  StoredProcedure [dbo].[EliminarPublicacion]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPublicacion]
	@ID_Publicacion	 bigint
AS
BEGIN
	DELETE FROM [dbo].[Tbl_Publicaciones]
		  WHERE @ID_Publicacion = ID_Publicacion
	END
GO
/****** Object:  StoredProcedure [dbo].[SP_AgregarContrasennaTemporal]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ConsultarGenerosUsuario]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ConsultarPublicaciones]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarPublicaciones]

AS 
BEGIN

	SELECT ID_Publicacion, TextoContenido, FechaPublicacion, Pais, Estado, UrlFotoPerfil, Nombre, UrlFotoPublicacion + '/'+ CONVERT(VARCHAR, ID_Publicacion) + '.png' UrlFotoPublicacion, P.ID_Usuario 
	FROM Tbl_Publicaciones P
	INNER JOIN Tbl_Usuarios U ON P.ID_Usuario = U.ID_Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarUsuarioPorId]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ConsultarUsuarioPorNombre]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_IniciarSesion]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ModificarPerfil]    Script Date: 4/24/2024 3:50:37 PM ******/
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
UPDATE [dbo].[Tbl_Usuarios]
   SET  [Nombre] = @Nombre,
		[Apellido1] = @Apellido1,
        [Apellido2] = @Apellido2,
        [FechaNacimiento] = @FechaNacimiento,
        ID_Genero = @ID_Genero, 
		[UrlFotoPerfil] = case when @UrlFotoPerfil='' then UrlFotoPerfil
					  else      @UrlFotoPerfil    end,

        [SobreMi] = @SobreMi

 WHERE ID_Usuario = @ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PerfilUsuario]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PerfilUsuario]
	@ID_Usuario bigint
AS 
BEGIN

    DECLARE @cantidadPublicaciones int

    SELECT @cantidadPublicaciones = COUNT(*) 
    FROM Tbl_Publicaciones
    WHERE ID_Usuario = @ID_Usuario

	DECLARE @totalMeGusta int

    SELECT @totalMeGusta = SUM(MeGusta) 
    FROM Tbl_Publicaciones
    WHERE ID_Usuario = @ID_Usuario

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
	  @totalMeGusta AS totalMeGusta,
	  @cantidadPublicaciones AS cantidadPublicaciones
 
	FROM dbo.Tbl_Usuarios U
	JOIN Tbl_GenerosUsuario G ON U.ID_Genero = G.ID_Genero
	WHERE ID_Usuario = @ID_Usuario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PublicacionesPerfil]    Script Date: 4/24/2024 3:50:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_PublicacionesPerfil]
	@ID_Usuario BIGINT 
AS 
BEGIN

	SELECT ID_Publicacion, TextoContenido, UrlFotoPublicacion + '/'+ CONVERT(VARCHAR, ID_Publicacion) + '.png' UrlFotoPublicacion, FechaPublicacion, Pais, Estado, Nombre, UrlFotoPerfil, P.ID_Usuario

	FROM Tbl_Publicaciones P
	INNER JOIN Tbl_Usuarios U ON P.ID_Usuario = U.ID_Usuario
		WHERE u.ID_Usuario = @ID_Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarUsuario]    Script Date: 4/24/2024 3:50:37 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_RestablecerContrasennaEIniciarSesion]    Script Date: 4/24/2024 3:50:37 PM ******/
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

    EXEC SP_IniciarSesion @Correo, @Contrasenna;

END
GO
