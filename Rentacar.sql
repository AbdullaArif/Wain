USE [master]
GO
/****** Object:  Database [RentCar]    Script Date: 3.07.2023 20:01:26 ******/
CREATE DATABASE [RentCar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentCar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER05\MSSQL\DATA\RentCar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentCar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER05\MSSQL\DATA\RentCar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RentCar] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentCar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentCar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentCar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentCar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentCar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentCar] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentCar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentCar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentCar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentCar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentCar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentCar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentCar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentCar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentCar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentCar] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RentCar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentCar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentCar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentCar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentCar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentCar] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RentCar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentCar] SET RECOVERY FULL 
GO
ALTER DATABASE [RentCar] SET  MULTI_USER 
GO
ALTER DATABASE [RentCar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentCar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentCar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentCar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentCar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentCar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RentCar', N'ON'
GO
ALTER DATABASE [RentCar] SET QUERY_STORE = ON
GO
ALTER DATABASE [RentCar] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RentCar]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[AgentId] [int] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BodyStyles]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyStyles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BodyStyles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[IsPrimary] [bit] NOT NULL,
	[CarId] [int] NOT NULL,
 CONSTRAINT [PK_CarImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](max) NOT NULL,
	[Model] [nvarchar](max) NOT NULL,
	[GraduationYear] [int] NOT NULL,
	[Engine] [nvarchar](max) NOT NULL,
	[March] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Transmission] [nvarchar](max) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[HorsePower] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsRent] [bit] NOT NULL,
	[AgentId] [int] NOT NULL,
	[BodyStyleId] [int] NOT NULL,
	[FuelTypeId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelTypes]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FuelTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCustoms]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCustoms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ServiceCustoms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slides]    Script Date: 3.07.2023 20:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[SubTitle] [nvarchar](300) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_Slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626183001_Init', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230626212433_AppUserPhoto', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230628153619_ServiceDesc', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230629232050_ContactUsTables', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230701063819_UpdateAppUser', N'6.0.16')
GO
SET IDENTITY_INSERT [dbo].[Agents] ON 

INSERT [dbo].[Agents] ([Id], [Name], [Surname], [Address], [Email], [Mobile], [Image]) VALUES (7, N'Remzi', N'Memmedov', N'Gakh Almali', N'remzi@mail.ru', N'+994 000 00 34', N'e142b62f-0636-47ba-9c01-1d6c34cd5db1profilphoto.jpeg')
SET IDENTITY_INSERT [dbo].[Agents] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'017fc156-4ab7-4687-aa58-1ff44c2b3c8d', N'Member', N'MEMBER', N'9fddedaf-9757-494b-b3b7-dbbc8bd39bb2')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7d8a50d3-7590-4b04-9daa-60985739225e', N'Seller', N'SELLER', N'41e5d495-e329-46c3-9f53-3834f0c0e170')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'eed24824-9303-4589-82b6-4ee1d480ec6f', N'Admin', N'ADMIN', N'05c15a0f-b244-4ddc-9e04-e8196602bdfe')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a6ad93ca-841e-4c92-9203-3304e22ca62e', N'017fc156-4ab7-4687-aa58-1ff44c2b3c8d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'63714c4a-ec1b-4a47-b41e-ddf129141bb6', N'7d8a50d3-7590-4b04-9daa-60985739225e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ad4c13ee-653a-482b-b895-16318cf72131', N'eed24824-9303-4589-82b6-4ee1d480ec6f')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [AgentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ImageURL], [Address], [Mobile]) VALUES (N'63714c4a-ec1b-4a47-b41e-ddf129141bb6', N'Remzi', N'Memmedov', 7, N'ramzes', N'RAMZES', N'remzi@mail.ru', N'REMZI@MAIL.RU', 0, N'AQAAAAEAACcQAAAAEARB1U2gdqKenISBS/UW1T1p4s8GeezGI+e10c2v9DhFDJKGguonvnYej/JvyoGiuw==', N'KXMKELRKUS4HLRN4NTXTTUUKW3Z43J4V', N'c4a56fe4-6345-47a6-816a-7b453754a013', NULL, 0, 0, NULL, 1, 0, N'76372ec0-4a51-4956-af93-681b22fc4fcaprofilphoto.jpeg', NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [AgentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ImageURL], [Address], [Mobile]) VALUES (N'a6ad93ca-841e-4c92-9203-3304e22ca62e', N'Banu', N'Nur', NULL, N'banu', N'BANU', N'banunur@mail.ru', N'BANUNUR@MAIL.RU', 0, N'AQAAAAEAACcQAAAAEKK/iMMdLgSmsvHmepECEhMf+VONK7LfxX+TtPZyH/8fI3lOVeqQ3Rik2O76vmqIhQ==', N'RESI4O7WMTRN4HGLB6IG33YZGUXYLDA6', N'e794562f-fce6-4768-8c25-0aaa3c7c8247', NULL, 0, 0, NULL, 1, 0, N'28dc8a79-9cc4-4601-95f9-00cda354c7a6profilphoto.jpeg', NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surname], [AgentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ImageURL], [Address], [Mobile]) VALUES (N'ad4c13ee-653a-482b-b895-16318cf72131', N'Arif', N'Abdulla', NULL, N'arif34', N'ARIF34', N'arif@gmail.com', N'ARIF@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEEqOaFZJtlNOy9mC2O9qaa1iAh59EYeWofDhWUVXz0LQH2S1rtRrZxRPPKaxXLqpVg==', N'7BPZIUHIBC7JCN7QOXHOLJSMXVU6LGSN', N'dc899738-a5a3-42cc-aeca-f7ced4132a1e', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[BodyStyles] ON 

INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (1, N'Sedan')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (2, N'SUV')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (3, N'Hatchback')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (4, N'Coupe')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (5, N'Sports sedan')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (6, N'Crossover')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (7, N'Station Wagon')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (8, N'
Convertible')
INSERT [dbo].[BodyStyles] ([Id], [Name]) VALUES (9, N'Minivan')
SET IDENTITY_INSERT [dbo].[BodyStyles] OFF
GO
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (14, N'6f65649f-99ba-4b03-aaad-4bb5dec8edb7BMWI8Main.jpeg', 1, 6)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (15, N'83a8ff1b-e6cf-4e26-bce9-d904f8db0ec3BMWI8HOWER.jpeg', 0, 6)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (16, N'bad3f91e-9cf8-462f-88f4-88eeb6df8d02BMWI8hower1.jpeg', 0, 6)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (17, N'5dbb2ca2-be47-4a28-8ca8-0cd94b6d194bbmwm5maain.jpeg', 1, 7)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (18, N'68db15a4-4a75-41e4-ac0e-acaad9b0c98cbmwm5howe1.jpeg', 0, 7)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (19, N'434d7945-e4db-46d5-84cb-4aae9cb6fc37bmwm5hower.jpeg', 0, 7)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (20, N'53e12a55-ae19-4993-99e4-53681841014fmercedesmain.jpeg', 1, 8)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (21, N'895c24a3-b5d2-4cf3-9792-4fcd40c33608mercedeshower.jpeg', 0, 8)
INSERT [dbo].[CarImages] ([Id], [Image], [IsPrimary], [CarId]) VALUES (22, N'de847f34-28fc-40f4-a661-fc1adb36730fmercedeshower1.jpeg', 0, 8)
SET IDENTITY_INSERT [dbo].[CarImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [Brand], [Model], [GraduationYear], [Engine], [March], [Price], [Transmission], [Location], [HorsePower], [Description], [IsRent], [AgentId], [BodyStyleId], [FuelTypeId], [ColorId]) VALUES (6, N'BMW', N'i8', 2019, N'98 kW (131 hp)', CAST(5000.00 AS Decimal(18, 2)), CAST(387.00 AS Decimal(18, 2)), N'Aisin F21-360 FT EOP', N'Azerbaijan Gakh', 369, N'The BMW i8 is a plug-in hybrid sports car developed by BMW. The i8 was part of BMW''s electrified fleet and was marketed under the BMW i sub-brand. The production version of the BMW i8 was unveiled at the 2013 Frankfurt Motor Show and was released in Germany in June 2014. Deliveries to retail customers in the U.S. began in August 2014. A roadster variant was launched in May 2018. Production ended in June 2020', 1, 7, 5, 3, 3)
INSERT [dbo].[Cars] ([Id], [Brand], [Model], [GraduationYear], [Engine], [March], [Price], [Transmission], [Location], [HorsePower], [Description], [IsRent], [AgentId], [BodyStyleId], [FuelTypeId], [ColorId]) VALUES (7, N'BMW ', N'M5 Competition', 2020, N'3.5 L M88/3 or S38 I6', CAST(7000.00 AS Decimal(18, 2)), CAST(343.00 AS Decimal(18, 2)), N'5-speed manual', N'Azerbaijan Gakh', 625, N'GREAT EXPECTATIONS. Now in its sixth generation, the new BMW M5 Competition has taken an iconic design language and accentuated it with eye-catching elements. From the front, these include the new redesigned M kidney grille with a single-piece frame finished in high-gloss black. From the rear, darker three-dimensional rear lights, and a powerful rear apron with larger air diffuser and with two twin tailpipes typical of M vehicles.', 1, 7, 1, 1, 9)
INSERT [dbo].[Cars] ([Id], [Brand], [Model], [GraduationYear], [Engine], [March], [Price], [Transmission], [Location], [HorsePower], [Description], [IsRent], [AgentId], [BodyStyleId], [FuelTypeId], [ColorId]) VALUES (8, N'Mercedes', N'S-500', 2022, N'2999 cm3/M 256 E 30 DEH LA G ', CAST(4673.00 AS Decimal(18, 2)), CAST(298.00 AS Decimal(18, 2)), N'9 speed Automatic', N'Azerbaijan Gakh', 429, N'The Mercedes-Benz S-Class, formerly known as Sonderklasse (German for "special class", abbreviated as "S-Klasse"), is a series of full-sized luxury sedans, limousines and armored sedans produced by the German automaker Mercedes-Benz. The S-Class is the designation for top-of-the-line Mercedes-Benz models and was officially introduced in 1972 with the W116, and has remained in use ever since. The S-Class is the flagship vehicle for Mercedes-Benz.', 1, 7, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'White')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Yellow')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Black')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Blue')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Gray')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Purple')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Green')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (8, N'Metallic')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (9, N'Orange')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (10, N'Red')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Subject], [Number], [Message]) VALUES (1, N'sasa', N'arif@gmail.com', N'Test', N'3232323', N'asdasd')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Subject], [Number], [Message]) VALUES (2, N'test222', N'arif@gmail.com', N'Test', N'3232323', N'ssdaf')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Subject], [Number], [Message]) VALUES (3, N'Arif', N'salam@mail.ru', N'Test', N'3232323', N'asdasdasda')
INSERT [dbo].[Contacts] ([Id], [Name], [Email], [Subject], [Number], [Message]) VALUES (4, N'Elikram Memmedov', N'salam@mail.ru', N'bla bla', N'2737383883', N'Very good web site')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[FuelTypes] ON 

