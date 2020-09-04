USE [master]
GO
/****** Object:  Database [SteamshipMutualRed10]    Script Date: 09/04/2020 09:21:53 ******/
CREATE DATABASE [SteamshipMutualRed10] ON  PRIMARY 
( NAME = N'SteamshipMutualRed10', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SteamshipMutualRed10.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SteamshipMutualRed10_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SteamshipMutualRed10_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SteamshipMutualRed10] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SteamshipMutualRed10].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SteamshipMutualRed10] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET ARITHABORT OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SteamshipMutualRed10] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SteamshipMutualRed10] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SteamshipMutualRed10] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET  DISABLE_BROKER
GO
ALTER DATABASE [SteamshipMutualRed10] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SteamshipMutualRed10] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SteamshipMutualRed10] SET  READ_WRITE
GO
ALTER DATABASE [SteamshipMutualRed10] SET RECOVERY FULL
GO
ALTER DATABASE [SteamshipMutualRed10] SET  MULTI_USER
GO
ALTER DATABASE [SteamshipMutualRed10] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SteamshipMutualRed10] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SteamshipMutualRed10', N'ON'
GO
USE [SteamshipMutualRed10]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 09/04/2020 09:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Manager] ON
INSERT [dbo].[Manager] ([ManagerId], [Name]) VALUES (1, N'Alex Ferguson')
INSERT [dbo].[Manager] ([ManagerId], [Name]) VALUES (2, N'Jose Mourinho')
SET IDENTITY_INSERT [dbo].[Manager] OFF
/****** Object:  Table [dbo].[Staff]    Script Date: 09/04/2020 09:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[ManagerId] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Staff] ON
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (1, N'Ronaldo', 1)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (2, N'Scholes', 1)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (3, N'Gigs', 1)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (4, N'Rooney', 1)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (5, N'Ferdinand', 1)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (6, N'Drogba', 2)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (7, N'Lampard', 2)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (8, N'Terry', 2)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (9, N'Makelele', 2)
INSERT [dbo].[Staff] ([StaffId], [Name], [ManagerId]) VALUES (10, N'Cech', 2)
SET IDENTITY_INSERT [dbo].[Staff] OFF
/****** Object:  Table [dbo].[Sale]    Script Date: 09/04/2020 09:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[SaleAmount] [decimal](18, 2) NOT NULL,
	[SaleDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Sale] ON
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (1, 1, CAST(100.00 AS Decimal(18, 2)), CAST(0x07000000000090400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (2, 4, CAST(90.00 AS Decimal(18, 2)), CAST(0x070000000000AF400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (3, 1, CAST(200.00 AS Decimal(18, 2)), CAST(0x070000000000CC400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (4, 4, CAST(150.00 AS Decimal(18, 2)), CAST(0x070000000000EB400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (5, 1, CAST(120.00 AS Decimal(18, 2)), CAST(0x070000000000EB400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (6, 4, CAST(60.00 AS Decimal(18, 2)), CAST(0x070000000000AF400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (7, 1, CAST(350.00 AS Decimal(18, 2)), CAST(0x07000000000009410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (8, 2, CAST(60.00 AS Decimal(18, 2)), CAST(0x070000000000CC400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (9, 3, CAST(90.00 AS Decimal(18, 2)), CAST(0x07000000000009410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (10, 5, CAST(110.00 AS Decimal(18, 2)), CAST(0x07000000000028410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (11, 6, CAST(320.00 AS Decimal(18, 2)), CAST(0x07000000000028410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (12, 7, CAST(250.00 AS Decimal(18, 2)), CAST(0x070000000000EB400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (13, 6, CAST(150.00 AS Decimal(18, 2)), CAST(0x07000000000028410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (14, 7, CAST(180.00 AS Decimal(18, 2)), CAST(0x07000000000046410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (15, 8, CAST(120.00 AS Decimal(18, 2)), CAST(0x070000000000AF400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (16, 9, CAST(80.00 AS Decimal(18, 2)), CAST(0x07000000000046410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (17, 8, CAST(140.00 AS Decimal(18, 2)), CAST(0x07000000000046410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (18, 10, CAST(180.00 AS Decimal(18, 2)), CAST(0x070000000000EB400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (19, 6, CAST(170.00 AS Decimal(18, 2)), CAST(0x07000000000046410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (20, 7, CAST(320.00 AS Decimal(18, 2)), CAST(0x070000000000EB400B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (21, 7, CAST(165.00 AS Decimal(18, 2)), CAST(0x07000000000046410B AS DateTime2))
INSERT [dbo].[Sale] ([SaleId], [StaffId], [SaleAmount], [SaleDate]) VALUES (22, 1, CAST(240.00 AS Decimal(18, 2)), CAST(0x07000000000009410B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Sale] OFF
/****** Object:  StoredProcedure [dbo].[spTotalSalesByStaff]    Script Date: 09/04/2020 09:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTotalSalesByStaff]	
AS
BEGIN

  SELECT  DISTINCT M.Name AS Manager, St.Name AS StaffName, SUM(S.SaleAmount)SalesTotal
  FROM [SteamshipMutualRed10].[dbo].Sale S
  INNER JOIN [SteamshipMutualRed10].[dbo].Staff ST ON S.StaffId = ST.StaffId
  INNER JOIN [SteamshipMutualRed10].[dbo].Manager M on ST.ManagerId = M.ManagerId
  GROUP BY M.Name , St.Name
  ORDER BY 3 desc
END
GO
/****** Object:  StoredProcedure [dbo].[spTotalSalesByMonth]    Script Date: 09/04/2020 09:21:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTotalSalesByMonth]	
AS
BEGIN

  SELECT  DISTINCT DATENAME(month, S.SaleDate) AS SalesMonth, SUM(S.SaleAmount)SalesTotal
  FROM [SteamshipMutualRed10].[dbo].Sale S  
  GROUP BY S.SaleDate
END
GO
/****** Object:  ForeignKey [FK_Staff_Manager]    Script Date: 09/04/2020 09:21:54 ******/
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Manager] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Manager] ([ManagerId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Manager]
GO
/****** Object:  ForeignKey [FK_Sale_Staff]    Script Date: 09/04/2020 09:21:54 ******/
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Staff]
GO
