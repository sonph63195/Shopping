USE [master]
GO
/****** Object:  Database [Assignment]    Script Date: 18/11/02 5:38:19 PM ******/
CREATE DATABASE [Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorkShop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WorkShop2.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorkShop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WorkShop2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Assignment]
GO
/****** Object:  Table [dbo].[tbl_account]    Script Date: 18/11/02 5:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_account](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tbl_account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_customer]    Script Date: 18/11/02 5:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_customer](
	[custID] [varchar](10) NOT NULL,
	[lastName] [varchar](15) NULL,
	[middleName] [varchar](30) NULL,
	[firstName] [varchar](15) NULL,
	[address] [varchar](250) NULL,
	[phone] [varchar](11) NULL,
	[custLevel] [int] NULL,
	[username] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tbl_customer] PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 18/11/02 5:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[orderID] [varchar](10) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[custID] [varchar](10) NOT NULL,
	[total] [float] NOT NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_orderDetail]    Script Date: 18/11/02 5:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_orderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productID] [varchar](10) NULL,
	[quantity] [int] NOT NULL,
	[unitPrice] [float] NULL,
	[total] [float] NULL,
	[orderID] [varchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_orderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_shoes]    Script Date: 18/11/02 5:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_shoes](
	[shoesID] [varchar](10) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tbl_shoes] PRIMARY KEY CLUSTERED 
(
	[shoesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_shoesSizesDetail]    Script Date: 18/11/02 5:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_shoesSizesDetail](
	[shoesID] [varchar](10) NOT NULL,
	[sizesID] [varchar](3) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tbl_shoesSizesDetail] PRIMARY KEY CLUSTERED 
(
	[shoesID] ASC,
	[sizesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_sizes]    Script Date: 18/11/02 5:38:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_sizes](
	[id] [varchar](3) NOT NULL,
	[shoesID] [varchar](10) NOT NULL,
	[sizes] [int] NOT NULL,
	[country] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tbl_sizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[shoesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_account] ([username], [password]) VALUES (N'admin', N'123456')
INSERT [dbo].[tbl_account] ([username], [password]) VALUES (N'sonpham', N'sonpham')
INSERT [dbo].[tbl_customer] ([custID], [lastName], [middleName], [firstName], [address], [phone], [custLevel], [username]) VALUES (N'E0001', N'Admin', N'Pro', N'Handsome', N'1 Hacker Ways', N'123456890', 1, N'admin')
INSERT [dbo].[tbl_customer] ([custID], [lastName], [middleName], [firstName], [address], [phone], [custLevel], [username]) VALUES (N'E0002', N'Son', NULL, N'Pham', N'Le Duan', N'123456890', 1, N'sonpham')
INSERT [dbo].[tbl_shoes] ([shoesID], [description], [quantity]) VALUES (N'S0001', N'Bitits Hunter', 70)
INSERT [dbo].[tbl_shoes] ([shoesID], [description], [quantity]) VALUES (N'S0002', N'Adidas Sneaker', 40)
INSERT [dbo].[tbl_shoes] ([shoesID], [description], [quantity]) VALUES (N'S0003', N'Nike Sneaker', 20)
INSERT [dbo].[tbl_sizes] ([id], [shoesID], [sizes], [country], [price], [quantity]) VALUES (N'L', N'S0001', 36, N'VN', 100, 20)
INSERT [dbo].[tbl_sizes] ([id], [shoesID], [sizes], [country], [price], [quantity]) VALUES (N'L', N'S0003', 36, N'VN', 700, 20)
INSERT [dbo].[tbl_sizes] ([id], [shoesID], [sizes], [country], [price], [quantity]) VALUES (N'M', N'S0001', 35, N'VN', 300, 10)
INSERT [dbo].[tbl_sizes] ([id], [shoesID], [sizes], [country], [price], [quantity]) VALUES (N'M', N'S0002', 35, N'VN', 200, 10)
INSERT [dbo].[tbl_sizes] ([id], [shoesID], [sizes], [country], [price], [quantity]) VALUES (N'XL', N'S0001', 37, N'VN', 500, 40)
INSERT [dbo].[tbl_sizes] ([id], [shoesID], [sizes], [country], [price], [quantity]) VALUES (N'XL', N'S0002', 37, N'VN', 99.99, 30)
ALTER TABLE [dbo].[tbl_customer]  WITH CHECK ADD  CONSTRAINT [FK_tbl_customer_tbl_account] FOREIGN KEY([username])
REFERENCES [dbo].[tbl_account] ([username])
GO
ALTER TABLE [dbo].[tbl_customer] CHECK CONSTRAINT [FK_tbl_customer_tbl_account]
GO
ALTER TABLE [dbo].[tbl_order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_tbl_customer] FOREIGN KEY([custID])
REFERENCES [dbo].[tbl_customer] ([custID])
GO
ALTER TABLE [dbo].[tbl_order] CHECK CONSTRAINT [FK_tbl_order_tbl_customer]
GO
ALTER TABLE [dbo].[tbl_orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderDetail_tbl_order] FOREIGN KEY([orderID])
REFERENCES [dbo].[tbl_order] ([orderID])
GO
ALTER TABLE [dbo].[tbl_orderDetail] CHECK CONSTRAINT [FK_tbl_orderDetail_tbl_order]
GO
ALTER TABLE [dbo].[tbl_orderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_orderDetail_tbl_shoes] FOREIGN KEY([productID])
REFERENCES [dbo].[tbl_shoes] ([shoesID])
GO
ALTER TABLE [dbo].[tbl_orderDetail] CHECK CONSTRAINT [FK_tbl_orderDetail_tbl_shoes]
GO
ALTER TABLE [dbo].[tbl_sizes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sizes_tbl_shoes] FOREIGN KEY([shoesID])
REFERENCES [dbo].[tbl_shoes] ([shoesID])
GO
ALTER TABLE [dbo].[tbl_sizes] CHECK CONSTRAINT [FK_tbl_sizes_tbl_shoes]
GO
USE [master]
GO
ALTER DATABASE [Assignment] SET  READ_WRITE 
GO
