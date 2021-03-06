USE [master]
GO
/****** Object:  Database [FoodOrdering]    Script Date: 2/4/2018 4:50:53 PM ******/
CREATE DATABASE [FoodOrdering]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodOrdering', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVER2012\MSSQL\DATA\FoodOrdering.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FoodOrdering_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SERVER2012\MSSQL\DATA\FoodOrdering_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FoodOrdering] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodOrdering].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodOrdering] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodOrdering] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodOrdering] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodOrdering] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodOrdering] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodOrdering] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodOrdering] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodOrdering] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodOrdering] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodOrdering] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodOrdering] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodOrdering] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodOrdering] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodOrdering] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodOrdering] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FoodOrdering] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodOrdering] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodOrdering] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodOrdering] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodOrdering] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodOrdering] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodOrdering] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodOrdering] SET RECOVERY FULL 
GO
ALTER DATABASE [FoodOrdering] SET  MULTI_USER 
GO
ALTER DATABASE [FoodOrdering] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodOrdering] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodOrdering] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodOrdering] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FoodOrdering', N'ON'
GO
USE [FoodOrdering]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MenuCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Othernames] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[Lat] [float] NULL,
	[Lng] [float] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[AccountId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_CustomerAccount] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuImage]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuImage](
	[ImageId] [bigint] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[MenuId] [bigint] NOT NULL,
 CONSTRAINT [PK_MenuImage] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[RestaurantId] [bigint] NOT NULL,
	[CustomerId] [bigint] NOT NULL,
	[OrderStatus] [nchar](10) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderTotal] [decimal](18, 4) NOT NULL,
	[DeliveryMethod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[MenuId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [bigint] IDENTITY(1,1) NOT NULL,
	[RestaurantId] [bigint] NOT NULL,
	[RatingValue] [float] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[RestaurantId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Rating] [float] NOT NULL,
	[DeliveryFee] [decimal](18, 4) NULL,
	[AvDeliveryTime] [int] NULL,
	[Logo] [nvarchar](max) NULL,
	[RestaurantPhoto] [nvarchar](max) NULL,
	[Address] [nvarchar](500) NOT NULL,
	[MinOrderPrice] [decimal](18, 4) NOT NULL,
	[Lat] [float] NULL,
	[Lng] [float] NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[RestaurantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RestaurantMenu]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantMenu](
	[RestaurantMenuId] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuId] [bigint] NOT NULL,
	[RestaurantId] [bigint] NOT NULL,
	[Price] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_RestaurantMenu] PRIMARY KEY CLUSTERED 
(
	[RestaurantMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (1, N'Apetizers', N' ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (2, N'Salads', N' ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (4, N'Sandwiches', N' ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (5, N'Desserts', N' ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (6, N'Drinks', N' ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (7, N'Beverages', N' ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (8, N'Pastries', N' ')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (9, N'Soups', N' ')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([RestaurantId], [Name], [Rating], [DeliveryFee], [AvDeliveryTime], [Logo], [RestaurantPhoto], [Address], [MinOrderPrice], [Lat], [Lng]) VALUES (1, N'Nandos Banani', 3, CAST(500.0000 AS Decimal(18, 4)), 60, N'http://localhost:45917/Content/Uploads/2017/12/f8073a5f-fcc7-4487-83fd-a62e66b702dc.png', N'photo.jpg', N'Road-11, Banani, Dhaka', CAST(3000.0000 AS Decimal(18, 4)), 1.79087, -2.3456)
INSERT [dbo].[Restaurant] ([RestaurantId], [Name], [Rating], [DeliveryFee], [AvDeliveryTime], [Logo], [RestaurantPhoto], [Address], [MinOrderPrice], [Lat], [Lng]) VALUES (2, N'Restaurant Gary Danko', 3, CAST(500.0000 AS Decimal(18, 4)), 60, N'http://localhost:45917/Content/Uploads/2017/12/f41be72e-bc7e-48f0-85ee-70c91a56d16a.png', N'http://localhost:45917/Content/Uploads/2017/12/99ecc10c-a179-4e95-a9f9-02dca2970bbc.jpg', N'800 N Point St, San Francisco, Califonia', CAST(3000.0000 AS Decimal(18, 4)), 1.79087, -2.3456)
INSERT [dbo].[Restaurant] ([RestaurantId], [Name], [Rating], [DeliveryFee], [AvDeliveryTime], [Logo], [RestaurantPhoto], [Address], [MinOrderPrice], [Lat], [Lng]) VALUES (3, N'Chinees Restaurant', 5, CAST(200.0000 AS Decimal(18, 4)), 60, N'', N'', N'Ikoyi', CAST(4500.0000 AS Decimal(18, 4)), 1.45678, 2.34566)
INSERT [dbo].[Restaurant] ([RestaurantId], [Name], [Rating], [DeliveryFee], [AvDeliveryTime], [Logo], [RestaurantPhoto], [Address], [MinOrderPrice], [Lat], [Lng]) VALUES (4, N'Chinees Restaurant', 5, CAST(200.0000 AS Decimal(18, 4)), 60, N'', N'', N'Ikoyi', CAST(4500.0000 AS Decimal(18, 4)), 1.45678, 2.34566)
INSERT [dbo].[Restaurant] ([RestaurantId], [Name], [Rating], [DeliveryFee], [AvDeliveryTime], [Logo], [RestaurantPhoto], [Address], [MinOrderPrice], [Lat], [Lng]) VALUES (5, N'Crisy', 5, CAST(10.0000 AS Decimal(18, 4)), 60, N'', N'', N'Obanikoro', CAST(500.0000 AS Decimal(18, 4)), 1.45678, 2.34566)
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_CustomerAccount_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerAccount] FOREIGN KEY([AccountId])
REFERENCES [dbo].[CustomerAccount] ([AccountId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerAccount]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Category]
GO
ALTER TABLE [dbo].[MenuImage]  WITH CHECK ADD  CONSTRAINT [FK_MenuImage_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([MenuId])
GO
ALTER TABLE [dbo].[MenuImage] CHECK CONSTRAINT [FK_MenuImage_Menu]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Restaurant] FOREIGN KEY([RestaurantId])
REFERENCES [dbo].[Restaurant] ([RestaurantId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Restaurant]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([MenuId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Menu]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[RestaurantMenu]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantMenu_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([MenuId])
GO
ALTER TABLE [dbo].[RestaurantMenu] CHECK CONSTRAINT [FK_RestaurantMenu_Menu]
GO
ALTER TABLE [dbo].[RestaurantMenu]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantMenu_Restaurant] FOREIGN KEY([RestaurantId])
REFERENCES [dbo].[Restaurant] ([RestaurantId])
GO
ALTER TABLE [dbo].[RestaurantMenu] CHECK CONSTRAINT [FK_RestaurantMenu_Restaurant]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetRestaurants]    Script Date: 2/4/2018 4:50:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetRestaurants] 

AS
BEGIN
	SELECT * FROM [dbo].[Restaurant]
END

GO
USE [master]
GO
ALTER DATABASE [FoodOrdering] SET  READ_WRITE 
GO
