USE [master]
GO
/****** Object:  Database [DynaIT]    Script Date: 7/04/2022 7:12:06 a. m. ******/
CREATE DATABASE [DynaIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DynaIT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DynaIT.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DynaIT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DynaIT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[acta]    Script Date: 7/04/2022 7:12:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[acta](
	[id_acta] [int] IDENTITY(1,1) NOT NULL,
	[numero_Acta] [nvarchar](45) NOT NULL,
	[fecha_crea_acta] [datetime2](7) NOT NULL,
	[ticket_id] [int] NOT NULL,
	[n_creditos_acta] [nvarchar](45) NOT NULL,
	[numero_Factura] [nvarchar](45) NOT NULL,
	[fk_usuario_id] [int] NOT NULL,
 CONSTRAINT [pk_id_acta] PRIMARY KEY CLUSTERED 
(
	[id_acta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_acta] UNIQUE NONCLUSTERED 
(
	[id_acta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[area]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_area] UNIQUE NONCLUSTERED 
(
	[id_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
	[Contrasena_cli] [nvarchar](60) NOT NULL,
	[Cliente_Habilitado] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_idCliente] PRIMARY KEY CLUSTERED 
(
	[id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_idCliente] UNIQUE NONCLUSTERED 
(
	[id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_empresa] UNIQUE NONCLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_ticket]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_Estado_ticket] UNIQUE NONCLUSTERED 
(
	[id_Estado_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nota]    Script Date: 7/04/2022 7:12:06 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nota](
	[id_nota] [int] IDENTITY(1,1) NOT NULL,
	[descripcionNota] [nvarchar](max) NOT NULL,
	[FechaNota] [datetime2](7) NOT NULL,
	[id_ticket] [int] NOT NULL,
	[nota_creada_por] [nvarchar](45) NOT NULL,
	[nota_interna] [nvarchar](45) NOT NULL,
	[notas_Habilitado] [nvarchar](45) NOT NULL,
	[adjuntos_nota] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_id_nota] PRIMARY KEY CLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_nota] UNIQUE NONCLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notas_compartida_usuario]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_Notas_compartida_usuario] UNIQUE NONCLUSTERED 
(
	[id_Notas_compartida_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prioridad]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_prioridad] UNIQUE NONCLUSTERED 
(
	[id_prioridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_rol] UNIQUE NONCLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_Ticket] UNIQUE NONCLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_ticket]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_tipo_Ticket] UNIQUE NONCLUSTERED 
(
	[id_tipo_Ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 7/04/2022 7:12:06 a. m. ******/
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
	[contrasena_usu] [nvarchar](45) NOT NULL,
	[usuario_Habilitado] [nvarchar](45) NOT NULL,
 CONSTRAINT [pk_id_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_id_usuario] UNIQUE NONCLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[cliente] ADD  DEFAULT ('Si') FOR [Cliente_Habilitado]
GO
ALTER TABLE [dbo].[empresa] ADD  DEFAULT ('Si') FOR [empresa_habilitada]
GO
ALTER TABLE [dbo].[estado_ticket] ADD  DEFAULT ('Si') FOR [estado_Habilitado]
GO
ALTER TABLE [dbo].[nota] ADD  DEFAULT ('0001-01-01 00:00:00') FOR [FechaNota]
GO
ALTER TABLE [dbo].[nota] ADD  DEFAULT ('Si') FOR [notas_Habilitado]
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
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ('Si') FOR [usuario_Habilitado]
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
ALTER TABLE [dbo].[nota]  WITH CHECK ADD  CONSTRAINT [fk_id_ticket_nota] FOREIGN KEY([id_ticket])
REFERENCES [dbo].[ticket] ([id_ticket])
GO
ALTER TABLE [dbo].[nota] CHECK CONSTRAINT [fk_id_ticket_nota]
GO
ALTER TABLE [dbo].[notas_compartida_usuario]  WITH CHECK ADD  CONSTRAINT [fk_id_Nota_compartida] FOREIGN KEY([nota_id])
REFERENCES [dbo].[nota] ([id_nota])
GO
ALTER TABLE [dbo].[notas_compartida_usuario] CHECK CONSTRAINT [fk_id_Nota_compartida]
GO
ALTER TABLE [dbo].[notas_compartida_usuario]  WITH CHECK ADD  CONSTRAINT [fk_id_usuario_n_compartida] FOREIGN KEY([id_Notas_compartida_usuario])
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
USE [master]
GO
ALTER DATABASE [DynaIT] SET  READ_WRITE 
GO
