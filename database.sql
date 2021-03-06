USE [master]
GO
/****** Object:  Database [ServicioMedico]    Script Date: 09/01/2018 02:51:43 p.m. ******/
CREATE DATABASE [ServicioMedico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ServicioMedico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ServicioMedico.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ServicioMedico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ServicioMedico_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ServicioMedico] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ServicioMedico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ServicioMedico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ServicioMedico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ServicioMedico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ServicioMedico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ServicioMedico] SET ARITHABORT OFF 
GO
ALTER DATABASE [ServicioMedico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ServicioMedico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ServicioMedico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ServicioMedico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ServicioMedico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ServicioMedico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ServicioMedico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ServicioMedico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ServicioMedico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ServicioMedico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ServicioMedico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ServicioMedico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ServicioMedico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ServicioMedico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ServicioMedico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ServicioMedico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ServicioMedico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ServicioMedico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ServicioMedico] SET  MULTI_USER 
GO
ALTER DATABASE [ServicioMedico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ServicioMedico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ServicioMedico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ServicioMedico] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ServicioMedico] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ServicioMedico]
GO
/****** Object:  Table [dbo].[CatalogoDocumento]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CatalogoDocumento](
	[CatalogoDocumento_Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreDocumento] [varchar](50) NULL,
	[Url_Documetno] [varchar](100) NULL,
	[Url_Destino] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CatalogoDocumento_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultas]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consultas](
	[Consultas_Id] [int] IDENTITY(1,1) NOT NULL,
	[Paciente_Id] [int] NOT NULL,
	[EPS_Id] [int] NULL,
	[Cargo] [varchar](50) NULL,
	[Empresa] [varchar](50) NULL,
	[Fecha_Consulta] [varchar](50) NULL,
	[Tipo_de_Examen] [varchar](50) NULL,
	[Estado_Civil] [varchar](50) NULL,
	[Calificacion_Medica] [varchar](50) NULL,
	[Observaciones] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Consultas_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EPS]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EPS](
	[EPS_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_EPS] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EPS_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[Paciente_Id] [int] IDENTITY(1,1) NOT NULL,
	[PrimerNombre] [varchar](50) NULL,
	[SegundoNombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Tipo_de_Documento] [varchar](5) NULL,
	[Numero_de_Documento] [bigint] NOT NULL,
	[Telefono] [bigint] NULL,
	[Celular] [bigint] NULL,
	[Direccion] [varchar](50) NULL,
	[DOB] [varchar](50) NULL,
	[Genero] [varchar](10) NULL,
	[RH] [varchar](10) NULL,
 CONSTRAINT [PK__Paciente__B784FC2428D45921] PRIMARY KEY CLUSTERED 
(
	[Paciente_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prescripciones]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prescripciones](
	[Prescripciones_Id] [int] IDENTITY(1,1) NOT NULL,
	[Consultas_Id] [int] NULL,
	[Nombre_Documento] [varchar](50) NULL,
	[Url_Documento] [varchar](100) NULL,
	[fecha_Generado] [varchar](50) NULL,
	[Json_Consulta] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Prescripciones_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[Rol_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[Status_Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Status_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/01/2018 02:51:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NULL,
	[Apellidos] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[SessionId] [varchar](50) NULL,
	[Rol_Id] [int] NULL,
	[Status_Id] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CatalogoDocumento] ON 

INSERT [dbo].[CatalogoDocumento] ([CatalogoDocumento_Id], [NombreDocumento], [Url_Documetno], [Url_Destino]) VALUES (1, N'SistemaMedico$FirstName$LastName.pdf', N'F:\Prescripciones\Plantillas\SistemaMedico$FirstName$LastName.pdf', N'F:\Prescripciones\Generados\')
SET IDENTITY_INSERT [dbo].[CatalogoDocumento] OFF
SET IDENTITY_INSERT [dbo].[Consultas] ON 

INSERT [dbo].[Consultas] ([Consultas_Id], [Paciente_Id], [EPS_Id], [Cargo], [Empresa], [Fecha_Consulta], [Tipo_de_Examen], [Estado_Civil], [Calificacion_Medica], [Observaciones]) VALUES (1, 1, 1, N'Operario', N'Evacol', N'2018-01-07', N'INGRESO', N'Soltero', N'APTO', N'')
INSERT [dbo].[Consultas] ([Consultas_Id], [Paciente_Id], [EPS_Id], [Cargo], [Empresa], [Fecha_Consulta], [Tipo_de_Examen], [Estado_Civil], [Calificacion_Medica], [Observaciones]) VALUES (2, 2, 1, N'Cargo', N'Empresa', N'2018-01-09', N'INGRESO', N'Casado', N'RESTRICCION TEMPORAL', N'Pain Description')
SET IDENTITY_INSERT [dbo].[Consultas] OFF
SET IDENTITY_INSERT [dbo].[EPS] ON 

INSERT [dbo].[EPS] ([EPS_Id], [Nombre_EPS]) VALUES (1, N'Coomeva')
SET IDENTITY_INSERT [dbo].[EPS] OFF
SET IDENTITY_INSERT [dbo].[Paciente] ON 

INSERT [dbo].[Paciente] ([Paciente_Id], [PrimerNombre], [SegundoNombre], [ApellidoPaterno], [ApellidoMaterno], [Tipo_de_Documento], [Numero_de_Documento], [Telefono], [Celular], [Direccion], [DOB], [Genero], [RH]) VALUES (1, N'juan ', N'camilo', N'castillo', N'saucedo', NULL, 1144174272, 3192581093, NULL, N'calle', N'1993-08-01', N'Masculino', N'AB+')
INSERT [dbo].[Paciente] ([Paciente_Id], [PrimerNombre], [SegundoNombre], [ApellidoPaterno], [ApellidoMaterno], [Tipo_de_Documento], [Numero_de_Documento], [Telefono], [Celular], [Direccion], [DOB], [Genero], [RH]) VALUES (2, N'John', N'', N'Doe', N'', NULL, 666666666, 3005272424, NULL, N'Direccion', N'1990-06-01', N'Femenino', N'A-')
SET IDENTITY_INSERT [dbo].[Paciente] OFF
SET IDENTITY_INSERT [dbo].[Prescripciones] ON 

INSERT [dbo].[Prescripciones] ([Prescripciones_Id], [Consultas_Id], [Nombre_Documento], [Url_Documento], [fecha_Generado], [Json_Consulta]) VALUES (1, 1, N'1-SistemaMedicojuan  castillo Consulta# 1.pdf', N'C:\Users\GATO\Desktop\Prescripciones\Generados\1-SistemaMedicojuan  castillo Consulta# 1.pdf', N'2018-01-07', NULL)
INSERT [dbo].[Prescripciones] ([Prescripciones_Id], [Consultas_Id], [Nombre_Documento], [Url_Documento], [fecha_Generado], [Json_Consulta]) VALUES (2, 2, N'1-SistemaMedicoJohn Doe Consulta# 2.pdf', N'F:\Prescripciones\Generados\1-SistemaMedicoJohn Doe Consulta# 2.pdf', N'2018-01-09', NULL)
SET IDENTITY_INSERT [dbo].[Prescripciones] OFF
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD  CONSTRAINT [FK_Consultas_EPS] FOREIGN KEY([EPS_Id])
REFERENCES [dbo].[EPS] ([EPS_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Consultas] CHECK CONSTRAINT [FK_Consultas_EPS]
GO
ALTER TABLE [dbo].[Consultas]  WITH CHECK ADD  CONSTRAINT [FK_Consultas_Paciente] FOREIGN KEY([Paciente_Id])
REFERENCES [dbo].[Paciente] ([Paciente_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Consultas] CHECK CONSTRAINT [FK_Consultas_Paciente]
GO
ALTER TABLE [dbo].[Prescripciones]  WITH CHECK ADD  CONSTRAINT [FK_Prescripciones_Consultas] FOREIGN KEY([Consultas_Id])
REFERENCES [dbo].[Consultas] ([Consultas_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prescripciones] CHECK CONSTRAINT [FK_Prescripciones_Consultas]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Rol] FOREIGN KEY([Rol_Id])
REFERENCES [dbo].[Rol] ([Rol_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Rol]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Status] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Status_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Status]
GO
USE [master]
GO
ALTER DATABASE [ServicioMedico] SET  READ_WRITE 
GO
