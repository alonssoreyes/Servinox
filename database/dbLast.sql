USE [master]
GO
/****** Object:  Database [snx]    Script Date: 12/8/2019 2:37:20 PM ******/
CREATE DATABASE [snx]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'snx', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\snx.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'snx_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\snx_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [snx] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [snx] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [snx] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [snx] SET QUERY_STORE = OFF
GO
USE [snx]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 12/8/2019 2:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_categoria] [varchar](50) NULL,
 CONSTRAINT [pk_cat] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 12/8/2019 2:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 12/8/2019 2:37:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_pedido]    Script Date: 12/8/2019 2:37:20 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 12/8/2019 2:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[NSS] [bigint] NULL,
	[Nombre_Empleado] [varchar](100) NULL,
	[Apellidos_Empleado] [varchar](100) NULL,
	[Puesto] [varchar](100) NULL,
	[Email_Empleado] [varchar](100) NULL,
	[password] [varchar](200) NULL,
	[Telefono_Empleado] [varchar](20) NULL,
	[created_at] [date] NULL,
	[updated_at] [date] NULL,
 CONSTRAINT [pk_emp] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 12/8/2019 2:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[Monto] [decimal](8, 2) NULL,
 CONSTRAINT [pk_ped] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/8/2019 2:37:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categoria] ON 

INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (1, N'Carritos Hot Dog')
INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (2, N'Cocción')
INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (3, N'Campanas de extracción')
INSERT [dbo].[categoria] ([id_categoria], [Nombre_categoria]) VALUES (4, N'Utensilios de cocina')
SET IDENTITY_INSERT [dbo].[categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (47, N'Diego', N'Jimenez', N'Diego@gmail.com', N'$2a$10$5krewtIjuqy9C2knr3MHGexcrDY.T4vAAdh3cKe/mZaeBurEOq9Ly', CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (56, N'Johan', N'Najim Beta', N'johan@gmail.com', N'$2a$10$LssDmP02nT5qzgpauWQe.eCjNNsFW1T.OHic4Dgu1DFeDFEelH72u', CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (57, N'Oscar', N'Tejeda', N'oscar@gmail.com', N'$2a$10$pUj8yLte3ZitOlPAhK4VyeUSVvt/EpUDpzL19sKC0SvGN/hWCFVgG', CAST(N'2019-11-12' AS Date), CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (58, N'Eduardo', N'Barboza', N'eduardo@gmail.com', N'$2a$10$R2D8ql9o8w8nb9.kC8X1je2viQhupeoKrL0ipqSe259KlTAUEiOi2', CAST(N'2019-11-12' AS Date), CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (59, N'Borre', N'Rojas', N'borre@gmail.com', N'$2a$10$SflVJELKaxdmt2VyAd/pCeo9YoXiTT3CZpQ/WO1c6/NvbLm9w6Cje', CAST(N'2019-11-12' AS Date), CAST(N'2019-11-12' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (60, N'Angel', N'Reyes Sierra', N'angel@gmail.com', N'$2a$10$wnir7JqFnLsVlAz.2swHjee.YZfbhNzWzsPjTGkO98sKRmgoV2EvS', CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (61, N'Andrea', N'Hernandez', N'cecilia.hernandez@gmail.com', N'$2a$10$XGPcxowKAjSIQav34RqEvuBhnRIZ1YYpZbeyIafT/mfppgqBrfZzS', CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (62, N'luis', N'medina', N'ede@gmail.com', N'$2y$11$NOwPxCHue79ZN6uqQHXgi.g1p0S1Z4BuNCfz4beh0STNHmDEuqi3y', CAST(N'2019-11-21' AS Date), CAST(N'2019-11-21' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (63, N'Alonso', N'Reyes', N'alonso@gmail.com', N'$2a$10$uI9CQqq.s.nmkbTmQFhghupHk8s1VW7PZmLBUWnw1F6RtDwuxxb6a', CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (64, N'Aroonsito', N'PIto', N'aron@gmail.com', N'aron', CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (66, N'Bety', N'Hernandez', N'bety@gmail.com', N'$2a$10$lfQ870bxv4fws2cv8xZFleSjWu0nvBwuQ4SH9i4oWRcU3vxJ3eene', CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (67, N'Patricia', N'Hernandez', N'patricia.12@gmail.com', N'$2a$10$LInh/.uwYRTmTnUY2dZUA.axdOw2BE6O5KqMZAaacQ1zSoFxHttny', CAST(N'2019-11-28' AS Date), CAST(N'2019-11-28' AS Date))
INSERT [dbo].[Cliente] ([id_cliente], [Nombre_Cliente], [Apellidos_Cliente], [Email], [Password], [created_at], [updated_at]) VALUES (68, N'Daniel ', N'Rodriguez', N'daniel.r@gmail.com', N'$2a$10$EGV09uMHUUVXyAdLuv8oB.I/2vUz4rjzEDY4ozBMmQEEQ4IakYCAG', CAST(N'2019-11-28' AS Date), CAST(N'2019-11-28' AS Date))
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[detalle_pedido] ON 

INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (32, 41, 13, 1, CAST(7732.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (33, 41, 14, 2, CAST(7732.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (34, 41, 14, 1, CAST(843.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (35, 41, 15, 1, CAST(584.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (36, 41, 14, 1, CAST(843.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (37, 41, 15, 1, CAST(584.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (38, 41, 16, 1, CAST(478.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (39, 41, 14, 1, CAST(843.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (40, 42, 5, 1, CAST(120.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (41, 42, 7, 1, CAST(3053.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (42, 43, 8, 3, CAST(22800.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (43, 43, 9, 1, CAST(553.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (44, 44, 4, 2, CAST(4950.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (45, 44, 8, 1, CAST(7600.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (46, 45, 6, 2, CAST(29000.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (47, 46, 6, 1, CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (48, 46, 3, 1, CAST(1200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (49, 47, 4, 3, CAST(7425.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (50, 48, 6, 1, CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (51, 49, 14, 1, CAST(843.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (52, 50, 3, 1, CAST(1200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (53, 50, 7, 1, CAST(3053.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (54, 51, 6, 1, CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (55, 51, 9, 1, CAST(553.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (56, 52, 16, 1, CAST(478.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (57, 53, 4, 1, CAST(2475.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (58, 53, 11, 1, CAST(553.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (59, 53, 14, 1, CAST(843.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (60, 54, 6, 1, CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (61, 55, 15, 1, CAST(584.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (62, 55, 13, 1, CAST(6046.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (63, 56, 6, 2, CAST(29000.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (64, 56, 7, 1, CAST(3053.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (65, 57, 15, 1, CAST(584.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (66, 57, 14, 1, CAST(843.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (67, 58, 4, 1, CAST(2475.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (68, 59, 4, 1, CAST(2475.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (70, 61, 11, 1, CAST(553.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (71, 62, 6, 1, CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (72, 63, 13, 1, CAST(6046.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (73, 64, 11, 1, CAST(553.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (74, 65, 8, 1, CAST(7600.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (75, 66, 14, 10, CAST(8430.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (76, 67, 1, 2, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (77, 67, 2, 1, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (78, 68, 5, 3, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (79, 69, 3, 1, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (80, 70, 1, 2, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (81, 70, 3, 2, CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (82, 71, 13, 1, CAST(6046.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (83, 72, 3, 2, CAST(2400.00 AS Decimal(8, 2)))
INSERT [dbo].[detalle_pedido] ([id_detalle_pedido], [id_pedido], [id_producto], [cantidad_producto], [subtotal]) VALUES (84, 73, 13, 1, CAST(6046.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[detalle_pedido] OFF
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([id_empleado], [NSS], [Nombre_Empleado], [Apellidos_Empleado], [Puesto], [Email_Empleado], [password], [Telefono_Empleado], [created_at], [updated_at]) VALUES (1, 12345678957, N'Javier', N'Ramirez', N'Administrador', N'administrador@servinox.com', N'123456', N'3336358472', CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date))
INSERT [dbo].[Empleado] ([id_empleado], [NSS], [Nombre_Empleado], [Apellidos_Empleado], [Puesto], [Email_Empleado], [password], [Telefono_Empleado], [created_at], [updated_at]) VALUES (2, 23575346, N'Diego Francisco', N'Jimenez Arias', N'Empleado', N'diego@gmail.com', N'diego', N'3318842352', CAST(N'2019-11-18' AS Date), CAST(N'2019-11-22' AS Date))
INSERT [dbo].[Empleado] ([id_empleado], [NSS], [Nombre_Empleado], [Apellidos_Empleado], [Puesto], [Email_Empleado], [password], [Telefono_Empleado], [created_at], [updated_at]) VALUES (3, 568566346, N'Oscar', N'Tejeda', N'Empleado', N'oscar@gmail.com', N'123', N'331865765', CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date))
INSERT [dbo].[Empleado] ([id_empleado], [NSS], [Nombre_Empleado], [Apellidos_Empleado], [Puesto], [Email_Empleado], [password], [Telefono_Empleado], [created_at], [updated_at]) VALUES (4, 717721632, N'Jose', N'Arias', N'Empleado', N'emp@gmail.com', N'1234', N'3312312498', CAST(N'2019-11-21' AS Date), CAST(N'2019-11-21' AS Date))
SET IDENTITY_INSERT [dbo].[Empleado] OFF
SET IDENTITY_INSERT [dbo].[Pedido] ON 

INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (37, 47, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas 104', 45570, 3345653574, CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), NULL, NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (38, 47, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas 104', 45570, 3345653574, CAST(N'2019-11-11' AS Date), CAST(N'2019-11-11' AS Date), N'En preparacion', NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (39, 56, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-13' AS Date), CAST(N'2019-11-13' AS Date), N'En Preparacion', NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (40, 57, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-13' AS Date), CAST(N'2019-11-13' AS Date), N'En Preparacion', NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (41, 57, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-13' AS Date), CAST(N'2019-11-13' AS Date), N'En Preparacion', NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (42, 59, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-13' AS Date), CAST(N'2019-11-20' AS Date), N'Recibido', CAST(3173.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (43, 59, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-13' AS Date), CAST(N'2019-11-14' AS Date), N'Regresado', CAST(23353.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (44, 59, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-14' AS Date), CAST(N'2019-11-14' AS Date), N'En Preparacion', CAST(12550.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (45, 59, N'Jalisco', N'Tlaquepaque', N'av circumbalacion 30', 45570, 3318842352, CAST(N'2019-11-14' AS Date), CAST(N'2019-11-14' AS Date), N'Pedido en proceso', NULL)
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (46, 59, N'Jalisco', N'Tlaquepaque', N'av circumbalacion 30', 45570, 5367453463, CAST(N'2019-11-16' AS Date), CAST(N'2019-11-16' AS Date), N'Empacando', CAST(15700.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (47, 60, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), N'Recibido', CAST(7425.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (48, 60, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), N'En Preparacion', CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (49, 58, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), N'En Preparacion', CAST(843.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (50, 57, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), N'En Preparacion', CAST(4253.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (51, 61, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), N'En Preparacion', CAST(15053.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (52, 61, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), N'Entregado', CAST(478.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (53, 47, N'Guerrero', N'Las Huertas', N'Av Chilpanzingo 34', 43333, 4365336464, CAST(N'2019-11-18' AS Date), CAST(N'2019-11-18' AS Date), N'En Preparacion', CAST(3871.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (54, 60, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-19' AS Date), CAST(N'2019-11-19' AS Date), N'Entregado', CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (55, 60, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-19' AS Date), CAST(N'2019-11-19' AS Date), N'Entregado', CAST(6630.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (56, 58, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-20' AS Date), CAST(N'2019-11-20' AS Date), N'Entregado', CAST(32053.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (57, 60, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-21' AS Date), CAST(N'2019-11-21' AS Date), N'Entregado', CAST(1427.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (58, 61, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-22' AS Date), CAST(N'2019-11-22' AS Date), N'Entregado', CAST(2475.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (59, 59, N'Jalisco', N'Tlaquepaque', N'Av la paz 54', 45570, 3453242432, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'En Preparacion', CAST(2475.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (60, 59, N'México', N'Tlaquepaque', N'Av la paz 54', 45570, 2354326474, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'En Preparacion', CAST(2657.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (61, 59, N'Chihuahua', N'Tlaquepaque', N'Av la paz 54', 45570, 3243243242, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'En Preparacion', CAST(553.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (62, 59, N'Baja California', N'Tlaquepaque', N'Av la paz 54', 45570, 3257457456, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'En Preparacion', CAST(14500.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (63, 59, N'México', N'Tlaquepaque', N'Av la paz 54', 45570, 3245262352, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'En Preparacion', CAST(6046.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (64, 59, N'México', N'Tlaquepaque', N'Av la paz 54', 45570, 1241535235, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'En Preparacion', CAST(553.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (65, 61, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'Entregado', CAST(7600.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (66, 62, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-26' AS Date), CAST(N'2019-11-26' AS Date), N'Entregado', CAST(8430.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (67, 63, N'Jal.', N'tlaquepaque', N'Guillermo Baca 3805', 44960, 33249691, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date), NULL, CAST(40290.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (68, 64, N'Jalisco', N'Tlajomulco', N'Av tamaulipas', 45570, 33567854, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date), N'Enviado', CAST(360.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (69, 66, N'Jalisco', N'Ranchomulco', N'Valle de los robles', 45653, 33326436, CAST(N'2019-11-27' AS Date), CAST(N'2019-11-27' AS Date), N'En preparación', CAST(1200.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (70, 67, N'Jalisco', N'Tlaquepaque', N'Republica de paraguay 257', 45570, 33188423, CAST(N'2019-11-28' AS Date), CAST(N'2019-11-28' AS Date), N'En preparación', CAST(31100.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (71, 68, N'Jalisco', N'Tlaquepaque', N'Av. Lazaro Cardenas #10 Col. Alamo Industrial', 45570, 0, CAST(N'2019-11-28' AS Date), CAST(N'2019-11-28' AS Date), N'Entregado', CAST(6046.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (72, 67, N'Jalisco', N'Guadalajara', N'Av la paz 54', 44970, 3345679854, CAST(N'2019-11-28' AS Date), CAST(N'2019-11-28' AS Date), N'En Preparacion', CAST(2400.00 AS Decimal(8, 2)))
INSERT [dbo].[Pedido] ([id_pedido], [id_cliente], [Estado], [Municipio], [Direccion], [Codigo_Postal], [Telefono], [created_at], [updated_at], [Estado_Actual], [Monto]) VALUES (73, 66, N'Jalisco', N'Tlaquepaque', N'Av las islas', 45570, 3318842352, CAST(N'2019-12-01' AS Date), CAST(N'2019-12-01' AS Date), N'En Preparacion', CAST(6046.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Pedido] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (1, 1, N'Carrito para Hot Dog Mod CH-0055', N'Inicia tu negocio con este increible carrito para hot dog y hamburguesas', N'Servinox', 28, CAST(14350.00 AS Decimal(8, 2)), N'CH154-azul.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (2, 1, N'Carrito para Hot Dog Mod CHG126', N'Inicia tu negocio con este increible carrito para hot dog y hamburguesas', N'Servinox', 0, CAST(11590.00 AS Decimal(8, 2)), N'Dogocart-CHG126-1.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (3, 2, N'Parrilla portatil de 4 quemadores', N'Cocina lo que quieras con esta estufa portable', N'Servinox', 18, CAST(1200.00 AS Decimal(8, 2)), N'13153013-01_480x480.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (4, 2, N'Batería de Ollas 7 piezas Deluxe Vollrath', N'Juego de Batería Delux 7 piezas, hecha en acero inoxidable, opción duradera y económica para cualquier negocio.', N'VOLLRA', 10, CAST(2475.00 AS Decimal(8, 2)), N'3822-2_1024x1024.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (5, 2, N'Sarten Antiadherente 12" Vollrath', N'Sartén de 12" fabricado para ser extremadamente duradero y una tolerancia al calor excepcional.', N'VOLLRA', 100, CAST(120.00 AS Decimal(8, 2)), N'69112-3_1024x1024.jpg', CAST(N'2019-11-04' AS Date), CAST(N'2019-11-27' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (6, 1, N'CARRITO PARA TACOS MOD. TA160', N'Fabricado en acero inoxidable calibre 22 tipo 430 con estructura en acero al carbon incluye: horno para pastor con 8 piedras, además de plancha, picadero, comal bola , vapor , barra aérea, barra de comensal Tolosa y lona', N'Servinox', 13, CAST(14500.00 AS Decimal(8, 2)), N'3.jpg', CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (7, 2, N'Plancha de 60 cm Línea Estructural', N'Plancha estructural, 60 x 60 x 85 cm. Fabricada con estructura tubular cuadrada, tapas en acero al carbón, terminado con pintura en polvo electrostática.', N'Ferro', 9, CAST(3053.00 AS Decimal(8, 2)), N'16545001-01_1024x1024.jpg', CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (8, 3, N'Campana de extracción tipo piramidal', N'Campana de extracción tipo piramidal completamente de acero inoxidable, acabado sanitario. Se utiliza para atrapar la grasa en suspensión en el aire, los productos de combustión, el humo, los olores, el calor, y el vapor del aire mediante una combinación de filtrado y la evacuación del aire. Ideal para cocinas de poco', N'Ferro', 2, CAST(7600.00 AS Decimal(8, 2)), N'campana.jpg', CAST(N'2019-11-05' AS Date), CAST(N'2019-11-05' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (9, 4, N'Inserto perforado 1/1', N'Inserto perforado tamaño completo 1/1. Calibre 22. Diseño perforado ideal para drenar y cocer al vapor.', N'VOLLRATH', 23, CAST(553.00 AS Decimal(8, 2)), N'30013-01_1024x1024.webp', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (11, 3, N'Campana de extracción tipo cajón', N'Campana de extracción tipo cajón completamente de acero inoxidable, con preparación para recibir filtros, acabado sanitario. Se utiliza para atrapar la grasa en suspensión en el aire, los productos de combustión, el humo, los olores, el calor, y el vapor del aire mediante una combinación de filtrado y la evacuación del', N'Ferro', 23, CAST(553.00 AS Decimal(8, 2)), N'campana_cajon_2_1024x1024.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (12, 3, N'Campana Supra 30" Acero Inoxidable', N'Convierte tu hogar en el lugar favorito de la casa y cuida la salud de tu familia con esta campana Supra. El diseño y color acero inoxidable le da un toque de elegancia y buen', N'Ferro', 10, CAST(3999.00 AS Decimal(8, 2)), N'shopping.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (13, 3, N'Campana Sanaire Gea 76 Cm Acero Inoxidable', N'Campana GEA - foco LED: Purificadora o extractora Focos de LED Rejilla de aluminio lavable Filtro de carbón activado ', N'Ferro', 9, CAST(6046.00 AS Decimal(8, 2)), N'sanaire.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (14, 4, N'Colador chino grueso', N'Colador chino grueso 12" (30.5 cm) de acero inoxidable', N'Servinox', 33, CAST(843.00 AS Decimal(8, 2)), N'47178-01_1024x1024.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (15, 4, N'Colador con mangos', N'Colador con mangos, capacidad de 14 ct gal (13.2 l)', N'Servinox', 24, CAST(584.00 AS Decimal(8, 2)), N'47974-01_480x480.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
INSERT [dbo].[Producto] ([id_producto], [id_categoria], [Nombre_Producto], [Descripcion_Producto], [Marca], [Stock], [Precio], [Imagen_Producto], [created_at], [updated_at]) VALUES (16, 4, N'Tenedor industrial con gancho 38.1 cm', N'Utensilio con mango de gancho largo del mango 38.1 cm.', N'Servinox', 11, CAST(478.00 AS Decimal(8, 2)), N'60180_4c4e980e-6477-493e-bba0-461cfc33b13f_1024x1024.jpg', CAST(N'2019-11-08' AS Date), CAST(N'2019-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_email]    Script Date: 12/8/2019 2:37:20 PM ******/
ALTER TABLE [dbo].[Cliente] ADD  CONSTRAINT [uq_email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [uq_emp]    Script Date: 12/8/2019 2:37:20 PM ******/
ALTER TABLE [dbo].[Empleado] ADD  CONSTRAINT [uq_emp] UNIQUE NONCLUSTERED 
(
	[NSS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
