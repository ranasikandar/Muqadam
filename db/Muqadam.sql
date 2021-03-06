USE [master]
GO
/****** Object:  Database [Muqadam]    Script Date: 09/29/2018 13:20:59 ******/
CREATE DATABASE [Muqadam] ON  PRIMARY 
( NAME = N'Muqadam', FILENAME = N'F:\DotNetProjects\Muqadam\DB\Muqadam.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Muqadam_log', FILENAME = N'F:\DotNetProjects\Muqadam\DB\Muqadam_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Muqadam] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Muqadam].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Muqadam] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Muqadam] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Muqadam] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Muqadam] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Muqadam] SET ARITHABORT OFF
GO
ALTER DATABASE [Muqadam] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Muqadam] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Muqadam] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Muqadam] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Muqadam] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Muqadam] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Muqadam] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Muqadam] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Muqadam] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Muqadam] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Muqadam] SET  DISABLE_BROKER
GO
ALTER DATABASE [Muqadam] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Muqadam] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Muqadam] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Muqadam] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Muqadam] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Muqadam] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Muqadam] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Muqadam] SET  READ_WRITE
GO
ALTER DATABASE [Muqadam] SET RECOVERY FULL
GO
ALTER DATABASE [Muqadam] SET  MULTI_USER
GO
ALTER DATABASE [Muqadam] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Muqadam] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Muqadam', N'ON'
GO
USE [Muqadam]
GO
/****** Object:  Table [dbo].[MaritalStatus]    Script Date: 09/29/2018 13:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaritalStatus](
	[MaritalStatusID] [tinyint] NOT NULL,
	[MaritalStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MaritalStatus] PRIMARY KEY CLUSTERED 
(
	[MaritalStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MaritalStatus] ([MaritalStatusID], [MaritalStatusName]) VALUES (1, N'Single')
INSERT [dbo].[MaritalStatus] ([MaritalStatusID], [MaritalStatusName]) VALUES (2, N'Married')
/****** Object:  Table [dbo].[Company]    Script Date: 09/29/2018 13:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [smallint] NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Company] ([CompanyID], [CompanyName]) VALUES (1, N'Searle')
INSERT [dbo].[Company] ([CompanyID], [CompanyName]) VALUES (2, N'Abbott')
/****** Object:  Table [dbo].[Users]    Script Date: 09/29/2018 13:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [Password]) VALUES (1, N'Ayaz Muhammad', N'shani', N'shani82')
INSERT [dbo].[Users] ([UserID], [FullName], [UserName], [Password]) VALUES (2, N'name', N'username', N'password')
/****** Object:  Table [dbo].[Students]    Script Date: 09/29/2018 13:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [bigint] NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[FatherName] [varchar](50) NOT NULL,
	[Age] [tinyint] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[CNIC] [varchar](20) NULL,
	[Address] [varchar](200) NULL,
	[PhoneNo] [varchar](20) NULL,
	[Sisters] [tinyint] NULL,
	[Brothers] [tinyint] NULL,
	[MaritalStatusID] [tinyint] NULL,
	[IncomeSource] [varchar](50) NULL,
	[JoiningReason] [varchar](50) NULL,
	[CourseApplied] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[CourseFromDate] [smalldatetime] NULL,
	[CourseToDate] [smalldatetime] NULL,
	[TrainingAt] [varchar](50) NULL,
	[LastDegree] [varchar](50) NULL,
	[Board] [varchar](50) NULL,
	[Grade] [varchar](5) NULL,
	[PassingYear] [varchar](10) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/29/2018 13:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[CurrentStock] [int] NOT NULL,
	[CompanyID] [smallint] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [CurrentStock], [CompanyID]) VALUES (1, N'Syrup', 10, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CurrentStock], [CompanyID]) VALUES (2, N'Tablet', 30, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [CurrentStock], [CompanyID]) VALUES (3, N'Mospel', 99, 2)
/****** Object:  ForeignKey [FK_Students_MaritalStatus]    Script Date: 09/29/2018 13:21:01 ******/
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_MaritalStatus] FOREIGN KEY([MaritalStatusID])
REFERENCES [dbo].[MaritalStatus] ([MaritalStatusID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_MaritalStatus]
GO
/****** Object:  ForeignKey [FK_Product_Company]    Script Date: 09/29/2018 13:21:01 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
