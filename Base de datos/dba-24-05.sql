USE [master]
GO
/****** Object:  Database [DynaIT]    Script Date: 24/05/2022 11:45:03 a. m. ******/
CREATE DATABASE [DynaIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DynaIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DynaIT.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DynaIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DynaIT_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DynaIT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DynaIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DynaIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DynaIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DynaIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DynaIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DynaIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [DynaIT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DynaIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DynaIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DynaIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DynaIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DynaIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DynaIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DynaIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DynaIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DynaIT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DynaIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DynaIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DynaIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DynaIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DynaIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DynaIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DynaIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DynaIT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DynaIT] SET  MULTI_USER 
GO
ALTER DATABASE [DynaIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DynaIT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DynaIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DynaIT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DynaIT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DynaIT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DynaIT] SET QUERY_STORE = OFF
GO
USE [DynaIT]
GO
/****** Object:  Table [dbo].[acta]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acta](
	[id_acta] [int] IDENTITY(1,1) NOT NULL,
	[numero_Acta] [nvarchar](45) NOT NULL,
	[fecha_crea_acta] [datetime2](7) NOT NULL,
	[ticket_id] [int] NOT NULL,
	[n_creditos_acta] [int] NOT NULL,
	[numero_Factura] [nvarchar](45) NOT NULL,
	[fk_usuario_id] [int] NOT NULL,
 CONSTRAINT [pk_id_acta] PRIMARY KEY CLUSTERED 
(
	[id_acta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[area]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[area](
	[id_area] [int] IDENTITY(1,1) NOT NULL,
	[area] [nvarchar](45) NOT NULL,
	[area_Habilitado] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_id_area] PRIMARY KEY CLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [nvarchar](45) NOT NULL,
	[correo_cli] [nvarchar](45) NOT NULL,
	[Telefono_cliente] [nvarchar](45) NOT NULL,
	[rol_id] [int] NOT NULL,
	[empresa_id] [int] NOT NULL,
	[Contrasena_cli] [nvarchar](max) NOT NULL,
	[Cliente_Habilitado] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_idCliente] PRIMARY KEY CLUSTERED 
(
	[id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresa](
	[id_empresa] [int] IDENTITY(1,1) NOT NULL,
	[nombre_empresa] [nvarchar](45) NOT NULL,
	[nit] [nvarchar](45) NOT NULL,
	[telefono_empresa] [nvarchar](45) NOT NULL,
	[representante_empresa] [nvarchar](45) NOT NULL,
	[empresa_habilitada] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_id_empresa] PRIMARY KEY CLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_ticket]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_ticket](
	[id_Estado_Ticket] [int] IDENTITY(1,1) NOT NULL,
	[estado_Ticket] [nvarchar](45) NOT NULL,
	[estado_Habilitado] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_id_estado_Ticket] PRIMARY KEY CLUSTERED 
(
	[id_Estado_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nota]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nota](
	[id_nota] [int] IDENTITY(1,1) NOT NULL,
	[descripcionNota] [nvarchar](max) NOT NULL,
	[FechaNota] [datetime2](7) NOT NULL,
	[id_ticket] [int] NOT NULL,
	[usuario_id_nota] [int] NOT NULL,
	[nota_interna] [nvarchar](45) NOT NULL,
	[notas_Habilitado] [nvarchar](45) NOT NULL,
	[adjuntos_nota] [nvarchar](500) NOT NULL,
	[nota_usuario] [bit] NOT NULL,
	[cliente_id_nota] [int] NOT NULL,
 CONSTRAINT [PK_id_nota] PRIMARY KEY CLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notas_compartida_usuario]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notas_compartida_usuario](
	[id_Notas_compartida_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nota_id] [int] NOT NULL,
	[usario_id] [int] NOT NULL,
 CONSTRAINT [pk_id_Notas_compartida_usuario] PRIMARY KEY CLUSTERED 
(
	[id_Notas_compartida_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prioridad]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prioridad](
	[id_prioridad] [int] IDENTITY(1,1) NOT NULL,
	[Prioridad] [nvarchar](45) NOT NULL,
	[H_respuesta_prioridad] [int] NOT NULL,
	[prioridad_habilitada] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_id_prioridad] PRIMARY KEY CLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[rol] [nvarchar](45) NOT NULL,
	[rol_habiliado] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_id_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id_ticket] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Resumen_Problema] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[tipo_ticket_id] [int] NOT NULL,
	[prioridad_id] [int] NOT NULL,
	[estado_id] [int] NOT NULL,
	[cliente_id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[ticket_Creado_por] [nvarchar](45) NOT NULL,
	[creditos_desarrollo] [int] NOT NULL,
	[creditos_garantia] [int] NOT NULL,
	[fecha_vencimiento] [datetime2](7) NOT NULL,
	[ticket_Habilitado] [nvarchar](45) NOT NULL,
	[fecha_inicio_proceso] [datetime2](7) NOT NULL,
	[fecha_resuelto_ticket] [datetime2](7) NOT NULL,
	[fecha_cierre_ticket] [datetime2](7) NOT NULL,
	[adjuntos_ticket] [nvarchar](500) NOT NULL,
	[numero_Dias] [int] NOT NULL,
	[numero_Factura] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_id_ticket] PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_ticket]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_ticket](
	[id_tipo_Ticket] [int] IDENTITY(1,1) NOT NULL,
	[tipo_Ticket] [nvarchar](45) NOT NULL,
	[Tipo_Ticket_Habilitado] [nvarchar](45) NOT NULL,
	[H_respuesta_tipo_ticket] [int] NOT NULL,
 CONSTRAINT [pk_id_tipo_Ticket] PRIMARY KEY CLUSTERED 
(
	[id_tipo_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [nvarchar](45) NOT NULL,
	[correo_usu] [nvarchar](45) NOT NULL,
	[rol_id] [int] NOT NULL,
	[prefijo_usuario] [nvarchar](45) NOT NULL,
	[area_id] [int] NOT NULL,
	[contrasena_usu] [nvarchar](max) NOT NULL,
	[usuario_Habilitado] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_id_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[acta] ON 

INSERT [dbo].[acta] ([id_acta], [numero_Acta], [fecha_crea_acta], [ticket_id], [n_creditos_acta], [numero_Factura], [fk_usuario_id]) VALUES (1, N'3-c28-1', CAST(N'2022-04-04T08:22:14.0000000' AS DateTime2), 1, 0, N'1212', 10)
INSERT [dbo].[acta] ([id_acta], [numero_Acta], [fecha_crea_acta], [ticket_id], [n_creditos_acta], [numero_Factura], [fk_usuario_id]) VALUES (3, N'3-c41-2', CAST(N'2022-05-19T16:24:59.0000000' AS DateTime2), 4, 2, N'5454', 10)
SET IDENTITY_INSERT [dbo].[acta] OFF
GO
SET IDENTITY_INSERT [dbo].[area] ON 

INSERT [dbo].[area] ([id_area], [area], [area_Habilitado]) VALUES (1, N'--Seleccionar--', N'0')
INSERT [dbo].[area] ([id_area], [area], [area_Habilitado]) VALUES (2, N'Tecnología', N'Si')
INSERT [dbo].[area] ([id_area], [area], [area_Habilitado]) VALUES (3, N'nomina', N'Si')
INSERT [dbo].[area] ([id_area], [area], [area_Habilitado]) VALUES (4, N'facturacion electroni', N'Si')
INSERT [dbo].[area] ([id_area], [area], [area_Habilitado]) VALUES (5, N'Rh', N'No')
INSERT [dbo].[area] ([id_area], [area], [area_Habilitado]) VALUES (6, N'Gestion humana', N'No')
SET IDENTITY_INSERT [dbo].[area] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (1, N'--Seleccionar--', N'0', N'0', 1, 1, N'00', N'0')
INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (2, N'alirio sierras', N'jbuitrago919@misena.edu.co', N'3005013887', 5, 2, N' ꇦ뫒ힹ滟�琠�ٙ⾬⟴䲌懚䚉䉧鄰╞ᐨ鯙ꌲ�쓒뮬', N'Si')
INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (3, N'angelmiro hernandez', N'paez86@gmail.com', N'3213548789', 4, 3, N' �憨簬᯴麙合椣䠦剑헻冊뷂疯䤡藳끼萈뼀ᮖ캋䃋筋ꩶ⽱턄鳵⭄藄�ᵩ﵂푸툠罹荻帺忩鈜ᐡლ๛徝‭퐽ૈ믘ਤ멇䉀ꦚ輔惛蘖麀⎡�윋䲰㶋Н㣭侂㮡Ꭾʬᅗ䂀뒚좹雖Ꭰ骳떘⾚⏴珤詚䱺྇�ㅳ粡฿࢑貰볞屁⨊⪣漻㕤啸箁睪㒖铗�䄚ϴ搮䚤ᎏ眤䆹ﺝ㾊ᆮ馜踑暉䱷｝꯹롱븈埾䤾蝥멦ꎧ幟퀀瑹止섩鵁톯ꃹ㵂ךּ忭㖨ᐡ↻땔옜喖뉖ĸ��஭옂㇐ꖯᛅ୆ジ镗ஶ汱쎈낆웷曐럡梇헸냿�顧咽⽤ꀼ䉊ⴎ妤୅㐓䳄ꈂ禭㉏휛墘崉傹ۃ䀞⑅淍岖�㼩ㆊ췖蕩ﴄ엛癪踹嫳梱ⲻ弍髵혨뜜뇤璃⏂曞䘠๱큥柟칑��缾낳꫖匧屑ጲ빬婔닸�⯛옢ᅱ⭎䫚嘯頙胓輇▘䂡', N'Si')
INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (4, N'fernanda herrerá', N'10@gmail.com', N'4234567', 5, 2, N' 瞅ኁ濊㑚碷悮ژ׈᝽揵閉�偠㶨᪝戼蒏ࢗֆ', N'Si')
INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (5, N'David Héredia', N'10@gmail.com', N'4234567', 5, 2, N' 삤衲嚤瓩䢉퐡�茱耘띫徇뢎뵌뻦쩹ﶏ긺參ቁ赉ծ홞ᆋ￹毲猒�꓈폹৾ꚺ厚ꩮ띕ᔊ', N'No')
INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (6, N'javier heredia va', N'micjbuitragov@gmail.com', N'3005013887', 4, 3, N' 葉㡼왳휓鉸濐慖픣᫰䆣䴥識뼐ⷎ貳铅莟㠯邙㶤쇰加歋', N'Si')
INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (7, N'Cecilia hurtado', N'C29@gmail.com', N'3525457', 4, 3, N' ᤔ䲛铢乜㞘諵≔仙ࣼ媾㔭텍饝딌痨㛾�䑊봎⧷ᡵ奻ォᅣ⎉薯᯽핇Ę嵇㮊ᒊ쓫勣친鞗⯰嗌쯫舲뀕枥튴퍿㉖⣐룏㩂穑゗﹩諱먈௜䂙휡睜௰ꚜ둍鸲蓒锃探✼섊잜�娂ךּ췕譞琺譔ᕂ⯾ၥ꼈꽵僦叄뎎䮛먷戈쇣럛쿗膈硖聫⃚阦ﯼ', N'No')
INSERT [dbo].[cliente] ([id_Cliente], [nombre_cliente], [correo_cli], [Telefono_cliente], [rol_id], [empresa_id], [Contrasena_cli], [Cliente_Habilitado]) VALUES (8, N'Ernesto perez', N'sssss@gmail.com', N'32523121', 4, 3, N' ꀠ⯋갔Ḋꯠ俸졺瑓스爺ˌ壑黲驖�蕷�㷒쑂Ǻ䶩', N'Si')
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[empresa] ON 

INSERT [dbo].[empresa] ([id_empresa], [nombre_empresa], [nit], [telefono_empresa], [representante_empresa], [empresa_habilitada]) VALUES (1, N'--Seleccionar--', N'--Seleccionar--', N'--Seleccionar--', N'00', N'00')
INSERT [dbo].[empresa] ([id_empresa], [nombre_empresa], [nit], [telefono_empresa], [representante_empresa], [empresa_habilitada]) VALUES (2, N'Espumas', N'9001274376', N'7354578', N'Pedro perez', N'Si')
INSERT [dbo].[empresa] ([id_empresa], [nombre_empresa], [nit], [telefono_empresa], [representante_empresa], [empresa_habilitada]) VALUES (3, N'Gramalote', N'800.197.267.3', N'3204157896', N'fabio ospina', N'Si')
SET IDENTITY_INSERT [dbo].[empresa] OFF
GO
SET IDENTITY_INSERT [dbo].[estado_ticket] ON 

INSERT [dbo].[estado_ticket] ([id_Estado_Ticket], [estado_Ticket], [estado_Habilitado]) VALUES (1, N'--Seleccionar--', N'0')
INSERT [dbo].[estado_ticket] ([id_Estado_Ticket], [estado_Ticket], [estado_Habilitado]) VALUES (2, N'Abierto', N'Si')
INSERT [dbo].[estado_ticket] ([id_Estado_Ticket], [estado_Ticket], [estado_Habilitado]) VALUES (3, N'En proceso', N'Si')
INSERT [dbo].[estado_ticket] ([id_Estado_Ticket], [estado_Ticket], [estado_Habilitado]) VALUES (4, N'Resuelto', N'Si')
INSERT [dbo].[estado_ticket] ([id_Estado_Ticket], [estado_Ticket], [estado_Habilitado]) VALUES (5, N'Cerrado', N'Si')
SET IDENTITY_INSERT [dbo].[estado_ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[nota] ON 

INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (1, N'validar inserciones vacias', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 10, N'Si', N'Si', N'C:\Users\Javier\Documents\Prueba\1', 1, 1)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (3, N'Se reabre caso', CAST(N'2022-05-19T11:28:54.0000000' AS DateTime2), 1, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\1\ 1', 1, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (4, N'Se da solución al caso y se validan pruebas fucionales con el usuario', CAST(N'2022-05-19T14:40:04.0000000' AS DateTime2), 4, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\4\ 1', 1, 8)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (5, N'Se solicita al usuario realizar pruebas para dar cierre de caso', CAST(N'2022-05-19T14:40:21.0000000' AS DateTime2), 4, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\4\ 1', 1, 8)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (6, N'se genera acta de solucion', CAST(N'2022-05-19T16:24:59.0000000' AS DateTime2), 4, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\4\ 1', 1, 8)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (7, N'Se cambia el cliente solicitante del ticket', CAST(N'2022-05-19T16:48:41.0000000' AS DateTime2), 4, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\4\ 1', 1, 8)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (8, N'se cambia el cliente solicitante', CAST(N'2022-05-19T16:49:20.0000000' AS DateTime2), 3, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\2\ 1', 1, 4)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (9, N'se agrega nota del cliente', CAST(N'2022-05-19T16:50:49.0000000' AS DateTime2), 4, 16, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\4\ 1', 0, 6)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (10, N'otra nota del cliente', CAST(N'2022-05-19T16:51:22.0000000' AS DateTime2), 4, 16, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\4\ 1', 0, 6)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (11, N'Se agrega nota de ', CAST(N'2022-05-19T16:58:50.0000000' AS DateTime2), 3, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\2\ 1', 0, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (12, N'Se agrega notas', CAST(N'2022-05-19T16:59:33.0000000' AS DateTime2), 3, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\2\ 1', 0, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (13, N'Se solicita al usuario realizar pruebas para dar cierre de caso', CAST(N'2022-05-19T16:59:54.0000000' AS DateTime2), 1, 22, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\1\ 1', 0, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (14, N'Se evidencian que la asignación manual es correcta y el caso es notificado por correo se espera revisión por parte del área encargada', CAST(N'2022-05-19T17:30:26.0000000' AS DateTime2), 5, 1, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\5\ 1', 0, 6)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (15, N'Se realiza cierre de caso y se valdian las fechas de cierre correctamente', CAST(N'2022-05-19T17:32:08.0000000' AS DateTime2), 4, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\4\ 1', 1, 6)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (16, N'Se solicita al usuario realizar pruebas para dar cierre de caso', CAST(N'2022-05-20T09:00:46.0000000' AS DateTime2), 5, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\5\ 1', 1, 6)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (17, N'se crea nota de prueba', CAST(N'2022-05-23T07:29:27.0000000' AS DateTime2), 6, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\6\ 1', 1, 6)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (18, N'Se valida lo requerido por el cliente', CAST(N'2022-05-23T07:34:15.0000000' AS DateTime2), 3, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\2\ 1', 1, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (19, N'Se da respuesta al usuario delas validación requerida', CAST(N'2022-05-23T07:34:56.0000000' AS DateTime2), 3, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\2\ 1', 1, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (20, N'Se realiza revisión del caso en el servidor de desarollo', CAST(N'2022-05-23T09:47:41.0000000' AS DateTime2), 1, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\1\ 1', 1, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (21, N'Se realiza revisión del caso en el servidor de desarollo', CAST(N'2022-05-23T09:48:01.0000000' AS DateTime2), 6, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\6\ 1', 1, 6)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (22, N'Se solicita al usuario realizar pruebas para dar cierre de caso', CAST(N'2022-05-23T10:24:53.0000000' AS DateTime2), 7, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\7\ 1', 1, 4)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (23, N'Se reasigna caso para la revisión', CAST(N'2022-05-23T10:25:41.0000000' AS DateTime2), 8, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\8\ 1', 1, 4)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (24, N'<div style = ''background-color:gainsboro;''><p style =''color: red;'' ><small style=''font-size:.6em; ''> N_ticket: 9</small></p></div>Se da solución al caso y se validan pruebas fucionales con el usuario', CAST(N'2022-05-23T10:28:25.0000000' AS DateTime2), 10, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\9\ 1', 1, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (25, N'<div style = ''background-color:gainsboro;''><p style =''color: red;'' ><small style=''font-size:.6em; ''> N_ticket: 9</small></p></div>Se requiere la revisión oportuna del caso ', CAST(N'2022-05-23T10:29:12.0000000' AS DateTime2), 10, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\9\ 1', 0, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (26, N'Se reasigna caso para la revisión', CAST(N'2022-05-23T10:32:43.0000000' AS DateTime2), 1, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\1\ 1', 1, 2)
INSERT [dbo].[nota] ([id_nota], [descripcionNota], [FechaNota], [id_ticket], [usuario_id_nota], [nota_interna], [notas_Habilitado], [adjuntos_nota], [nota_usuario], [cliente_id_nota]) VALUES (27, N'se revisan la creacio  de fechas', CAST(N'2022-05-24T10:31:52.0000000' AS DateTime2), 10, 10, N'No', N'Si', N'C:\Users\Javier\Documents\Prueba\10\ 1', 1, 6)
SET IDENTITY_INSERT [dbo].[nota] OFF
GO
SET IDENTITY_INSERT [dbo].[notas_compartida_usuario] ON 

INSERT [dbo].[notas_compartida_usuario] ([id_Notas_compartida_usuario], [nota_id], [usario_id]) VALUES (1, 1, 2)
SET IDENTITY_INSERT [dbo].[notas_compartida_usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[prioridad] ON 

INSERT [dbo].[prioridad] ([id_prioridad], [Prioridad], [H_respuesta_prioridad], [prioridad_habilitada]) VALUES (1, N'--Seleccionar--', 0, N'No')
INSERT [dbo].[prioridad] ([id_prioridad], [Prioridad], [H_respuesta_prioridad], [prioridad_habilitada]) VALUES (2, N'Baja', 12, N'Si')
INSERT [dbo].[prioridad] ([id_prioridad], [Prioridad], [H_respuesta_prioridad], [prioridad_habilitada]) VALUES (3, N'Media', 6, N'Si')
INSERT [dbo].[prioridad] ([id_prioridad], [Prioridad], [H_respuesta_prioridad], [prioridad_habilitada]) VALUES (4, N'Alta', 3, N'Si')
INSERT [dbo].[prioridad] ([id_prioridad], [Prioridad], [H_respuesta_prioridad], [prioridad_habilitada]) VALUES (5, N'Urgente', 1, N'Si')
SET IDENTITY_INSERT [dbo].[prioridad] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([id_rol], [rol], [rol_habiliado]) VALUES (1, N'--Seleccionar--', N'Si')
INSERT [dbo].[rol] ([id_rol], [rol], [rol_habiliado]) VALUES (2, N'Administrador', N'Si')
INSERT [dbo].[rol] ([id_rol], [rol], [rol_habiliado]) VALUES (3, N'Agente', N'Si')
INSERT [dbo].[rol] ([id_rol], [rol], [rol_habiliado]) VALUES (4, N'Cliente admin', N'Si')
INSERT [dbo].[rol] ([id_rol], [rol], [rol_habiliado]) VALUES (5, N'Cliente', N'Si')
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket] ON 

INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (1, CAST(N'1753-01-01T00:00:00.0000000' AS DateTime2), N'errorese de inserción', N'errorese de inserción', 2, 2, 4, 2, 22, N'jbuitrago919@gmail.com', 9, 0, CAST(N'1753-02-01T00:00:00.0000000' AS DateTime2), N'Si', CAST(N'1753-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-05-23T10:32:43.8566667' AS DateTime2), CAST(N'2022-05-24T10:32:43.7833333' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\1', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (3, CAST(N'2022-05-19T11:40:05.0000000' AS DateTime2), N'Se asigna caso a usuario especifica', N'Se asigna caso a usuario especifica
Se asigna caso a usuario especifica
Se asigna caso a usuario especificaSe asigna caso a usuario especifica
Se asigna caso a usuario especifica', 2, 5, 4, 2, 10, N'jbuitrago919@gmail.com', 0, 0, CAST(N'2022-05-20T12:40:05.0000000' AS DateTime2), N'Si', CAST(N'2022-05-19T11:40:05.0000000' AS DateTime2), CAST(N'2022-05-23T07:34:56.5166667' AS DateTime2), CAST(N'2022-05-24T07:34:56.4666667' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\2', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (4, CAST(N'2022-05-19T11:41:27.0000000' AS DateTime2), N'Se crea caso de prueba un nuevo consultor', N'Se crea caso de prueba un nuevo consultorSe crea caso de prueba un nuevo consultorSe crea caso de prueba un nuevo consultor
Se crea caso de prueba un nuevo consultor', 2, 4, 4, 6, 16, N'jbuitrago919@gmail.com', 2, 0, CAST(N'2022-05-19T14:41:27.0000000' AS DateTime2), N'Si', CAST(N'2022-05-19T14:40:21.0000000' AS DateTime2), CAST(N'2022-05-19T17:32:08.4766667' AS DateTime2), CAST(N'2022-05-20T17:32:08.1833333' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\4', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (5, CAST(N'2022-05-19T17:29:58.0000000' AS DateTime2), N'Se requiere validar la fecha de cierre del caso', N'Se requiere validar la fecha de cierre del caso
Se requiere validar la fecha de cierre del casoSe requiere validar la fecha de cierre del caso
', 2, 2, 2, 6, 1, N'micjbuitragov@gmail.com', 0, 0, CAST(N'2022-05-21T05:29:58.0000000' AS DateTime2), N'Si', CAST(N'2022-05-19T17:29:58.0000000' AS DateTime2), CAST(N'2022-05-20T09:00:46.6566667' AS DateTime2), CAST(N'2022-05-20T09:00:46.6566667' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\5', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (6, CAST(N'2022-05-20T14:03:59.0000000' AS DateTime2), N'Se requiere validar la fecha de cierre del caso', N'Se requiere validar la fecha de cierre del casoSe requiere validar la fecha de cierre del casoSe requiere validar la fecha de cierre del caso', 3, 5, 4, 6, 11, N'jbuitrago919@gmail.com', 0, 0, CAST(N'2022-05-21T21:03:59.0000000' AS DateTime2), N'Si', CAST(N'2022-05-20T14:03:59.0000000' AS DateTime2), CAST(N'2022-05-23T09:48:01.2700000' AS DateTime2), CAST(N'2022-05-24T09:48:01.2600000' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\6', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (7, CAST(N'2022-05-23T09:49:26.0000000' AS DateTime2), N'Se requiere ver los credtos ', N'Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos ', 3, 4, 2, 4, 11, N'jbuitrago919@gmail.com', 0, 0, CAST(N'2022-05-24T18:49:26.0000000' AS DateTime2), N'Si', CAST(N'2022-05-23T09:49:26.0000000' AS DateTime2), CAST(N'2022-05-23T10:24:53.5833333' AS DateTime2), CAST(N'2022-05-23T10:24:53.5833333' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\7', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (8, CAST(N'2022-05-23T09:50:35.0000000' AS DateTime2), N'Se requiere ver los credtos ', N'Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos Se requiere ver los credtos 
', 3, 4, 2, 4, 11, N'jbuitrago919@gmail.com', 0, 0, CAST(N'2022-05-24T18:50:35.0000000' AS DateTime2), N'Si', CAST(N'2022-05-23T09:50:35.0000000' AS DateTime2), CAST(N'2022-05-23T10:25:41.1233333' AS DateTime2), CAST(N'2022-05-23T10:25:41.1233333' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\8', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (9, CAST(N'2022-05-23T10:28:00.0000000' AS DateTime2), N'Se requiere validar los caso con notas hechas por el usuario', N'Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde', 2, 4, 2, 2, 10, N'jbuitrago919@gmail.com', 0, 0, CAST(N'2022-05-24T13:28:00.0000000' AS DateTime2), N'No', CAST(N'2022-05-23T10:28:00.0000000' AS DateTime2), CAST(N'2022-05-23T10:29:12.9333333' AS DateTime2), CAST(N'2022-05-23T10:29:12.9333333' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\9', 0, N'0')
INSERT [dbo].[ticket] ([id_ticket], [Fecha], [Resumen_Problema], [Descripcion], [tipo_ticket_id], [prioridad_id], [estado_id], [cliente_id], [usuario_id], [ticket_Creado_por], [creditos_desarrollo], [creditos_garantia], [fecha_vencimiento], [ticket_Habilitado], [fecha_inicio_proceso], [fecha_resuelto_ticket], [fecha_cierre_ticket], [adjuntos_ticket], [numero_Dias], [numero_Factura]) VALUES (10, CAST(N'2022-05-24T10:09:11.0000000' AS DateTime2), N'Se requiere validar reporte diario', N' <div style=''background-color:gainsboro; ''><h5>  N_ tICKET: 9</h5><h3> Se requiere validar los caso con notas hechas por el usuario </h3> <p> Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde
Se requiere validar los caso con notas hechas por el usuario, se marquen de color verde</p><p></p> </div> Se requiere validar reporte diario
con la creación de casos y asignación  ', 3, 5, 2, 6, 10, N'jbuitrago919@gmail.com', 0, 0, CAST(N'2022-05-25T17:09:11.0000000' AS DateTime2), N'Si', CAST(N'2022-05-24T10:09:11.0000000' AS DateTime2), CAST(N'2022-05-24T10:32:20.9200000' AS DateTime2), CAST(N'2022-05-24T10:32:20.9200000' AS DateTime2), N'C:\Users\Javier\Documents\Prueba\10', 0, N'0')
SET IDENTITY_INSERT [dbo].[ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_ticket] ON 

INSERT [dbo].[tipo_ticket] ([id_tipo_Ticket], [tipo_Ticket], [Tipo_Ticket_Habilitado], [H_respuesta_tipo_ticket]) VALUES (1, N'--Seleccionar--', N'0', 0)
INSERT [dbo].[tipo_ticket] ([id_tipo_Ticket], [tipo_Ticket], [Tipo_Ticket_Habilitado], [H_respuesta_tipo_ticket]) VALUES (2, N'Incidente', N'Si', 24)
INSERT [dbo].[tipo_ticket] ([id_tipo_Ticket], [tipo_Ticket], [Tipo_Ticket_Habilitado], [H_respuesta_tipo_ticket]) VALUES (3, N'Desarrollo', N'Si', 30)
SET IDENTITY_INSERT [dbo].[tipo_ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (1, N'Sin asignar', N'sin asignar', 1, N'Sin asignar', 1, N'sin asignar', N'')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (2, N'--Seleccionar--', N'--Seleccionar--', 1, N'--Seleccionar--', 1, N'0*0*', N'')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (10, N'Javier Buitrago v', N'jbuitrago919@gmail.com', 2, N'c28', 3, N' 鄲び⩍⚼답ꞙ靌䗥춊�ߡ昪ꈼ蜧똗抑仮އ풺멳砳�', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (11, N'eulalia paez ', N'pruebadynamics23@gmail.com', 3, N'c58', 3, N' 嘭灴Φ伾﮷땨币퇈綬ᶞ랞ꌣ㣸쯓᛺걪盹쭡蹀❸ 줗㉁槲', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (12, N'deicy hernandez', N'deihernandez@gmails.com', 3, N'c58', 2, N' 瑧ꋢ袍뤸毢뙻彚障ởⳖ꒔ㄷ咝懟夛蚦뫥ャ', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (13, N'salome hernendez', N'salomehernande@gmaisl.com', 2, N'c45', 3, N' ᐫ扮⿐怣괐ꬪ骭૊圎Ⰲ襪銑솄縆䓫≴镲넻曉�', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (14, N'federico hernandez', N'fhernandez@gmails.com', 3, N'c78', 2, N' �燂�数噵煒릯鋍訳ᨿ纫돭ꐎ鹨굃⨭騁됹쎯⪟徴ᶑ', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (15, N'antonio buitrago', N'abuitrago@gmails.com', 2, N'c46', 3, N' ֵ姄�⸹춲Ĭᶖ㷓໠뇞듴澥腳ຣ脢卬廸蠡翙靤䆿㝔ꢳﲵ', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (16, N'favier rivera', N'frivera@gmails.com', 3, N'c41', 4, N' 餗�뾯㹒�穲੠榕禡쳔﯑ŭ磋讲ઈ擪㄂స埾ᖥ艈⹫ꀥ', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (17, N'avelardo jara perez', N'jbu@gmail.com', 2, N'c75', 2, N' ＂ﲀ᫹꾈焚锑�俫恕ꑼ壙匪柅い뺟먝ℎᦟ纭', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (21, N'pablo', N'jhhsalomehernande@gmaisl.com', 2, N'c24', 3, N' आ挭ʥ袰ݔΖ㶳Ӱᬚ닮镞쩄匋᱅貵㫬젣ꇊ陛ꠄ閮', N'No')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (22, N'eulalia paez ', N'jbuitragoaa@cancer.co', 2, N'c45', 3, N' 涄ⷌ鿡圻ꢏ孇縗�ᨰﾜ⍠꺻ꮍ칗姓ጔᛸ绣ᶝ仙뭶틽쬆⸧', N'Si')
INSERT [dbo].[usuario] ([id_usuario], [nombre_usuario], [correo_usu], [rol_id], [prefijo_usuario], [area_id], [contrasena_usu], [usuario_Habilitado]) VALUES (23, N'asdasdasdasd', N'asdasda@gmail.com', 2, N'c30', 2, N' ᳓魪菰뻧̧ᴄ릀ȥ࿌朩㪗驭﬙ϼઘ踇㥅谲輹썌', N'No')
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
/****** Object:  Index [uk_id_acta]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[acta] ADD  CONSTRAINT [uk_id_acta] UNIQUE NONCLUSTERED 
(
	[id_acta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_area]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[area] ADD  CONSTRAINT [uk_id_area] UNIQUE NONCLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_idCliente]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[cliente] ADD  CONSTRAINT [uk_idCliente] UNIQUE NONCLUSTERED 
(
	[id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_empresa]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[empresa] ADD  CONSTRAINT [uk_id_empresa] UNIQUE NONCLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_Estado_ticket]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[estado_ticket] ADD  CONSTRAINT [uk_id_Estado_ticket] UNIQUE NONCLUSTERED 
(
	[id_Estado_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_nota]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[nota] ADD  CONSTRAINT [uk_id_nota] UNIQUE NONCLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_Notas_compartida_usuario]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[notas_compartida_usuario] ADD  CONSTRAINT [uk_id_Notas_compartida_usuario] UNIQUE NONCLUSTERED 
(
	[id_Notas_compartida_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_prioridad]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[prioridad] ADD  CONSTRAINT [uk_id_prioridad] UNIQUE NONCLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_rol]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[rol] ADD  CONSTRAINT [uk_id_rol] UNIQUE NONCLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_Ticket]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [uk_id_Ticket] UNIQUE NONCLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_tipo_Ticket]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[tipo_ticket] ADD  CONSTRAINT [uk_id_tipo_Ticket] UNIQUE NONCLUSTERED 
(
	[id_tipo_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uk_id_usuario]    Script Date: 24/05/2022 11:45:03 a. m. ******/
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [uk_id_usuario] UNIQUE NONCLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[acta] ADD  CONSTRAINT [DF__acta__numero_Act__75A278F5]  DEFAULT ('0') FOR [numero_Acta]
GO
ALTER TABLE [dbo].[acta] ADD  CONSTRAINT [DF__acta__fecha_crea__76969D2E]  DEFAULT ('0001-01-01 00:00:00') FOR [fecha_crea_acta]
GO
ALTER TABLE [dbo].[acta] ADD  CONSTRAINT [DF__acta__n_creditos__778AC167]  DEFAULT ((0)) FOR [n_creditos_acta]
GO
ALTER TABLE [dbo].[acta] ADD  CONSTRAINT [DF__acta__numero_Fac__787EE5A0]  DEFAULT ('0') FOR [numero_Factura]
GO
ALTER TABLE [dbo].[area] ADD  DEFAULT ('Si') FOR [area_Habilitado]
GO
ALTER TABLE [dbo].[cliente] ADD  CONSTRAINT [DF__cliente__Cliente__48CFD27E]  DEFAULT ('Si') FOR [Cliente_Habilitado]
GO
ALTER TABLE [dbo].[empresa] ADD  DEFAULT ('Si') FOR [empresa_habilitada]
GO
ALTER TABLE [dbo].[estado_ticket] ADD  DEFAULT ('Si') FOR [estado_Habilitado]
GO
ALTER TABLE [dbo].[nota] ADD  CONSTRAINT [DF__nota__FechaNota__6B24EA82]  DEFAULT ('0001-01-01 00:00:00') FOR [FechaNota]
GO
ALTER TABLE [dbo].[nota] ADD  CONSTRAINT [DF__nota__notas_Habi__6C190EBB]  DEFAULT ('Si') FOR [notas_Habilitado]
GO
ALTER TABLE [dbo].[nota] ADD  CONSTRAINT [DF_nota_nota_usuario]  DEFAULT ((0)) FOR [nota_usuario]
GO
ALTER TABLE [dbo].[nota] ADD  CONSTRAINT [DF_nota_cliente_id_nota]  DEFAULT ((1)) FOR [cliente_id_nota]
GO
ALTER TABLE [dbo].[prioridad] ADD  DEFAULT ('Si') FOR [prioridad_habilitada]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ('Si') FOR [rol_habiliado]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF__ticket__Fecha__59FA5E80]  DEFAULT ('1753-01-01 00:00:00') FOR [Fecha]
GO
ALTER TABLE [dbo].[ticket] ADD  DEFAULT ((0)) FOR [creditos_desarrollo]
GO
ALTER TABLE [dbo].[ticket] ADD  DEFAULT ((0)) FOR [creditos_garantia]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF__ticket__fecha_ve__5CD6CB2B]  DEFAULT ('1753-01-01 00:00:00') FOR [fecha_vencimiento]
GO
ALTER TABLE [dbo].[ticket] ADD  DEFAULT ('Si') FOR [ticket_Habilitado]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF__ticket__fecha_in__5EBF139D]  DEFAULT ('1753-01-01 00:00:00') FOR [fecha_inicio_proceso]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF__ticket__fecha_re__5FB337D6]  DEFAULT ('1753-01-01 00:00:00') FOR [fecha_resuelto_ticket]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF__ticket__fecha_ci__60A75C0F]  DEFAULT ('1753-01-01 00:00:00') FOR [fecha_cierre_ticket]
GO
ALTER TABLE [dbo].[ticket] ADD  DEFAULT ((0)) FOR [numero_Dias]
GO
ALTER TABLE [dbo].[ticket] ADD  DEFAULT ((0)) FOR [numero_Factura]
GO
ALTER TABLE [dbo].[tipo_ticket] ADD  DEFAULT ('Si') FOR [Tipo_Ticket_Habilitado]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF__usuario__usuario__3F466844]  DEFAULT ('Si') FOR [usuario_Habilitado]
GO
ALTER TABLE [dbo].[acta]  WITH CHECK ADD  CONSTRAINT [fk_id_ticket_acta] FOREIGN KEY([ticket_id])
REFERENCES [dbo].[ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[acta] CHECK CONSTRAINT [fk_id_ticket_acta]
GO
ALTER TABLE [dbo].[acta]  WITH CHECK ADD  CONSTRAINT [FK_usuario_id] FOREIGN KEY([fk_usuario_id])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[acta] CHECK CONSTRAINT [FK_usuario_id]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [fk_id_empresa] FOREIGN KEY([empresa_id])
REFERENCES [dbo].[empresa] ([id_empresa])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [fk_id_empresa]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [fk_id_rol_cliente] FOREIGN KEY([rol_id])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [fk_id_rol_cliente]
GO
ALTER TABLE [dbo].[nota]  WITH CHECK ADD  CONSTRAINT [FK_cliente_id_nota] FOREIGN KEY([cliente_id_nota])
REFERENCES [dbo].[cliente] ([id_Cliente])
GO
ALTER TABLE [dbo].[nota] CHECK CONSTRAINT [FK_cliente_id_nota]
GO
ALTER TABLE [dbo].[nota]  WITH CHECK ADD  CONSTRAINT [fk_id_ticket_nota] FOREIGN KEY([id_ticket])
REFERENCES [dbo].[ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[nota] CHECK CONSTRAINT [fk_id_ticket_nota]
GO
ALTER TABLE [dbo].[nota]  WITH CHECK ADD  CONSTRAINT [FK_nota_usuario_id] FOREIGN KEY([usuario_id_nota])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[nota] CHECK CONSTRAINT [FK_nota_usuario_id]
GO
ALTER TABLE [dbo].[notas_compartida_usuario]  WITH CHECK ADD  CONSTRAINT [fk_id_Nota_compartida] FOREIGN KEY([nota_id])
REFERENCES [dbo].[nota] ([id_nota])
GO
ALTER TABLE [dbo].[notas_compartida_usuario] CHECK CONSTRAINT [fk_id_Nota_compartida]
GO
ALTER TABLE [dbo].[notas_compartida_usuario]  WITH CHECK ADD  CONSTRAINT [fk_id_usuario_n_compartida] FOREIGN KEY([usario_id])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[notas_compartida_usuario] CHECK CONSTRAINT [fk_id_usuario_n_compartida]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [fk_id_cliente] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([id_Cliente])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [fk_id_cliente]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [fk_id_estado] FOREIGN KEY([estado_id])
REFERENCES [dbo].[estado_ticket] ([id_Estado_Ticket])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [fk_id_estado]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [fk_id_prioridad] FOREIGN KEY([prioridad_id])
REFERENCES [dbo].[prioridad] ([id_prioridad])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [fk_id_prioridad]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [fk_id_tipo_ticket] FOREIGN KEY([tipo_ticket_id])
REFERENCES [dbo].[tipo_ticket] ([id_tipo_Ticket])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [fk_id_tipo_ticket]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD  CONSTRAINT [fk_id_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[ticket] CHECK CONSTRAINT [fk_id_usuario]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_id_area] FOREIGN KEY([area_id])
REFERENCES [dbo].[area] ([id_area])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_id_area]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [fk_id_rol] FOREIGN KEY([rol_id])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [fk_id_rol]
GO
/****** Object:  StoredProcedure [dbo].[change_password_cli]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[change_password_cli]
  @id_Cliente int,
  @Contrasena_cli nvarchar(max),
  @Patron varchar(50)
  as 
  begin 
  UPDATE cliente SET 
					 Contrasena_cli = ENCRYPTBYPASSPHRASE('Dynamics1', @Contrasena_cli)					 
					 WHERE id_Cliente = @id_Cliente
					 end
GO
/****** Object:  StoredProcedure [dbo].[change_password_usu]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[change_password_usu]
  @id_usuario int,
  @contrasena_usu nvarchar(MAX),
  @Patron varchar(50)
  as 
  begin 
	UPDATE usuario SET 
		contrasena_usu = ENCRYPTBYPASSPHRASE('Dynamics1', @contrasena_usu)
		WHERE id_usuario = @id_usuario
		end
GO
/****** Object:  StoredProcedure [dbo].[informe]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[informe]
  @fecha_ini datetime,
  @fecha_fin datetime
  as
  begin
select *  into #table_informe from (
select id_usuario, nombre_usuario as consulto, estado_Ticket as estado, id_ticket as N_tickets, sum(n_creditos_acta) as creditos from ticket
inner join usuario on usuario.id_usuario = ticket.usuario_id
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
inner join acta on acta.fk_usuario_id =usuario.id_usuario
where  (fecha_crea_acta between @fecha_ini AND @fecha_fin) or (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si')
group by usuario.id_usuario, usuario.nombre_usuario,estado_Ticket,ticket.id_ticket)t
select *, ([Abierto]+[En proceso]+[Resuelto]+[Cerrado])as total, creditos from #table_informe 
pivot (count(N_tickets) for estado in ([Abierto], [En proceso],[Resuelto],[Cerrado])) as fpv
group by id_usuario, consulto, Abierto, [En proceso],Resuelto,Cerrado, creditos
end
GO
/****** Object:  StoredProcedure [dbo].[informe2]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[informe2]
  @fecha_ini datetime,
  @fecha_fin datetime
  as
  begin
select *  into #table_informe2 from (
select id_usuario, nombre_usuario as consulto, estado_Ticket as estado, id_ticket as N_tickets, sum(n_creditos_acta) as creditos from ticket
full outer join usuario on usuario.id_usuario = ticket.usuario_id
inner join estado_ticket on estado_ticket.id_Estado_Ticket = ticket.estado_id 
inner join acta on acta.fk_usuario_id =usuario.id_usuario
where ticket_Habilitado= 'Si' and ticket.Fecha between @fecha_ini AND @fecha_fin
group by usuario.id_usuario, usuario.nombre_usuario,estado_Ticket,ticket.id_ticket)t


select *, ([Abierto]+[Resuelto]+[Cerrado])as total, creditos from #table_informe2 t1
pivot (count(N_tickets) for estado in ([Abierto], [Resuelto],[Cerrado])) as fpv
group by id_usuario, consulto, Abierto, Resuelto,Cerrado, creditos
end 
GO
/****** Object:  StoredProcedure [dbo].[informe3]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[informe3]
  @fecha_ini datetime,
  @fecha_fin datetime
  as
  begin
select id_usuario, nombre_usuario, 
(select COUNT(id_ticket) from ticket where (ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario))as n_casos_inicio_jornada,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between DATEADD(day,-1, @fecha_ini) AND DATEADD(day,-1, @fecha_fin) and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario))as n_ticket_nuevos_dia,
(select COUNT(id_ticket) from ticket where (ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and estado_id=4))as n_ticket_Resueltos_hoy,
(select COUNT(id_ticket) from ticket where (ticket.fecha_cierre_ticket between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and estado_id=5))as n_ticket_cerrados_hoy,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario))as n_ticket_nuevos_cierre_jornada,
(select ISNULL(sum(n_creditos_acta),0) from acta where fecha_crea_acta between @fecha_ini AND @fecha_fin and acta.fk_usuario_id = a.id_usuario) as n_creditos_hoy,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and tipo_ticket_id=3 ))as n_ticket_desarrollo,
(select COUNT(id_ticket) from ticket where (ticket.Fecha between @fecha_ini AND @fecha_fin and ticket_Habilitado= 'Si' and ticket.usuario_id = a.id_usuario and tipo_ticket_id=2 ))as n_ticket_proyecto
from usuario as a where usuario_Habilitado= 'Si'
end
GO
/****** Object:  StoredProcedure [dbo].[recover_pass_cli]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[recover_pass_cli]
  @correo_cli nvarchar (45),  
  @Contrasena_cli nvarchar(max),
  @Patron varchar(50)
  as 
  begin 
  UPDATE cliente SET 
	correo_cli = @correo_cli,
	Contrasena_cli = ENCRYPTBYPASSPHRASE('Dynamics1', @Contrasena_cli)
    WHERE correo_cli = @correo_cli
					 end
GO
/****** Object:  StoredProcedure [dbo].[recover_pass_usu]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[recover_pass_usu]  
  @correo_usu nvarchar (45),
  @contrasena_usu nvarchar(MAX),
  @Patron varchar(50)
  as 
  begin 
  UPDATE usuario SET 
	correo_usu = @correo_usu, 
	contrasena_usu = ENCRYPTBYPASSPHRASE('Dynamics1', @contrasena_usu)
	WHERE correo_usu = @correo_usu
					 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_pass_clien]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[Sp_pass_clien]
  @nombre_cliente nvarchar(45),
  @correo_cli nvarchar (45),
  @Telefono_cliente nvarchar(45),
  @rol_id int,
  @empresa_id int,
  @Contrasena_cli nvarchar (60),
  @Cliente_Habilitado nvarchar(45),
  @Patron varchar(50)
  as 
  begin 
  insert into cliente
				(nombre_cliente,correo_cli,Telefono_cliente,rol_id,empresa_id,Contrasena_cli,Cliente_Habilitado)
				values
				(@nombre_cliente,
				@correo_cli,
				@Telefono_cliente,
				@rol_id,
				@empresa_id,
				ENCRYPTBYPASSPHRASE('Dynamics1', @Contrasena_cli),
				@Cliente_Habilitado
				)
				end
GO
/****** Object:  StoredProcedure [dbo].[Sp_pass_usu]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[Sp_pass_usu]
  @nombre_usuario nvarchar(45),
  @correo_usu nvarchar (45),
  @rol_id int,
  @prefijo_usuario nvarchar(45),
  @area_id int,
  @contrasena_usu nvarchar(45),
  @usuario_Habilitado nvarchar (45),
  @Patron varchar(50)
  as 
  begin 
  insert into usuario
				(nombre_usuario,correo_usu,rol_id,prefijo_usuario,area_id,contrasena_usu,usuario_Habilitado)
				values
				(@nombre_usuario,
				@correo_usu,
				@rol_id,
				@prefijo_usuario,
				@area_id,
				ENCRYPTBYPASSPHRASE('Dynamics1', @contrasena_usu),
				@usuario_Habilitado
				)
				end
GO
/****** Object:  StoredProcedure [dbo].[Sp_update_cli]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sp_update_cli]
  @id_Cliente int,
  @nombre_cliente nvarchar(45),
  @correo_cli nvarchar (45),
  @Telefono_cliente nvarchar(45),
  @rol_id int,
  @empresa_id int,
  @Contrasena_cli nvarchar(max),
  @Cliente_Habilitado nvarchar (45),
  @Patron varchar(50)
  as 
  begin 
  UPDATE cliente SET 
					 nombre_cliente = @nombre_cliente, 
					 correo_cli = @correo_cli, 						
					 Telefono_cliente = @Telefono_cliente,
					 rol_id = @rol_id,
					 empresa_id = @empresa_id,
					 Contrasena_cli = ENCRYPTBYPASSPHRASE('Dynamics1', @Contrasena_cli),
					 Cliente_Habilitado = @Cliente_Habilitado
					 WHERE id_Cliente = @id_Cliente
					 end
GO
/****** Object:  StoredProcedure [dbo].[Sp_update_usu]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create proc [dbo].[Sp_update_usu]
  @id_usuario int,
  @nombre_usuario nvarchar(45),
  @correo_usu nvarchar (45),
  @rol_id int,
  @prefijo_usuario nvarchar(45),
  @area_id int,
  @contrasena_usu nvarchar(MAX),
  @usuario_Habilitado nvarchar (45),
  @Patron varchar(50)
  as 
  begin 
  UPDATE usuario SET 
					 nombre_usuario = @nombre_usuario, 
					 correo_usu = @correo_usu, 
					 rol_id = @rol_id, 
					 prefijo_usuario = @prefijo_usuario,
					 area_id = @area_id,
					 contrasena_usu = ENCRYPTBYPASSPHRASE('Dynamics1', @contrasena_usu),
					 usuario_Habilitado = @usuario_Habilitado
					 WHERE id_usuario = @id_usuario 
					 end
GO
/****** Object:  StoredProcedure [dbo].[Validar_cli]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Validar_cli]
  @correo_cli nvarchar (45),
  @Contrasena_cli nvarchar (60),
  @Cliente_Habilitado nvarchar(45),
  @Patron varchar(max)
  as 
  begin 
  select * from cliente 
				where correo_cli=@correo_cli and CONVERT(nvarchar(max), DECRYPTBYPASSPHRASE(@Patron, Contrasena_cli))=@Contrasena_cli COLLATE SQL_Latin1_General_CP850_CI_AI
				end
GO
/****** Object:  StoredProcedure [dbo].[Validar_usu]    Script Date: 24/05/2022 11:45:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Validar_usu]
  @correo_usu nvarchar (45),
  @contrasena_usu nvarchar(45),
  @Patron varchar(max)
  as 
  begin 
  select * from usuario 
				where correo_usu=@correo_usu and CONVERT(nvarchar(max), DECRYPTBYPASSPHRASE(@Patron, contrasena_usu))= @contrasena_usu COLLATE SQL_Latin1_General_CP1_CS_AS  and usuario_Habilitado = 'Si' 
				end
GO
USE [master]
GO
ALTER DATABASE [DynaIT] SET  READ_WRITE 
GO
