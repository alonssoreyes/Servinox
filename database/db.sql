USE [master]
GO
/****** Object:  Database [snx]    Script Date: 11/9/2019 2:05:31 PM ******/
CREATE DATABASE [snx]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'snx', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\snx.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'snx_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\snx_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [snx] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [snx].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [snx] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [snx] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [snx] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [snx] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [snx] SET ARITHABORT OFF 
GO
ALTER DATABASE [snx] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [snx] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [snx] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [snx] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [snx] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [snx] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [snx] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [snx] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [snx] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [snx] SET  ENABLE_BROKER 
GO
ALTER DATABASE [snx] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [snx] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [snx] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [snx] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [snx] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [snx] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [snx] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [snx] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [snx] SET  MULTI_USER 
GO
ALTER DATABASE [snx] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [snx] SET DB_CHAINING OFF 
GO
ALTER DATABASE [snx] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [snx] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [snx] SET DELAYED_DURABILITY = DISABLED 
GO
USE [snx]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 11/9/2019 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_categoria] [varchar](50) NULL,
 CONSTRAINT [pk_cat] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/9/2019 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [varchar](100) NULL,
	[Apellidos_Cliente] [varchar](100) NULL,
	[Email] [varchar](150) NULL,
	[Password] [varchar](200) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
 CONSTRAINT [pk_cli] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 11/9/2019 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[id_comentario] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[id_cliente] [int] NULL,
	[comentario] [text] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
 CONSTRAINT [pk_com] PRIMARY KEY CLUSTERED 