INSERT [dbo].[FuelTypes] ([Id], [Name]) VALUES (1, N'Gasoline')
INSERT [dbo].[FuelTypes] ([Id], [Name]) VALUES (2, N'Diesel')
INSERT [dbo].[FuelTypes] ([Id], [Name]) VALUES (3, N'Electricity ')
INSERT [dbo].[FuelTypes] ([Id], [Name]) VALUES (4, N'LPG ')
SET IDENTITY_INSERT [dbo].[FuelTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceCustoms] ON 

INSERT [dbo].[ServiceCustoms] ([Id], [Key], [Value], [Description]) VALUES (1, N'Air Conditionninds', N'<i class="flaticon-car-2"></i>', N'Welcome to our Rent a Car website! Our vehicles are equipped with top-notch air conditioning systems to ensure a comfortable and refreshing driving experience, no matter the weather.')
INSERT [dbo].[ServiceCustoms] ([Id], [Key], [Value], [Description]) VALUES (2, N'Oll Changes', N'<i class="flaticon-transport-3"></i>', N'At our Rent a Car service, we prioritize your safety and convenience. Rest assured that all our vehicles undergo regular oil changes and maintenance to guarantee optimal performance and reliability during your rental period.')
INSERT [dbo].[ServiceCustoms] ([Id], [Key], [Value], [Description]) VALUES (3, N'Security', N'<i class="flaticon-lock"></i>', N'Your security is our utmost concern. We provide comprehensive security measures, including advanced locking systems and GPS tracking, to ensure the safety of both you and our vehicles throughout your rental duration.')
INSERT [dbo].[ServiceCustoms] ([Id], [Key], [Value], [Description]) VALUES (4, N'Free Support Anytime', N'<i class="flaticon-people"></i>', N'We believe in providing exceptional customer support. Our team is available round the clock to assist you with any inquiries or issues you may have during your rental. Enjoy the peace of mind that comes with our free support service, anytime you need it.')
INSERT [dbo].[ServiceCustoms] ([Id], [Key], [Value], [Description]) VALUES (5, N'Automatic
', N'<i class="flaticon-camera"></i>', N'Experience a hassle-free driving experience with our fleet of automatic vehicles. Whether you''re a seasoned driver or prefer the convenience of automatic transmission, our cars offer a smooth and effortless ride.')
INSERT [dbo].[ServiceCustoms] ([Id], [Key], [Value], [Description]) VALUES (6, N'Electrical Works', N'<i class="flaticon-technology"></i>', N'NULLOur Rent a Car service also specializes in electrical works. From electric vehicle rentals to hybrid models, we offer environmentally-friendly options that cater to your specific needs while reducing carbon emissions.')
SET IDENTITY_INSERT [dbo].[ServiceCustoms] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (1, N'PhoneNum', N'+994-99-999-00-34')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (2, N'Address', N'221 B Baker Street')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (3, N'Email', N'wain.rent.a.car@gmail.com')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (4, N'Facebook', N'https://www.facebook.com/')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (5, N'Twitter', N'https://twitter.com/')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (6, N'Linkedin', N'https://www.linkedin.com/')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (7, N'Google+', N'https://myaccount.google.com/')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (8, N'Instagram', N'https://www.instagram.com/')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (9, N'LogoWain', N'logo.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (10, N'LogoBlackWain', N'black-logo.png')
INSERT [dbo].[Settings] ([Id], [Key], [Value]) VALUES (11, N'SearchIcon', N'<i b-0dgx3okzg3="" class="fa fa-search"></i>')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([Id], [Title], [SubTitle], [Image], [Order]) VALUES (1, N'Driven Dreams: Where Every Mile Becomes a Memory', N'Turn Your Travel Fantasies into Reality with our Exclusive Car Rental Experience', N'a0a37610-3701-4a9c-8a4a-863f60ab7540Carpage1080x19200.jpg', 1)
INSERT [dbo].[Slides] ([Id], [Title], [SubTitle], [Image], [Order]) VALUES (2, N'Ideal choice for renting a car', N'The ride of your dreams...', N'cf8968eb-e611-4506-b21a-755cb056d76eBMWPhoto1080x1920.jpg', 2)
INSERT [dbo].[Slides] ([Id], [Title], [SubTitle], [Image], [Order]) VALUES (3, N'Wander with Wheels: Unleash Your Adventure', N'Explore the World on Your Terms with our Premier Car Rental Service', N'cbe6feed-6a39-4d56-b848-79c21dabe506bugattiphoto1920x1080.jpg', 3)
SET IDENTITY_INSERT [dbo].[Slides] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3.07.2023 20:01:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUsers_AgentId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUsers_AgentId] ON [dbo].[AspNetUsers]
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3.07.2023 20:01:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CarImages_CarId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_CarImages_CarId] ON [dbo].[CarImages]
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_AgentId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_Cars_AgentId] ON [dbo].[Cars]
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_BodyStyleId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_Cars_BodyStyleId] ON [dbo].[Cars]
(
	[BodyStyleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_ColorId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_Cars_ColorId] ON [dbo].[Cars]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cars_FuelTypeId]    Script Date: 3.07.2023 20:01:27 ******/
CREATE NONCLUSTERED INDEX [IX_Cars_FuelTypeId] ON [dbo].[Cars]
(
	[FuelTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Agents_AgentId] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Agents_AgentId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CarImages]  WITH CHECK ADD  CONSTRAINT [FK_CarImages_Cars_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Cars] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarImages] CHECK CONSTRAINT [FK_CarImages_Cars_CarId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Agents_AgentId] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Agents_AgentId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_BodyStyles_BodyStyleId] FOREIGN KEY([BodyStyleId])
REFERENCES [dbo].[BodyStyles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_BodyStyles_BodyStyleId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Colors_ColorId]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_FuelTypes_FuelTypeId] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[FuelTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_FuelTypes_FuelTypeId]
GO
USE [master]
GO
ALTER DATABASE [RentCar] SET  READ_WRITE 
GO