(
	[id_comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_pedido]    Script Date: 11/9/2019 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_pedido](
	[id_detalle_pedido] [int] IDENTITY(1,1) NOT NULL,
	[id_pedido] [int] NULL,
	[id_producto] [int] NULL,
	[cantidad_producto] [int] NULL,
	[subtotal] [decimal](8, 2) NULL,
 CONSTRAINT [pk_det_ped] PRIMARY KEY CLUSTERED 
(
	[id_detalle_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/9/2019 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[NSS] [int] NULL,
	[Nombre_Empleado] [varchar](100) NULL,
	[Apellidos_Empleado] [varchar](100) NULL,
	[Imagen_Empleado] [varchar](255) NULL,
	[Puesto] [varchar](100) NULL,
	[Email_Empleado] [varchar](100) NULL,
	[Telefono_Empleado] [int] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
 CONSTRAINT [pk_emp] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 11/9/2019 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedido](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[Estado] [varchar](100) NULL,
	[Municipio] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Codigo_Postal] [int] NULL,
	[Telefono] [bigint] NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
	[Estado_Actual] [varchar](100) NULL,
 CONSTRAINT [pk_ped] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/9/2019 2:05:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[id_categoria] [int] NULL,
	[Nombre_Producto] [varchar](100) NULL,
	[Descripcion_Producto] [text] NULL,
	[Marca] [varchar](100) NULL,
	[Stock] [int] NULL,
	[Precio] [decimal](8, 2) NULL,
	[Imagen_Producto] [varchar](255) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
 CONSTRAINT [pk_prod] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (1, N'Carritos Hot Dog')
INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (2, N'Cocción')
INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (3, N'Campanas de extracción')
INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (4, N'Utensilios de cocina')
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (45, N'Alonso', N'Reyes', N'alonssoreyes@gmail.com', N'$2y$11$q.VfJhIxFVRo0aQXPx8J5OXv7NwqUD/5TyQzzN64OcJtzVgDe2qEa', CAST(N'2019-11-06' AS Date), CAST(N'2019-11-06' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (46, N'Diego', N'Jimenez', N'diego@gmail.com', N'$2y$11$NYkHXQTqZ5H6YDuQAeoBaeukMp7S7hmb9lO75xMMj2SDn95FW/qwa', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Comentarios] ON 

INSERT [dbo].[Comentarios] ([id_comentario], [id_producto], [id_cliente], [comentario], [created_at], [updated_at]) VALUES (6, 2, 46, N'Esta muy barato y bonito', CAST(N'2019-11-07' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Comentarios] OFF
SET IDENTITY_INSERT [dbo].[detalle_pedido] ON 

INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (24, 26, 2, 1, CAST(11590.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (25, 26, 3, 1, CAST(1200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (26, 32, 3, 1, CAST(1200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (27, 33, 3, 2, CAST(1200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (28, 34, 3, 2, CAST(2400.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (29, 34, 5, 2, CAST(240.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (30, 35, 7, 1, CAST(3053.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[detalle_pedido] OFF
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (25, 45, N'Jalisco', N'Tlaquepaque', N'Av las islas 298', 45570, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (26, 46, N'Jalisco', N'Tlaquepaque', N'Av las islas 298', 45570, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparación')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (27, 45, N'México', N'Tlaquepaque', N'av circumbalacion 30', 45570, 4564564564, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (28, 46, N'Jalisco', N'Tlaquepaque', N'Av Glendale 40', 45570, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (29, 46, N'Durango', N'Tlaquepaque', N'Av las islas 298', 46670, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (30, 46, N'Durango', N'Tlaquepaque', N'Av las islas 298', 46670, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (31, 46, N'Durango', N'Tlaquepaque', N'Av las islas 298', 46670, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (32, 46, N'Durango', N'Tlaquepaque', N'Av las islas 298', 46670, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (33, 46, N'Distrito Federal', N'Tlaquepaque', N'av circumbalacion 30', 34343, 3318842352, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (34, 46, N'Jalisco', N'Tlaquepaque', N'av circumbalacion 30', 45570, 2343242343, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual]) VALUES (35, 45, N'Chihuahua', N'Tlaquepaque', N'av circumbalacion 30', 34324, 2453242623, CAST(N'2019-11-07' AS Date), CAST(N'2019-11-07' AS Date), N'En Preparacion')
SET IDENTITY_INSERT [dbo].[Pedido] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (1, 1, N'Carrito para Hot Dog Mod CH-0055', N'Inicia tu negocio con este increible carrito para hot dog y hamburguesas', N'Servinox', 9, CAST(14350.00 AS Decimal(8, 2)), N'CH154-azul.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (2, 1, N'Carrito para Hot Dog Mod CHG126', N'Inicia tu negocio con este increible carrito para hot dog y hamburguesas', N'Servinox', 7, CAST(11590.00 AS Decimal(8, 2)), N'Dogocart-CHG126-1.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (3, 2, N'Estufa azul', N'Cocina lo que quieras con esta estufa portable', N'Servinox', 6, CAST(1200.00 AS Decimal(8, 2)), N'13153013-01_480x480.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (4, 2, N'Batería de Ollas 7 piezas Deluxe Vollrath', N'Juego de Batería Delux 7 piezas, hecha en acero inoxidable, opción duradera y económica para cualquier negocio.', N'VOLLRA', 14, CAST(2475.00 AS Decimal(8, 2)), N'3822-2_1024x1024.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (5, 2, N'Sarten Antiadherente 12" Vollrath', N'Sartén de 12" fabricado para ser extremadamente duradero y una tolerancia al calor excepcional.', N'VOLLRA', 12, CAST(120.00 AS Decimal(8, 2)), N'69112-3_1024x1024.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-04' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (6, 1, N'CARRITO PARA TACOS MOD. TA160', N'Fabricado en acero inoxidable calibre 22 tipo 430 con estructura en acero al carbon incluye: horno para pastor con 8 piedras, además de plancha, picadero, comal bola , vapor , barra aérea, barra de comensal Tolosa y lona', N'Servinox', 13, CAST(14500.00 AS Decimal(8, 2)), N'3.jpg', CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (7, 2, N'Plancha de 60 cm Línea Estructural', N'Plancha estructural, 60 x 60 x 85 cm. Fabricada con estructura tubular cuadrada, tapas en acero al carbón, terminado con pintura en polvo electrostática.', N'Ferro', 9, CAST(3053.00 AS Decimal(8, 2)), N'16545001-01_1024x1024.jpg', CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (8, 3, N'Campana de extracción tipo piramidal', N'Campana de extracción tipo piramidal completamente de acero inoxidable, acabado sanitario. Se utiliza para atrapar la grasa en suspensión en el aire, los productos de combustión, el humo, los olores, el calor, y el vapor del aire mediante una combinación de filtrado y la evacuación del aire. Ideal para cocinas de poco', N'Ferro', 3, CAST(7600.00 AS Decimal(8, 2)), N'campana.jpg', CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (9, 4, N'Inserto perforado 1/1', N'Inserto perforado tamaño completo 1/1. Calibre 22. Diseño perforado ideal para drenar y cocer al vapor.', N'VOLLRATH', 23, CAST(553.00 AS Decimal(8, 2)), N'30013-01_1024x1024.webp', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (11, 3, N'Campana de extracción tipo cajón', N'Campana de extracción tipo cajón completamente de acero inoxidable, con preparación para recibir filtros, acabado sanitario. Se utiliza para atrapar la grasa en suspensión en el aire, los productos de combustión, el humo, los olores, el calor, y el vapor del aire mediante una combinación de filtrado y la evacuación del', N'Ferro', 23, CAST(553.00 AS Decimal(8, 2)), N'campana_cajon_2_1024x1024.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (12, 3, N'Campana Supra 30" Acero Inoxidable', N'Convierte tu hogar en el lugar favorito de la casa y cuida la salud de tu familia con esta campana Supra. El diseño y color acero inoxidable le da un toque de elegancia y buen', N'Ferro', 10, CAST(3999.00 AS Decimal(8, 2)), N'shopping.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (13, 3, N'Campana Sanaire Gea 76 Cm Acero Inoxidable', N'Campana GEA - foco LED: Purificadora o extractora Focos de LED Rejilla de aluminio lavable Filtro de carbón activado ', N'Ferro', 10, CAST(6046.00 AS Decimal(8, 2)), N'sanaire.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (14, 4, N'Colador chino grueso', N'Colador chino grueso 12" (30.5 cm) de acero inoxidable', N'Servinox', 43, CAST(843.00 AS Decimal(8, 2)), N'47178-01_1024x1024.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (15, 4, N'Colador con mangos', N'Colador con mangos, capacidad de 14 ct gal (13.2 l)', N'Servinox', 24, CAST(584.00 AS Decimal(8, 2)), N'47974-01_480x480.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (16, 4, N'Tenedor industrial con gancho 38.1 cm', N'Utensilio con mango de gancho largo del mango 38.1 cm.', N'Servinox', 11, CAST(478.00 AS Decimal(8, 2)), N'60180_4c4e980e-6477-493e-bba0-461cfc33b13f_1024x1024.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uq_email]    Script Date: 11/9/2019 2:05:31 PM ******/
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [uq_email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uq_emp]    Script Date: 11/9/2019 2:05:31 PM ******/
ALTER TABLE [dbo].[Empleado] ADD  CONSTRAINT [uq_emp] UNIQUE NONCLUSTERED 
(
	[NSS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [fk_cli] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [fk_cli]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [fk_prod] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [fk_prod]
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD  CONSTRAINT [fk_id_ped] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[Pedido] ([id_pedido])
GO
ALTER TABLE [dbo].[detalle_pedido] CHECK CONSTRAINT [fk_id_ped]
GO
ALTER TABLE [dbo].[detalle_pedido]  WITH CHECK ADD  CONSTRAINT [fk_id_prod] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[detalle_pedido] CHECK CONSTRAINT [fk_id_prod]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_clie] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_clie]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [fk_id_cat] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [fk_id_cat]
GO
USE [master]
GO
ALTER DATABASE [snx] SET  READ_WRITE 
GO
