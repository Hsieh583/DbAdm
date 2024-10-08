/****** Object:  Database [Db]    Script Date: 2022/7/26 下午 11:06:17 ******/
/*
CREATE DATABASE [Db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db', FILENAME = N'C:\Users\bruce\Db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db_log', FILENAME = N'C:\Users\bruce\Db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Db] SET  MULTI_USER 
GO
ALTER DATABASE [Db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db] SET QUERY_STORE = OFF
GO
*/
/****** Object:  Table [dbo].[Column]    Script Date: 2022/7/26 下午 11:06:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Column](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[TableId] [varchar](10) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DataType] [varchar](20) NOT NULL,
	[Nullable] [bit] NOT NULL,
	[DefaultValue] [varchar](100) NULL,
	[Sort] [int] NOT NULL,
	[Note] [nvarchar](255) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Column] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crud]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crud](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[ProjectId] [varchar](10) NOT NULL,
	[ProgCode] [varchar](30) NOT NULL,
	[ProgName] [nvarchar](30) NOT NULL,
	[LabelHori] [bit] NOT NULL,
	[ReadSql] [varchar](500) NOT NULL,
	[TableAs] [varchar](10) NULL,
	[HasCreate] [bit] NOT NULL,
	[HasUpdate] [bit] NOT NULL,
	[HasDelete] [bit] NOT NULL,
	[HasView] [bit] NOT NULL,
	[HasExport] [bit] NOT NULL,
	[HasReset] [bit] NOT NULL,
	[AuthType] [tinyint] NOT NULL,
	[Status] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Revised] [datetime] NULL,
 CONSTRAINT [PK_Crud] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudEitem]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudEitem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[EtableId] [varchar](10) NOT NULL,
	[ColumnId] [varchar](10) NOT NULL,
	[EitemType] [varchar](10) NOT NULL,
	[ItemData] [nvarchar](50) NULL,
	[Required] [bit] NOT NULL,
	[HasCreate] [bit] NOT NULL,
	[HasUpdate] [bit] NOT NULL,
	[PlaceHolder] [varchar](10) NULL,
	[DefaultValue] [varchar](10) NULL,
	[PosGroup] [varchar](10) NULL,
	[LayoutCols] [varchar](10) NULL,
	[Width] [int] NOT NULL,
	[CheckType] [varchar](10) NOT NULL,
	[CheckData] [varchar](10) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_CrudEitem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudEtable]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudEtable](
	[Id] [varchar](10) NOT NULL,
	[CrudId] [varchar](10) NOT NULL,
	[TableId] [varchar](10) NOT NULL,
	[PkeyFid] [varchar](10) NOT NULL,
	[FkeyFid] [varchar](10) NULL,
	[Col4] [varchar](30) NOT NULL,
	[OrderBy] [varchar](10) NOT NULL,
	[Sort] [int] NOT NULL,
	[HalfWidth] [bit] NOT NULL,
 CONSTRAINT [PK_CrudEtable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudQitem]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudQitem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[CrudId] [varchar](10) NOT NULL,
	[ColumnId] [varchar](10) NOT NULL,
	[TableAs] [varchar](20) NOT NULL,
	[QitemType] [varchar](20) NOT NULL,
	[ItemData] [varchar](20) NULL,
	[Op] [varchar](10) NOT NULL,
	[IsRange] [bit] NOT NULL,
	[IsFind2] [bit] NOT NULL,
	[PosGroup] [varchar](10) NULL,
	[LayoutCols] [varchar](20) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_CrudQitem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CrudRitem]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrudRitem](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[CrudId] [varchar](10) NOT NULL,
	[ColumnCode] [varchar](100) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Width] [int] NOT NULL,
	[RitemType] [varchar](10) NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_CrudRitem] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[Code] [nvarchar](30) NOT NULL,
	[DbName] [varchar](20) NOT NULL,
	[DbType] [tinyint] NOT NULL,
	[ProjectPath] [varchar](255) NOT NULL,
	[ConnectStr] [varchar](255) NOT NULL,
	[Status] [bit] NOT NULL,
	[FromTmpTable] [bit] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[Sn] [int] IDENTITY(1,1) NOT NULL,
	[Id] [varchar](10) NOT NULL,
	[ProjectId] [varchar](10) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Note] [nvarchar](255) NULL,
	[TranLog] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[Sn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpColumn]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpColumn](
	[Code] [varchar](100) NOT NULL,
	[TableCode] [varchar](100) NULL,
	[DataType] [varchar](20) NOT NULL,
	[Nullable] [bit] NOT NULL,
	[DefaultValue] [varchar](100) NULL,
	[Sort] [smallint] NOT NULL,
	[Note] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmpTable]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpTable](
	[Code] [varchar](100) NOT NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK__tmpTable__A25C5AA6183AE814] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XpCode]    Script Date: 2022/7/26 下午 11:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XpCode](
	[Type] [varchar](20) NOT NULL,
	[Value] [varchar](10) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Sort] [int] NOT NULL,
	[Ext] [varchar](30) NULL,
	[Note] [nvarchar](255) NULL,
 CONSTRAINT [PK_XpCode] PRIMARY KEY CLUSTERED 
(
	[Type] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Column] ON 

INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1, N'15ZQD4ED1A', N'D58LXL44TA', N'test', N'test', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (2, N'1616P05CQA', N'1616P03CSA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (3, N'1616P05E1A', N'1616P03CSA', N'WorkNo', N'', N'varchar(13)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (4, N'1616P05FFA', N'1616P03CSA', N'ProjectName', N'', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (5, N'1616P05GVA', N'1616P03CSA', N'WorkDate', N'', N'varchar(16)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (6, N'1616P05J9A', N'1616P03CSA', N'WorkTime', N'', N'varchar(16)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (7, N'1616P05KLA', N'1616P03CSA', N'Latitude', N'', N'decimal(10,6)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (8, N'1616P05LXA', N'1616P03CSA', N'Longitude', N'', N'decimal(10,6)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (9, N'1616P05NBA', N'1616P03CSA', N'Location', N'', N'varchar(100)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (10, N'1616P05QTA', N'1616P03CSA', N'WorkDesc', N'', N'varchar(100)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (11, N'1616P05SDA', N'1616P03CSA', N'DescItem', N'', N'varchar(1)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (12, N'1616P060PA', N'1616P03CSA', N'Img1', N'', N'varchar(100)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (13, N'1616P0623A', N'1616P03CSA', N'ImgDesc1', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (14, N'1616P063EA', N'1616P03CSA', N'Img2', N'', N'varchar(100)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (15, N'1616P064RA', N'1616P03CSA', N'ImgDesc2', N'', N'varchar(50)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (16, N'1616P0662A', N'1616P03CSA', N'Img3', N'', N'varchar(100)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (17, N'1616P067GA', N'1616P03CSA', N'ImgDesc3', N'', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (18, N'1616P068TA', N'1616P03CSA', N'Img4', N'', N'varchar(100)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (19, N'1616P06A7A', N'1616P03CSA', N'ImgDesc4', N'', N'varchar(50)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (20, N'1616P06BJA', N'1616P03CSA', N'Img5', N'', N'varchar(100)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (21, N'1616P06CVA', N'1616P03CSA', N'ImgDesc5', N'', N'varchar(50)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (22, N'1616P06E9A', N'1616P03CSA', N'Img6', N'', N'varchar(100)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (23, N'1616P06FLA', N'1616P03CSA', N'ImgDesc6', N'', N'varchar(50)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (24, N'1616P06GXA', N'1616P03CSA', N'WorkSignImg', N'', N'varchar(100)', 0, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (25, N'1616P06JBA', N'1616P03CSA', N'SiteSignImg', N'', N'varchar(100)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (26, N'1616P06KNA', N'1616P03CSA', N'CreateTime', N'', N'timestamp', 0, N'CURRENT_TIMESTAMP', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (27, N'1616P06M2A', N'1616P03CSA', N'CreateUser', N'', N'varchar(20)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (28, N'1616P06NGA', N'1616P03CSA', N'LastUpdateTime', N'', N'timestamp', 0, N'CURRENT_TIMESTAMP', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (29, N'1616P06PTA', N'1616P03CSA', N'LastUpdateUser', N'', N'varchar(20)', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (30, N'1616P06R4A', N'1616P03CSA', N'WorkEmp', N'', N'varchar(50)', 1, N'', 29, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (31, N'1616P06SJA', N'1616P03E3A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (32, N'1616P06TYA', N'1616P03E3A', N'WorkOrderId', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (33, N'1616P06VCA', N'1616P03E3A', N'InspectTime', N'', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (34, N'1616P06WPA', N'1616P03E3A', N'OutCase', N'', N'tinyint(1)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (35, N'1616P06Y0A', N'1616P03E3A', N'PowerLine', N'', N'tinyint(1)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (36, N'1616P06ZEA', N'1616P03E3A', N'Equipment', N'', N'tinyint(1)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (37, N'1616P070RA', N'1616P03E3A', N'Shelter', N'', N'tinyint(1)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (38, N'1616P0725A', N'1616P03E3A', N'Pollution', N'', N'tinyint(1)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (39, N'1616P073GA', N'1616P03E3A', N'MetalWaterproof', N'', N'tinyint(1)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (40, N'1616P074WA', N'1616P03E3A', N'MetalWhole', N'', N'tinyint(1)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (41, N'1616P0767A', N'1616P03E3A', N'CementPVC', N'', N'tinyint(1)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (42, N'1616P077MA', N'1616P03E3A', N'CementCase', N'', N'tinyint(1)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (43, N'1616P078YA', N'1616P03E3A', N'CementIronCircle', N'', N'tinyint(1)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (44, N'1616P07A6A', N'1616P03E3A', N'InspectNoted', N'', N'varchar(100)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (45, N'1616P07BPA', N'1616P03E3A', N'CloseReasonDetailId', N'', N'varchar(45)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (46, N'1616P07D0A', N'1616P03E3A', N'Img1', N'', N'varchar(100)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (47, N'1616P07EBA', N'1616P03E3A', N'Img2', N'', N'varchar(100)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (48, N'1616P07FRA', N'1616P03E3A', N'Img3', N'', N'varchar(100)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (49, N'1616P07H2A', N'1616P03E3A', N'Img4', N'', N'varchar(100)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (50, N'1616P07JDA', N'1616P03E3A', N'StationNo', N'', N'varchar(50)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (51, N'1616P07KTA', N'1616P03E3A', N'StartDate', N'', N'datetime', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (52, N'1616P07M7A', N'1616P03E3A', N'EndDate', N'', N'datetime', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (53, N'1616P07NJA', N'1616P03E3A', N'SuccessDate', N'', N'datetime', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (54, N'1616P07PYA', N'1616P03FHA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (55, N'1616P07R9A', N'1616P03FHA', N'WorkOrderId', N'', N'varchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (56, N'1616P07SLA', N'1616P03FHA', N'InstallTime', N'', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (57, N'1616P07U0A', N'1616P03FHA', N'InstallProject', N'', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (58, N'1616P07VBA', N'1616P03FHA', N'LocationId', N'', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (59, N'1616P07WRA', N'1616P03FHA', N'Address', N'', N'varchar(50)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (60, N'1616P07Y5A', N'1616P03FHA', N'IMEI', N'', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (61, N'1616P07ZGA', N'1616P03FHA', N'SensorNo', N'', N'varchar(50)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (62, N'1616P080WA', N'1616P03FHA', N'ManageUnit', N'', N'varchar(50)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (63, N'1616P082AA', N'1616P03FHA', N'Lat', N'', N'decimal(10,6)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (64, N'1616P083MA', N'1616P03FHA', N'Lon', N'', N'decimal(10,6)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (65, N'1616P084YA', N'1616P03FHA', N'CloseReasonDetailId', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (66, N'1616P0869A', N'1616P03FHA', N'Desc1', N'', N'varchar(50)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (67, N'1616P087SA', N'1616P03FHA', N'Desc2', N'', N'varchar(50)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (68, N'1616P0890A', N'1616P03FHA', N'Desc3', N'', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (69, N'1616P08AEA', N'1616P03FHA', N'Desc4', N'', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (70, N'1616P08BRA', N'1616P03FHA', N'Desc5', N'', N'varchar(50)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (71, N'1616P08D2A', N'1616P03FHA', N'Desc6', N'', N'varchar(50)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (72, N'1616P08EGA', N'1616P03FHA', N'Desc7', N'', N'varchar(50)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (73, N'1616P08FWA', N'1616P03FHA', N'Desc8', N'', N'varchar(50)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (74, N'1616P08H7A', N'1616P03FHA', N'Desc9', N'', N'varchar(50)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (75, N'1616P08JMA', N'1616P03FHA', N'Desc10', N'', N'varchar(50)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (76, N'1616P08KYA', N'1616P03FHA', N'Desc11', N'', N'varchar(50)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (77, N'1616P08M9A', N'1616P03FHA', N'Img1', N'', N'varchar(100)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (78, N'1616P08NLA', N'1616P03FHA', N'Img2', N'', N'varchar(100)', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (79, N'1616P08PXA', N'1616P03FHA', N'Img3', N'', N'varchar(100)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (80, N'1616P08RBA', N'1616P03FHA', N'Img4', N'', N'varchar(100)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (81, N'1616P08SRA', N'1616P03FHA', N'Img5', N'', N'varchar(100)', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (82, N'1616P08U2A', N'1616P03FHA', N'Img6', N'', N'varchar(100)', 1, N'', 29, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (83, N'1616P08VGA', N'1616P03FHA', N'Img7', N'', N'varchar(100)', 1, N'', 30, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (84, N'1616P08WTA', N'1616P03FHA', N'Img8', N'', N'varchar(100)', 1, N'', 31, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (85, N'1616P08Y4A', N'1616P03FHA', N'Img9', N'', N'varchar(100)', 1, N'', 32, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (86, N'1616P08ZJA', N'1616P03FHA', N'Img10', N'', N'varchar(100)', 1, N'', 33, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (87, N'1616P090VA', N'1616P03FHA', N'Img11', N'', N'varchar(100)', 1, N'', 34, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (88, N'1616P0929A', N'1616P03FHA', N'InstallRoad', N'安裝路段', N'varchar(50)', 1, N'', 35, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (89, N'1616P093LA', N'1616P03FHA', N'InstallCounty', N'安裝縣市', N'varchar(50)', 1, N'', 36, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (90, N'1616P094XA', N'1616P03FHA', N'SituationType', N'感測情境類型', N'varchar(50)', 1, N'', 37, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (91, N'1616P0968A', N'1616P03FHA', N'SituationName', N'感測情境名稱', N'varchar(50)', 1, N'', 38, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (92, N'1616P097KA', N'1616P03FHA', N'InstallArea', N'安裝鄉鎮區', N'varchar(50)', 1, N'', 39, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (93, N'1616P098ZA', N'1616P03FHA', N'InstallHigh', N'安裝高度', N'varchar(50)', 1, N'', 40, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (94, N'1616P09AAA', N'1616P03FHA', N'InstallLocation', N'裝設位置', N'varchar(50)', 1, N'', 41, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (95, N'1616P09BQA', N'1616P03FHA', N'MobileDevice', N'是否為移動式裝置', N'tinyint(1)', 1, N'', 42, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (96, N'1616P09D1A', N'1616P03FHA', N'RetrofitWindSpeed', N'有無加裝風速風向', N'tinyint(1)', 1, N'', 43, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (97, N'1616P09EFA', N'1616P03FHA', N'InstallLight', N'燈桿編號', N'varchar(50)', 1, N'', 44, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (98, N'1616P09FSA', N'1616P03FHA', N'Img12', N'', N'varchar(100)', 1, N'', 45, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (99, N'1616P09H3A', N'1616P03FHA', N'Img13', N'', N'varchar(100)', 1, N'', 46, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (100, N'1616P09JHA', N'1616P03FHA', N'Desc12', N'', N'varchar(50)', 1, N'', 47, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (101, N'1616P09KXA', N'1616P03FHA', N'Desc13', N'', N'varchar(50)', 1, N'', 48, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (102, N'1616P09MBA', N'1616P03FHA', N'ImgLat', N'', N'decimal(10,6)', 1, N'', 49, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (103, N'1616P09NRA', N'1616P03FHA', N'ImgLon', N'', N'decimal(10,6)', 1, N'', 50, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (104, N'1616P09Q2A', N'1616P03FHA', N'SuccessDate', N'', N'datetime', 1, N'', 51, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (105, N'1616P09RDA', N'1616P03GUA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (106, N'1616P09STA', N'1616P03GUA', N'WorkOrderId', N'', N'varchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (107, N'1616P09U4A', N'1616P03GUA', N'SendTime', N'', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (108, N'1616P09VJA', N'1616P03GUA', N'Cause', N'', N'varchar(70)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (109, N'1616P09WYA', N'1616P03GUA', N'Record', N'', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (110, N'1616P09Y9A', N'1616P03GUA', N'CloseTime', N'', N'datetime', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (111, N'1616P09ZPA', N'1616P03GUA', N'CloseReasonDeatilId', N'', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (112, N'1616P0A10A', N'1616P03GUA', N'Img1', N'', N'varchar(100)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (113, N'1616P0A2BA', N'1616P03GUA', N'Img2', N'', N'varchar(100)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (114, N'1616P0A3RA', N'1616P03GUA', N'Img3', N'', N'varchar(100)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (115, N'1616P0A52A', N'1616P03GUA', N'Img4', N'', N'varchar(100)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (116, N'1616P0A6GA', N'1616P03GUA', N'IMEI', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (117, N'1616P0A7WA', N'1616P03GUA', N'ChangeIMEI', N'', N'varchar(50)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (118, N'1616P0A9AA', N'1616P03GUA', N'Description', N'', N'varchar(100)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (119, N'1616P0AAMA', N'1616P03GUA', N'Project1999', N'1999專案代號', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (120, N'1616P0ABVA', N'1616P03GUA', N'Issue', N'', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (121, N'1616P0AD9A', N'1616P03GUA', N'SuccessDate', N'', N'datetime', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (122, N'1616P0AEPA', N'1616P03J5A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (123, N'1616P0AG0A', N'1616P03J5A', N'WorkOrderId', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (124, N'1616P0AHEA', N'1616P03J5A', N'VisuallyInspectTime', N'', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (125, N'1616P0AJRA', N'1616P03J5A', N'Exterior', N'', N'tinyint(1)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (126, N'1616P0AL2A', N'1616P03J5A', N'ExteriorNoted', N'', N'varchar(100)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (127, N'1616P0AMGA', N'1616P03J5A', N'Internal', N'', N'tinyint(1)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (128, N'1616P0ANTA', N'1616P03J5A', N'InternalNoted', N'', N'varchar(100)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (129, N'1616P0AQ7A', N'1616P03J5A', N'Around', N'', N'tinyint(1)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (130, N'1616P0ARJA', N'1616P03J5A', N'AroundNoted', N'', N'varchar(100)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (131, N'1616P0ASYA', N'1616P03J5A', N'Emission', N'', N'tinyint(1)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (132, N'1616P0AUCA', N'1616P03J5A', N'EmissionNoted', N'', N'varchar(100)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (133, N'1616P0AVPA', N'1616P03J5A', N'Sensor', N'', N'tinyint(1)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (134, N'1616P0AX0A', N'1616P03J5A', N'SensorNoted', N'', N'varchar(100)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (135, N'1616P0AYEA', N'1616P03J5A', N'MaintainLog', N'', N'tinyint(1)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (136, N'1616P0AZRA', N'1616P03J5A', N'MaintainLogNoted', N'', N'varchar(100)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (137, N'1616P0B12A', N'1616P03J5A', N'Img1', N'', N'varchar(100)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (138, N'1616P0B2GA', N'1616P03J5A', N'Img2', N'', N'varchar(100)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (139, N'1616P0B3TA', N'1616P03J5A', N'Img3', N'', N'varchar(100)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (140, N'1616P0B54A', N'1616P03J5A', N'Img4', N'', N'varchar(100)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (141, N'1616P0B6FA', N'1616P03J5A', N'DetectorStationNo', N'', N'varchar(50)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (142, N'1616P0B7SA', N'1616P03J5A', N'DetectorNo', N'', N'varchar(50)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (143, N'1616P0B96A', N'1616P03J5A', N'IMGNo', N'', N'varchar(50)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (144, N'1616P0BALA', N'1616P03J5A', N'StartDate', N'', N'datetime', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (145, N'1616P0BBXA', N'1616P03J5A', N'EndDate', N'', N'datetime', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (146, N'1616P0BD8A', N'1616P03J5A', N'WorkEmp', N'', N'varchar(50)', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (147, N'1616P0BENA', N'1616P03J5A', N'VerifyEmp', N'', N'varchar(50)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (148, N'1616P0BG2A', N'1616P03J5A', N'UnitManager', N'', N'varchar(50)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (149, N'1616P0BHGA', N'1616P03J5A', N'SuccessDate', N'', N'datetime', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (150, N'1616P0BJTA', N'1616P03KGA', N'Id', N'', N'int(11)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (151, N'1616P0BL4A', N'1616P03KGA', N'Name', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (152, N'1616P0BMFA', N'1616P03KGA', N'Latitude', N'', N'decimal(10,6)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (153, N'1616P0BNVA', N'1616P03KGA', N'Longitude', N'', N'decimal(10,6)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (154, N'1616P0BQ6A', N'1616P03LWA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (155, N'1616P0BRHA', N'1616P03LWA', N'RoleName', N'角色名稱', N'varchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (156, N'1616P0BSUA', N'1616P03LWA', N'OutSource', N'', N'tinyint(1)', 0, N'0', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (157, N'1616P0BU5A', N'1616P03LWA', N'Area_Id', N'', N'int(11)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (158, N'1616P0BVGA', N'1616P03NAA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (159, N'1616P0BWTA', N'1616P03NAA', N'AuthRoles_Id', N'', N'varchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (160, N'1616P0BY7A', N'1616P03NAA', N'Employee_EmpID', N'', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (161, N'1616P0BZJA', N'1616P03PMA', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (162, N'1616P0C0YA', N'1616P03PMA', N'WorkOrderId', N'', N'varchar(36)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (163, N'1616P0C29A', N'1616P03PMA', N'Address', N'', N'varchar(100)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (164, N'1616P0C3LA', N'1616P03PMA', N'ElectricNo', N'', N'varchar(15)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (165, N'1616P0C50A', N'1616P03PMA', N'ElectricMeterNo', N'', N'varchar(15)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (166, N'1616P0C6BA', N'1616P03PMA', N'BillDate_Jan', N'', N'varchar(15)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (167, N'1616P0C7RA', N'1616P03PMA', N'BillDate_Feb', N'', N'varchar(15)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (168, N'1616P0C95A', N'1616P03PMA', N'BillDate_Mar', N'', N'varchar(15)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (169, N'1616P0CAGA', N'1616P03PMA', N'BillDate_Apr', N'', N'varchar(15)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (170, N'1616P0CBTA', N'1616P03PMA', N'BillDate_May', N'', N'varchar(15)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (171, N'1616P0CD7A', N'1616P03PMA', N'BillDate_Jun', N'', N'varchar(15)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (172, N'1616P0CEMA', N'1616P03PMA', N'BillDate_Jul', N'', N'varchar(15)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (173, N'1616P0CG1A', N'1616P03PMA', N'BillDate_Aug', N'', N'varchar(15)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (174, N'1616P0CHFA', N'1616P03PMA', N'BillDate_Sep', N'', N'varchar(15)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (175, N'1616P0CJSA', N'1616P03PMA', N'BillDate_Oct', N'', N'varchar(15)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (176, N'1616P0CL3A', N'1616P03PMA', N'BillDate_Nov', N'', N'varchar(15)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (177, N'1616P0CMHA', N'1616P03PMA', N'BillDate_Dec', N'', N'varchar(15)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (178, N'1616P0CNUA', N'1616P03PMA', N'AuditYear', N'', N'varchar(15)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (179, N'1616P0CQ5A', N'1616P03QYA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (180, N'1616P0CRKA', N'1616P03QYA', N'WorkCategory', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (181, N'1616P0CSWA', N'1616P03QYA', N'Reason', N'', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (182, N'1616P0CUAA', N'1616P03S9A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (183, N'1616P0CVQA', N'1616P03S9A', N'CloseDetail', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (184, N'1616P0CWYA', N'1616P03S9A', N'CloseReason_Id', N'', N'varchar(50)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (185, N'1616P0CYCA', N'1616P03S9A', N'WorkStatusMapping_Id', N'', N'int(11)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (186, N'1616P0CZPA', N'1616P03S9A', N'PriceSet_Id', N'', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (187, N'1616P0D13A', N'1616P03S9A', N'Reboot', N'', N'tinyint(1)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (188, N'1616P0D2EA', N'1616P03TLA', N'Id', N'GUID', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (189, N'1616P0D3RA', N'1616P03TLA', N'ContractNo', N'合約編號', N'varchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (190, N'1616P0D52A', N'1616P03TLA', N'ProjectNo', N'專案代碼', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (191, N'1616P0D6GA', N'1616P03TLA', N'ProjectName', N'專案名稱', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (192, N'1616P0D7TA', N'1616P03TLA', N'TaxID', N'統一編號', N'varchar(50)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (193, N'1616P0D97A', N'1616P03TLA', N'CustomerName', N'客戶名稱', N'varchar(50)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (194, N'1616P0DAMA', N'1616P03TLA', N'ContractStart', N'合約有效期-起', N'datetime', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (195, N'1616P0DBYA', N'1616P03TLA', N'ContractEnd', N'合約有效期-迄', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (196, N'1616P0DD9A', N'1616P03TLA', N'Address', N'公司地址', N'varchar(200)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (197, N'1616P0DEPA', N'1616P03TLA', N'Phone', N'電話', N'varchar(20)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (198, N'1616P0DG3A', N'1616P03TLA', N'Email', N'Email', N'varchar(50)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (199, N'1616P0DHHA', N'1616P03TLA', N'ContactPerson', N'客戶聯絡人', N'varchar(50)', 1, N'', 12, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (200, N'1616P0DJUA', N'1616P03TLA', N'Desc', N'描述', N'varchar(500)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (201, N'1616P0DL8A', N'1616P03TLA', N'BusinessContactPerson', N'業務窗口', N'varchar(50)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (202, N'1616P0DMKA', N'1616P03TLA', N'PDM', N'產品PDM', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (203, N'1616P0DNWA', N'1616P03TLA', N'PJM', N'專案PJM', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (204, N'1616P0DQ7A', N'1616P03TLA', N'Status', N'是否啟用', N'tinyint(1)', 0, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (205, N'1616P0DRMA', N'1616P03V0A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (206, N'1616P0DT1A', N'1616P03V0A', N'Dept', N'部門', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (207, N'1616P0DUCA', N'1616P03V0A', N'Team', N'組別', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (208, N'1616P0DVLA', N'1616P03V0A', N'OriginSource', N'轉檔來的OldWeb,手動新增FHNet', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (209, N'1616P0DX0A', N'1616P03WEA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (210, N'1616P0DYEA', N'1616P03WEA', N'Code', N'代碼', N'varchar(2)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (211, N'1616P0DZRA', N'1616P03WEA', N'Name', N'名稱', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (212, N'1616P0E15A', N'1616P03XRA', N'Id', N'Id', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (213, N'1616P0E2KA', N'1616P03XRA', N'Key', N'', N'varchar(100)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (214, N'1616P0E3WA', N'1616P03XRA', N'Values', N'', N'varchar(1000)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (215, N'1616P0E5AA', N'1616P03YZA', N'EmpID', N'', N'varchar(20)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (216, N'1616P0E6MA', N'1616P03YZA', N'Name', N'員工姓名', N'varchar(20)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (217, N'1616P0E81A', N'1616P03YZA', N'ENGName', N'員工英文名稱', N'varchar(30)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (218, N'1616P0E9CA', N'1616P03YZA', N'Phone', N'聯絡電話', N'varchar(20)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (219, N'1616P0EAPA', N'1616P03YZA', N'Email', N'電子信箱', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (220, N'1616P0EC3A', N'1616P03YZA', N'Department_Id', N'', N'varchar(50)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (221, N'1616P0EDEA', N'1616P03YZA', N'PWD', N'密碼', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (222, N'1616P0EEUA', N'1616P03YZA', N'Origin', N'轉檔來的OldWeb,手動新增FHNet', N'varchar(50)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (223, N'1616P0EG8A', N'1616P03YZA', N'PhoneToken', N'', N'varchar(100)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (224, N'1616P0EHKA', N'1616P040DA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (225, N'1616P0EJWA', N'1616P040DA', N'CityCode', N'城市代碼', N'varchar(100)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (226, N'1616P0ELAA', N'1616P040DA', N'CityName', N'城市名稱', N'varchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (227, N'1616P0EMQA', N'1616P040DA', N'AreaCode', N'郵遞區號', N'varchar(100)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (228, N'1616P0EP1A', N'1616P040DA', N'AreaName', N'區域名稱(鄉鎮市區)', N'varchar(100)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (229, N'1616P0EQCA', N'1616P041TA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (230, N'1616P0ERPA', N'1616P041TA', N'EmployeeAreaId', N'', N'varchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (231, N'1616P0ET0A', N'1616P041TA', N'EmployeeId', N'', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (232, N'1616P0EUEA', N'1616P0434A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (233, N'1616P0EVUA', N'1616P0434A', N'WorkClassId', N'', N'varchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (234, N'1616P0EX8A', N'1616P0434A', N'EmployeeId', N'', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (235, N'1616P0EYNA', N'1616P044FA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (236, N'1616P0F02A', N'1616P044FA', N'AreaCode', N'區處碼', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (237, N'1616P0F1DA', N'1616P044FA', N'BusinessAreaCode', N'營業區碼', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (238, N'1616P0F2TA', N'1616P044FA', N'ZipCode', N'郵遞區號', N'varchar(10)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (239, N'1616P0F44A', N'1616P044FA', N'Auditor', N'審核人員', N'varchar(10)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (240, N'1616P0F5FA', N'1616P044FA', N'Director', N'主管人員', N'varchar(10)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (241, N'1616P0F6VA', N'1616P045YA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (242, N'1616P0F86A', N'1616P045YA', N'DcuNo', N'DcuNo', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (243, N'1616P0F9HA', N'1616P045YA', N'CurrentStatus', N'目前狀態', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (244, N'1616P0FAUA', N'1616P045YA', N'CreateDate', N'建立日期', N'datetime', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (245, N'1616P0FC8A', N'1616P0479A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (246, N'1616P0FDNA', N'1616P0479A', N'DistrictId', N'', N'varchar(45)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (247, N'1616P0FEZA', N'1616P0479A', N'BusinessCode', N'營業區代碼', N'varchar(2)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (248, N'1616P0FGAA', N'1616P0479A', N'DcuNo', N'DCU 編號', N'varchar(20)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (249, N'1616P0FHQA', N'1616P0479A', N'ZipCode', N'郵遞區號', N'varchar(10)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (250, N'1616P0FK1A', N'1616P0479A', N'DcuType', N'DCU型號', N'varchar(20)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (251, N'1616P0FLFA', N'1616P0479A', N'IMEI', N'', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (252, N'1616P0FMSA', N'1616P0479A', N'InductionType', N'引電類型', N'varchar(50)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (253, N'1616P0FP3A', N'1616P0479A', N'Address', N'用電地址', N'varchar(200)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (254, N'1616P0FQHA', N'1616P0479A', N'Longitude', N'經度', N'decimal(10,6)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (255, N'1616P0FRUA', N'1616P0479A', N'Latitude', N'緯度', N'decimal(10,6)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (256, N'1616P0FT8A', N'1616P0479A', N'ModuleType', N'型號', N'varchar(15)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (257, N'1616P0FUKA', N'1616P0479A', N'ChannelType', N'頻道組別', N'varchar(2)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (258, N'1616P0FVWA', N'1616P0479A', N'WhiteList', N'白名單', N'tinyint(4)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (259, N'1616P0FXAA', N'1616P0479A', N'LocationType', N'位置類型', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (260, N'1616P0FYMA', N'1616P0479A', N'Floor', N'樓層', N'int(11)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (261, N'1616P0FZYA', N'1616P0479A', N'ConnectionMethod', N'連線方式', N'varchar(50)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (262, N'1616P0G19A', N'1616P0479A', N'SignUp', N'註冊', N'tinyint(4)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (263, N'1616P0G2LA', N'1616P0479A', N'Connect', N'連線', N'tinyint(4)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (264, N'1616P0G40A', N'1616P0479A', N'LastOnlineTime', N'最後上線時間', N'datetime', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (265, N'1616P0G5BA', N'1616P0479A', N'IP', N'IP', N'varchar(15)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (266, N'1616P0G6RA', N'1616P0479A', N'CellID', N'Cell ID', N'varchar(20)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (267, N'1616P0G82A', N'1616P0479A', N'SignalStrength', N'訊號強度', N'int(11)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (268, N'1616P0G9DA', N'1616P0479A', N'DialInformation', N'撥接資訊', N'varchar(20)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (269, N'1616P0GAQA', N'1616P0479A', N'SignalDate', N'訊號強度時間', N'datetime', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (270, N'1616P0GC4A', N'1616P0479A', N'OnlineTimeOn3Day', N'過去3天上線時數', N'int(2)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (271, N'1616P0GDJA', N'1616P0479A', N'Remarks', N'備註', N'varchar(100)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (272, N'1616P0GEVA', N'1616P0479A', N'Remark2', N'備註二', N'varchar(100)', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (273, N'1616P0GG9A', N'1616P0479A', N'Status', N'狀態', N'int(11)', 1, N'', 29, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (274, N'1616P0GHLA', N'1616P0479A', N'MeterNumber', N'電表數', N'int(11)', 1, N'', 30, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (275, N'1616P0GK0A', N'1616P0479A', N'MeterRegistration', N'電表註冊', N'int(11)', 1, N'', 31, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (276, N'1616P0GLBA', N'1616P0479A', N'MeterConnection', N'電表連線', N'int(11)', 1, N'', 32, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (277, N'1616P0GMNA', N'1616P0479A', N'MeterReading', N'電表讀表', N'int(11)', 1, N'', 33, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (278, N'1616P0GP2A', N'1616P0479A', N'AMIContractNo', N'AMI契約編號', N'varchar(50)', 1, N'', 34, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (279, N'1616P0GQDA', N'1616P0479A', N'ModuleNo', N'', N'varchar(50)', 1, N'', 35, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (280, N'1616P0GRQA', N'1616P0479A', N'ModuleIMSI', N'模組IMSI', N'varchar(50)', 1, N'', 36, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (281, N'1616P0GT4A', N'1616P0479A', N'CellIDConvert', N'CellID (換算)', N'varchar(20)', 1, N'', 37, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (282, N'1616P0GUJA', N'1616P0479A', N'LastRegistrationTime', N'最後註冊時間', N'datetime', 1, N'', 38, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (283, N'1616P0GVVA', N'1616P0479A', N'OnlineTimeOn3DayRetrunCount', N'', N'int(11)', 1, N'', 39, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (284, N'1616P0GX6A', N'1616P0479A', N'Event7Day', N'7日事件數', N'int(11)', 1, N'', 40, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (285, N'1616P0GYLA', N'1616P0479A', N'FirmwareVersion', N'韌體版本', N'varchar(50)', 1, N'', 41, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (286, N'1616P0GZXA', N'1616P048PA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (287, N'1616P0H18A', N'1616P048PA', N'DcuNo', N'DCU編號', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (288, N'1616P0H2NA', N'1616P048PA', N'SurveyDate', N'會勘日期', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (289, N'1616P0H3ZA', N'1616P048PA', N'ImgNo', N'圖面座標', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (290, N'1616P0H5DA', N'1616P048PA', N'Latitude', N'緯度', N'decimal(10,6)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (291, N'1616P0H6TA', N'1616P048PA', N'Longitude', N'經度', N'decimal(10,6)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (292, N'1616P0H84A', N'1616P048PA', N'DistrictCode', N'台電區處代碼', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (293, N'1616P0H9JA', N'1616P048PA', N'BusinessCode', N'台電營業區代碼', N'varchar(50)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (294, N'1616P0HAVA', N'1616P048PA', N'Floor', N'??', N'int(11)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (295, N'1616P0HC9A', N'1616P048PA', N'LocationType', N'位置類型', N'varchar(50)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (296, N'1616P0HDLA', N'1616P048PA', N'ConnectionMethod', N'連線方式', N'varchar(50)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (297, N'1616P0HEXA', N'1616P048PA', N'InductionType', N'引電類型', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (298, N'1616P0HGBA', N'1616P048PA', N'Remark', N'備註', N'varchar(150)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (299, N'1616P0HHNA', N'1616P048PA', N'ConnectionOperator', N'連線業者', N'varchar(50)', 1, N'', 14, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (300, N'1616P0HJZA', N'1616P048PA', N'SignalStrength', N'訊號強度', N'int(11)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (301, N'1616P0HMTA', N'1616P048PA', N'ElectricNo1', N'測試點-1電號', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (302, N'1616P0HP4A', N'1616P048PA', N'MacCode1', N'測試點-1 MAC碼', N'varchar(50)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (303, N'1616P0HQMA', N'1616P048PA', N'Latitude1', N'測試點-1 緯度', N'decimal(10,6)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (304, N'1616P0HRYA', N'1616P048PA', N'Longitude1', N'測試點-1 經度', N'decimal(10,6)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (305, N'1616P0HTFA', N'1616P048PA', N'ElectricNo2', N'測試點-2電號', N'varchar(50)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (306, N'1616P0HUVA', N'1616P048PA', N'MacCode2', N'測試點-2 MAC碼', N'varchar(50)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (307, N'1616P0HW6A', N'1616P048PA', N'Latitude2', N'測試點-2 緯度', N'decimal(10,6)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (308, N'1616P0HXHA', N'1616P048PA', N'Longitude2', N'測試點-2 經度', N'decimal(10,6)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (309, N'1616P0HYXA', N'1616P048PA', N'ElectricNo3', N'測試點-3電號', N'varchar(50)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (310, N'1616P0J08A', N'1616P048PA', N'MacCode3', N'測試點-3 MAC碼', N'varchar(50)', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (311, N'1616P0J1NA', N'1616P048PA', N'Latitude3', N'測試點-3 緯度', N'decimal(10,6)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (312, N'1616P0J32A', N'1616P048PA', N'Longitude3', N'測試點-3 經度', N'decimal(10,6)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (313, N'1616P0J4DA', N'1616P048PA', N'ElectricNo4', N'測試點-4電號', N'varchar(50)', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (314, N'1616P0J5QA', N'1616P048PA', N'MacCode4', N'測試點-4 MAC碼', N'varchar(50)', 1, N'', 29, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (315, N'1616P0J74A', N'1616P048PA', N'Latitude4', N'測試點-4 緯度', N'decimal(10,6)', 1, N'', 30, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (316, N'1616P0J8FA', N'1616P048PA', N'Longitude4', N'測試點-4 經度', N'decimal(10,6)', 1, N'', 31, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (317, N'1616P0J9SA', N'1616P048PA', N'ElectricNo5', N'測試點-5電號', N'varchar(50)', 1, N'', 32, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (318, N'1616P0JB6A', N'1616P048PA', N'MacCode5', N'測試點-5 MAC碼', N'varchar(50)', 1, N'', 33, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (319, N'1616P0JCLA', N'1616P048PA', N'Latitude5', N'測試點-5 緯度', N'decimal(10,6)', 1, N'', 34, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (320, N'1616P0JDXA', N'1616P048PA', N'Longitude5', N'測試點-5 經度', N'decimal(10,6)', 1, N'', 35, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (321, N'1616P0JF8A', N'1616P048PA', N'ElectricNo6', N'測試點-6電號', N'varchar(50)', 1, N'', 36, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (322, N'1616P0JGNA', N'1616P048PA', N'MacCode6', N'測試點-6 MAC碼', N'varchar(50)', 1, N'', 37, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (323, N'1616P0JHZA', N'1616P048PA', N'Latitude6', N'測試點-6 緯度', N'decimal(10,6)', 1, N'', 38, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (324, N'1616P0JKDA', N'1616P048PA', N'Longitude6', N'測試點-6 經度', N'decimal(10,6)', 1, N'', 39, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (325, N'1616P0JLQA', N'1616P048PA', N'WorkNo', N'工單號碼', N'varchar(50)', 1, N'', 40, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (326, N'1616P0JN1A', N'1616P048PA', N'WorkStatus', N'工作狀態', N'int(11)', 1, N'', 41, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (327, N'1616P0JPFA', N'1616P048PA', N'WorkEmp', N'工程人員', N'varchar(50)', 1, N'', 42, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (328, N'1616P0JQVA', N'1616P048PA', N'VerifyEmp', N'審核人員', N'varchar(50)', 1, N'', 43, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (329, N'1616P0JS6A', N'1616P048PA', N'UnitManager', N'主管單位', N'varchar(50)', 1, N'', 44, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (330, N'1616P0JTLA', N'1616P048PA', N'City', N'縣市', N'varchar(50)', 1, N'', 45, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (331, N'1616P0JV0A', N'1616P048PA', N'Area', N'區域', N'varchar(50)', 1, N'', 46, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (332, N'1616P0JWEA', N'1616P048PA', N'ZipCode', N'郵遞區號', N'varchar(50)', 1, N'', 47, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (333, N'1616P0JXRA', N'1616P048PA', N'EmployeeAreaId', N'', N'varchar(50)', 1, N'', 48, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (334, N'1616P0JZ2A', N'1616P048PA', N'WorkCategoryId', N'', N'varchar(50)', 1, N'', 49, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (335, N'1616P0K0DA', N'1616P048PA', N'CreateDate', N'', N'datetime', 1, N'', 50, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (336, N'1616P0K1TA', N'1616P048PA', N'Img1', N'', N'varchar(100)', 1, N'', 51, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (337, N'1616P0K34A', N'1616P048PA', N'Img2', N'', N'varchar(100)', 1, N'', 52, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (338, N'1616P0K4FA', N'1616P048PA', N'Img3', N'', N'varchar(100)', 1, N'', 53, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (339, N'1616P0K5SA', N'1616P048PA', N'Img4', N'', N'varchar(100)', 1, N'', 54, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (340, N'1616P0K76A', N'1616P048PA', N'Img5', N'', N'varchar(100)', 1, N'', 55, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (341, N'1616P0K8LA', N'1616P048PA', N'Img6', N'', N'varchar(100)', 1, N'', 56, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (342, N'1616P0K9XA', N'1616P048PA', N'Img7', N'', N'varchar(100)', 1, N'', 57, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (343, N'1616P0KB8A', N'1616P048PA', N'Img8', N'', N'varchar(100)', 1, N'', 58, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (344, N'1616P0KCKA', N'1616P048PA', N'Img9', N'', N'varchar(100)', 1, N'', 59, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (345, N'1616P0KDWA', N'1616P048PA', N'Img10', N'', N'varchar(100)', 1, N'', 60, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (346, N'1616P0KFAA', N'1616P048PA', N'RelatedId', N'', N'varchar(100)', 1, N'', 61, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (347, N'1616P0KGMA', N'1616P048PA', N'Resistance', N'', N'tinyint(1)', 1, N'', 62, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (348, N'1616P0KHYA', N'1616P048PA', N'ElectricNo7', N'', N'varchar(50)', 1, N'', 63, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (349, N'1616P0KKCA', N'1616P048PA', N'MacCode7', N'', N'varchar(50)', 1, N'', 64, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (350, N'1616P0KLPA', N'1616P048PA', N'Latitude7', N'', N'decimal(10,6)', 1, N'', 65, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (351, N'1616P0KN3A', N'1616P048PA', N'Longitude7', N'', N'decimal(10,6)', 1, N'', 66, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (352, N'1616P0KPEA', N'1616P048PA', N'ElectricNo8', N'', N'varchar(50)', 1, N'', 67, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (353, N'1616P0KQUA', N'1616P048PA', N'MacCode8', N'', N'varchar(50)', 1, N'', 68, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (354, N'1616P0KS5A', N'1616P048PA', N'Latitude8', N'', N'decimal(10,6)', 1, N'', 69, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (355, N'1616P0KTKA', N'1616P048PA', N'Longitude8', N'', N'decimal(10,6)', 1, N'', 70, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (356, N'1616P0KUZA', N'1616P048PA', N'Img11', N'', N'varchar(100)', 1, N'', 71, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (357, N'1616P0KWAA', N'1616P048PA', N'Img12', N'', N'varchar(100)', 1, N'', 72, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (358, N'1616P0KXQA', N'1616P048PA', N'UploadSpeed', N'', N'decimal(10,3)', 1, N'', 73, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (359, N'1616P0KZ1A', N'1616P048PA', N'FETNetSignalStrength', N'', N'int(11)', 1, N'', 74, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (360, N'1616P0L0FA', N'1616P048PA', N'FETNetUploadSpeed', N'', N'decimal(10,3)', 1, N'', 75, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (361, N'1616P0L1SA', N'1616P048PA', N'Img13', N'', N'varchar(100)', 1, N'', 76, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (362, N'1616P0L33A', N'1616P048PA', N'Img14', N'', N'varchar(100)', 1, N'', 77, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (363, N'1616P0L4HA', N'1616P048PA', N'Img15', N'', N'varchar(100)', 1, N'', 78, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (364, N'1616P0L5UA', N'1616P048PA', N'AuditorEmp', N'', N'varchar(50)', 1, N'', 79, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (365, N'1616P0L78A', N'1616P04A0A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (366, N'1616P0L8KA', N'1616P04A0A', N'ElectricNo', N'電號', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (367, N'1616P0L9WA', N'1616P04A0A', N'ElectricMeterNo', N'表號', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (368, N'1616P0LBAA', N'1616P04A0A', N'CurrentStatus', N'目前狀態', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (369, N'1616P0LCMA', N'1616P04A0A', N'CreateDate', N'建立日期', N'datetime', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (370, N'1616P0LDYA', N'1616P04BBA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (371, N'1616P0LFCA', N'1616P04BBA', N'DistrictId', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (372, N'1616P0LGPA', N'1616P04BBA', N'BusinessCode', N'營業區代碼', N'varchar(2)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (373, N'1616P0LJ3A', N'1616P04BBA', N'ElectricNo', N'電號', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (374, N'1616P0LKEA', N'1616P04BBA', N'ElectricMeterNo', N'表號', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (375, N'1616P0LLUA', N'1616P04BBA', N'ElectricType', N'表型', N'varchar(50)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (376, N'1616P0LN5A', N'1616P04BBA', N'ElectricMeterType', N'類別', N'varchar(20)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (377, N'1616P0LPKA', N'1616P04BBA', N'Address', N'地址', N'varchar(200)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (378, N'1616P0LQWA', N'1616P04BBA', N'ZipCode', N'郵遞區號', N'varchar(10)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (379, N'1616P0LSAA', N'1616P04BBA', N'Latitude', N'緯度', N'decimal(10,6)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (380, N'1616P0LTMA', N'1616P04BBA', N'Longitude', N'經度', N'decimal(10,6)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (381, N'1616P0LV1A', N'1616P04BBA', N'LocationType', N'位置類型', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (382, N'1616P0LWCA', N'1616P04BBA', N'Floor', N'樓層', N'int(11)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (383, N'1616P0LXPA', N'1616P04BBA', N'ModuleType', N'模組類型', N'varchar(50)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (384, N'1616P0LZ0A', N'1616P04BBA', N'ConnectionMethod', N'通訊技術', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (385, N'1616P0M0BA', N'1616P04BBA', N'ModuleNo', N'模組序號', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (386, N'1616P0M1RA', N'1616P04BBA', N'ModuleIMSI', N'FAN IMSI', N'varchar(50)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (387, N'1616P0M35A', N'1616P04BBA', N'ModuleIMEI', N'FAN MAC/IMEI', N'varchar(50)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (388, N'1616P0M4GA', N'1616P04BBA', N'FirmwareVersion', N'FAN韌體版本', N'varchar(50)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (389, N'1616P0M5TA', N'1616P04BBA', N'DcuNo', N'DCU編號', N'varchar(20)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (390, N'1616P0M77A', N'1616P04BBA', N'DcuNumber', N'DCU序號', N'varchar(20)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (391, N'1616P0M8JA', N'1616P04BBA', N'SignUp', N'註冊', N'tinyint(4)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (392, N'1616P0M9YA', N'1616P04BBA', N'Connect', N'連線', N'tinyint(4)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (393, N'1616P0MBCA', N'1616P04BBA', N'OnlineDcuNo', N'上線DCU序號', N'varchar(20)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (394, N'1616P0MCPA', N'1616P04BBA', N'LastOnlineDateTime', N'最後上線時間', N'datetime', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (395, N'1616P0ME3A', N'1616P04BBA', N'MeterLP', N'最後LP時間', N'datetime', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (396, N'1616P0MFEA', N'1616P04BBA', N'LastLPIndex', N'最後LP index', N'varchar(20)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (397, N'1616P0MGRA', N'1616P04BBA', N'LPkWh', N'最後LP kWh', N'varchar(50)', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (398, N'1616P0MJ5A', N'1616P04BBA', N'MeterATL', N'最後ALT時間', N'datetime', 1, N'', 29, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (399, N'1616P0MKKA', N'1616P04BBA', N'MeterMN', N'最後MN時間', N'datetime', 1, N'', 30, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (400, N'1616P0MLZA', N'1616P04BBA', N'LastMNIndex', N'最後MN index', N'varchar(50)', 1, N'', 31, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (401, N'1616P0MNAA', N'1616P04BBA', N'LastMNkWh', N'最後MN kWh', N'varchar(50)', 1, N'', 32, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (402, N'1616P0MPQA', N'1616P04BBA', N'LastDRRDatetime', N'最後DRR時間', N'datetime', 1, N'', 33, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (403, N'1616P0MR1A', N'1616P04BBA', N'Event7Day', N'7日事件數', N'int(11)', 1, N'', 34, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (404, N'1616P0MSFA', N'1616P04BBA', N'KeyUpdateDateTime', N'金鑰更新時間', N'datetime', 1, N'', 35, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (405, N'1616P0MTSA', N'1616P04BBA', N'IP', N'IP', N'varchar(15)', 1, N'', 36, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (406, N'1616P0MV6A', N'1616P04BBA', N'CellID', N'Cell ID', N'varchar(20)', 1, N'', 37, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (407, N'1616P0MWHA', N'1616P04BBA', N'CellIDConvert', N'CellID (換算)', N'varchar(20)', 1, N'', 38, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (408, N'1616P0MXXA', N'1616P04BBA', N'SignalStrength', N'訊號強度', N'int(11)', 1, N'', 39, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (409, N'1616P0MZ8A', N'1616P04BBA', N'SignalDate', N'訊號強度時間', N'datetime', 1, N'', 40, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (410, N'1616P0N0NA', N'1616P04BBA', N'PT', N'PT', N'int(11)', 1, N'', 41, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (411, N'1616P0N1ZA', N'1616P04BBA', N'CT', N'CT', N'int(11)', 1, N'', 42, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (412, N'1616P0N3DA', N'1616P04BBA', N'TOUID', N'TOU ID', N'int(11)', 1, N'', 43, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (413, N'1616P0N4QA', N'1616P04BBA', N'MeterFirmwareVersion', N'電表韌體版本', N'varchar(50)', 1, N'', 44, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (414, N'1616P0N64A', N'1616P04BBA', N'OnlineTimeOn3Day', N'過去3天上線時數', N'int(2)', 1, N'', 45, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (415, N'1616P0N7FA', N'1616P04BBA', N'OnlineTimeOn3DayRetrunCount', N'', N'int(11)', 1, N'', 46, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (416, N'1616P0N8SA', N'1616P04BBA', N'Status', N'狀態', N'int(11)', 1, N'', 47, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (417, N'1616P0NA6A', N'1616P04BBA', N'Remarks', N'備註', N'varchar(100)', 1, N'', 48, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (418, N'1616P0NBLA', N'1616P04BBA', N'Remarks2', N'備註二', N'varchar(100)', 1, N'', 49, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (419, N'1616P0ND0A', N'1616P04BBA', N'InstallDateTime', N'安裝時間', N'datetime', 1, N'', 50, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (420, N'1616P0NEBA', N'1616P04BBA', N'InstallMeter', N'安裝抄表', N'int(11)', 1, N'', 51, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (421, N'1616P0NFRA', N'1616P04BBA', N'AMIContractNo', N'AMI契約編號', N'varchar(50)', 1, N'', 52, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (422, N'1616P0NH2A', N'1616P04BBA', N'ElectricContract', N'用電契約', N'varchar(50)', 1, N'', 53, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (423, N'1616P0NJGA', N'1616P04BBA', N'LastRegistrationTime', N'最後註冊時間', N'datetime', 1, N'', 54, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (424, N'1616P0NKWA', N'1616P04BBA', N'MeterDDR', N'讀表DRR', N'datetime', 1, N'', 55, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (425, N'1616P0NM7A', N'1616P04CRA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (426, N'1616P0NNJA', N'1616P04CRA', N'ElectricNo', N'電號', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (427, N'1616P0NPVA', N'1616P04CRA', N'UserName', N'用戶名稱', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (428, N'1616P0NR9A', N'1616P04CRA', N'ElectricZipCode', N'用電郵遞區號', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (429, N'1616P0NSLA', N'1616P04CRA', N'ElectricAddress', N'用電地址', N'varchar(150)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (430, N'1616P0NU0A', N'1616P04CRA', N'ModuleNo', N'模組型號', N'varchar(50)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (431, N'1616P0NVEA', N'1616P04CRA', N'DcuNo', N'DCU編號', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (432, N'1616P0NWRA', N'1616P04CRA', N'SignalStrength', N'訊號強度', N'int(11)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (433, N'1616P0NY5A', N'1616P04CRA', N'UploadSpeed', N'上傳速度', N'decimal(10,3)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (434, N'1616P0NZGA', N'1616P04CRA', N'Latitude', N'緯度', N'decimal(10,6)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (435, N'1616P0P0WA', N'1616P04CRA', N'Longitude', N'經度', N'decimal(10,6)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (436, N'1616P0P2AA', N'1616P04CRA', N'SurveyDate', N'會勘日期', N'datetime', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (437, N'1616P0P3MA', N'1616P04CRA', N'MeterFloor', N'電表樓層', N'int(11)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (438, N'1616P0P4YA', N'1616P04CRA', N'LocationType', N'位置類型', N'varchar(50)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (439, N'1616P0P6CA', N'1616P04CRA', N'Remark', N'備註', N'varchar(150)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (440, N'1616P0P7SA', N'1616P04CRA', N'WorkNo', N'工單號碼', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (441, N'1616P0P93A', N'1616P04CRA', N'WorkStatus', N'工作狀態', N'int(11)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (442, N'1616P0PAEA', N'1616P04CRA', N'WorkEmp', N'工程人員', N'varchar(50)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (443, N'1616P0PBRA', N'1616P04CRA', N'VerifyEmp', N'審核人員', N'varchar(50)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (444, N'1616P0PD5A', N'1616P04CRA', N'UnitManager', N'主管單位', N'varchar(50)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (445, N'1616P0PEKA', N'1616P04CRA', N'City', N'??', N'varchar(50)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (446, N'1616P0PFWA', N'1616P04CRA', N'Area', N'??', N'varchar(50)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (447, N'1616P0PHAA', N'1616P04CRA', N'EmployeeAreaId', N'', N'varchar(50)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (448, N'1616P0PJQA', N'1616P04CRA', N'WorkCategoryId', N'', N'varchar(50)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (449, N'1616P0PL1A', N'1616P04CRA', N'CreateDate', N'', N'datetime', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (450, N'1616P0PMFA', N'1616P04CRA', N'DistrictCode', N'', N'varchar(50)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (451, N'1616P0PNSA', N'1616P04CRA', N'Img1', N'', N'varchar(100)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (452, N'1616P0PQ3A', N'1616P04CRA', N'Img2', N'', N'varchar(100)', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (453, N'1616P0PRHA', N'1616P04CRA', N'Img3', N'', N'varchar(100)', 1, N'', 29, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (454, N'1616P0PSUA', N'1616P04CRA', N'Img4', N'', N'varchar(100)', 1, N'', 30, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (455, N'1616P0PU8A', N'1616P04CRA', N'Img5', N'', N'varchar(100)', 1, N'', 31, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (456, N'1616P0PVKA', N'1616P04CRA', N'Img6', N'', N'varchar(100)', 1, N'', 32, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (457, N'1616P0PWZA', N'1616P04CRA', N'RelatedId', N'', N'varchar(100)', 1, N'', 33, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (458, N'1616P0PYDA', N'1616P04CRA', N'Resistance', N'', N'tinyint(1)', 1, N'', 34, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (459, N'1616P0PZTA', N'1616P04CRA', N'ConnectionOperator', N'連線業者', N'varchar(50)', 1, N'', 35, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (460, N'1616P0Q14A', N'1616P04CRA', N'AmmeterCategory', N'電表類別', N'varchar(50)', 1, N'', 36, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (461, N'1616P0Q2FA', N'1616P04CRA', N'CommunityName', N'社區大樓名稱', N'varchar(50)', 1, N'', 37, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (462, N'1616P0Q3VA', N'1616P04CRA', N'ImprovedSignal', N'需改善訊號', N'tinyint(1)', 0, N'', 38, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (463, N'1616P0Q5CA', N'1616P04CRA', N'FETNetSignalStrength', N'', N'int(11)', 1, N'', 39, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (464, N'1616P0Q6SA', N'1616P04CRA', N'Img7', N'', N'varchar(100)', 1, N'', 40, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (465, N'1616P0Q83A', N'1616P04CRA', N'AuditorEmp', N'', N'varchar(50)', 1, N'', 41, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (466, N'1616P0Q9HA', N'1616P04E2A', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (467, N'1616P0QAUA', N'1616P04E2A', N'DateTime', N'發生時間', N'datetime', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (468, N'1616P0QC5A', N'1616P04E2A', N'EmployeeId', N'登入帳號', N'varchar(45)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (469, N'1616P0QDGA', N'1616P04E2A', N'Environment', N'環境 (Web、App)', N'varchar(45)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (470, N'1616P0QETA', N'1616P04E2A', N'ExceptionPath', N'例外發生位置', N'varchar(45)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (471, N'1616P0QG4A', N'1616P04E2A', N'ExceptionMessageJson', N'例外訊息Json', N'varchar(1000)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (472, N'1616P0QHJA', N'1616P04FAA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (473, N'1616P0QJVA', N'1616P04FAA', N'IMGNo', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (474, N'1616P0QL9A', N'1616P04FAA', N'StationNo', N'', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (475, N'1616P0QMLA', N'1616P04FAA', N'PhoneNo', N'', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (476, N'1616P0QP0A', N'1616P04FAA', N'Latitude', N'', N'decimal(10,6)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (477, N'1616P0QQBA', N'1616P04FAA', N'Longitude', N'', N'decimal(10,6)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (478, N'1616P0QRRA', N'1616P04FAA', N'PoleNo', N'', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (479, N'1616P0QT2A', N'1616P04FAA', N'City', N'', N'int(11)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (480, N'1616P0QUDA', N'1616P04FAA', N'ZipCode', N'', N'varchar(10)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (481, N'1616P0QVQA', N'1616P04FAA', N'IMEI', N'', N'varchar(50)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (482, N'1616P0QX1A', N'1616P04FAA', N'Address', N'', N'varchar(100)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (483, N'1616P0QYFA', N'1616P04FAA', N'Town', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (484, N'1616P0QZSA', N'1616P04FAA', N'Vill', N'', N'varchar(50)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (485, N'1616P0R13A', N'1616P04GQA', N'LoginId', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (486, N'1616P0R2EA', N'1616P04GQA', N'EmpId', N'', N'varchar(20)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (487, N'1616P0R3UA', N'1616P04GQA', N'LoginDate', N'', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (488, N'1616P0R55A', N'1616P04GQA', N'LoginOutDate', N'', N'datetime', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (489, N'1616P0R6GA', N'1616P04GQA', N'LoginType', N'', N'varchar(45)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (490, N'1616P0R7TA', N'1616P04J4A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (491, N'1616P0R94A', N'1616P04J4A', N'OrderId', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (492, N'1616P0RAJA', N'1616P04J4A', N'ImgSrc', N'', N'varchar(100)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (493, N'1616P0RBYA', N'1616P04KFA', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (494, N'1616P0RD9A', N'1616P04KFA', N'WorkOrderId', N'', N'varchar(36)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (495, N'1616P0RELA', N'1616P04KFA', N'DCUSerialNo', N'DCU序號', N'varchar(20)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (496, N'1616P0RFXA', N'1616P04KFA', N'InstallDate', N'', N'varchar(16)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (497, N'1616P0RHBA', N'1616P04KFA', N'InstallTime', N'', N'varchar(16)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (498, N'1616P0RJNA', N'1616P04KFA', N'Floor', N'', N'int(11)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (499, N'1616P0RL2A', N'1616P04KFA', N'LocationType', N'', N'varchar(10)', 1, N'', 7, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (500, N'1616P0RMDA', N'1616P04KFA', N'ConnectionType', N'連線方式', N'varchar(10)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (501, N'1616P0RNQA', N'1616P04KFA', N'DCUPowerSource', N'DCU引電類型', N'varchar(10)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (502, N'1616P0RQ1A', N'1616P04KFA', N'Desc', N'', N'varchar(100)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (503, N'1616P0RRCA', N'1616P04KFA', N'CloseReasonDetailId', N'', N'varchar(50)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (504, N'1616P0RSPA', N'1616P04KFA', N'CloseReason_Id', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (505, N'1616P0RU0A', N'1616P04KFA', N'Img1', N'', N'varchar(100)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (506, N'1616P0RVEA', N'1616P04KFA', N'Img2', N'', N'varchar(100)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (507, N'1616P0RWRA', N'1616P04KFA', N'Img3', N'', N'varchar(100)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (508, N'1616P0RY5A', N'1616P04KFA', N'Img4', N'', N'varchar(100)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (509, N'1616P0RZKA', N'1616P04KFA', N'Img5', N'', N'varchar(100)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (510, N'1616P0S0WA', N'1616P04LVA', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (511, N'1616P0S2AA', N'1616P04LVA', N'WorkOrderId', N'', N'varchar(36)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (512, N'1616P0S3MA', N'1616P04LVA', N'IMEI_MAC', N'', N'varchar(16)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (513, N'1616P0S51A', N'1616P04LVA', N'Lat', N'', N'decimal(10,6)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (514, N'1616P0S6FA', N'1616P04LVA', N'Lon', N'', N'decimal(10,6)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (515, N'1616P0S7SA', N'1616P04LVA', N'InstallDate', N'', N'varchar(16)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (516, N'1616P0S93A', N'1616P04LVA', N'InstallTime', N'', N'varchar(16)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (517, N'1616P0SAHA', N'1616P04LVA', N'Degree', N'', N'int(11)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (518, N'1616P0SBXA', N'1616P04LVA', N'Floor', N'', N'int(11)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (519, N'1616P0SD8A', N'1616P04LVA', N'LocationType', N'', N'varchar(10)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (520, N'1616P0SENA', N'1616P04LVA', N'Desc', N'', N'varchar(50)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (521, N'1616P0SFZA', N'1616P04LVA', N'CloseReasonDetailId', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (522, N'1616P0SHDA', N'1616P04LVA', N'CloseReason_Id', N'', N'varchar(50)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (523, N'1616P0SJTA', N'1616P04LVA', N'OldSealNo1', N'', N'varchar(16)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (524, N'1616P0SL7A', N'1616P04LVA', N'OldSealNo2', N'', N'varchar(16)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (525, N'1616P0SMJA', N'1616P04LVA', N'OldSealNo3', N'', N'varchar(16)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (526, N'1616P0SNVA', N'1616P04LVA', N'NewSealNo1', N'', N'varchar(16)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (527, N'1616P0SQ6A', N'1616P04LVA', N'NewSealNo2', N'', N'varchar(16)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (528, N'1616P0SRHA', N'1616P04LVA', N'NewSealNo3', N'', N'varchar(16)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (529, N'1616P0SSXA', N'1616P04LVA', N'Img1', N'', N'varchar(100)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (530, N'1616P0SUBA', N'1616P04LVA', N'Img2', N'', N'varchar(100)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (531, N'1616P0SVNA', N'1616P04LVA', N'Img3', N'', N'varchar(100)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (532, N'1616P0SX2A', N'1616P04LVA', N'Img4', N'', N'varchar(100)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (533, N'1616P0SYDA', N'1616P04LVA', N'Img5', N'', N'varchar(100)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (534, N'1616P0SZQA', N'1616P04LVA', N'Img6', N'', N'varchar(100)', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (535, N'1616P0T11A', N'1616P04N6A', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (536, N'1616P0T2FA', N'1616P04N6A', N'WorkOrderId', N'', N'varchar(36)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (537, N'1616P0T3SA', N'1616P04N6A', N'DCUSerialNo', N'DCU序號', N'varchar(20)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (538, N'1616P0T56A', N'1616P04N6A', N'Floor', N'', N'int(11)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (539, N'1616P0T6HA', N'1616P04N6A', N'LocationType', N'', N'varchar(10)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (540, N'1616P0T7XA', N'1616P04N6A', N'ConnectionType', N'連線方式', N'varchar(10)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (541, N'1616P0T98A', N'1616P04N6A', N'DCUPowerSource', N'DCU引電類型', N'varchar(10)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (542, N'1616P0TAKA', N'1616P04N6A', N'Desc', N'', N'varchar(100)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (543, N'1616P0TBWA', N'1616P04N6A', N'ObstacleStatus', N'障礙狀態', N'varchar(50)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (544, N'1616P0TDAA', N'1616P04N6A', N'CloseReasonDetailId', N'', N'varchar(50)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (545, N'1616P0TEMA', N'1616P04N6A', N'CloseReason_Id', N'', N'varchar(50)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (546, N'1616P0TG1A', N'1616P04N6A', N'SendTime', N'', N'datetime', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (547, N'1616P0THCA', N'1616P04N6A', N'CloseTime', N'', N'datetime', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (548, N'1616P0TJPA', N'1616P04N6A', N'Img1', N'', N'varchar(100)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (549, N'1616P0TL3A', N'1616P04N6A', N'Img2', N'', N'varchar(100)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (550, N'1616P0TMEA', N'1616P04N6A', N'Img3', N'', N'varchar(100)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (551, N'1616P0TNUA', N'1616P04N6A', N'Img4', N'', N'varchar(100)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (552, N'1616P0TQ5A', N'1616P04N6A', N'FETNetSignalStrength', N'', N'int(11)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (553, N'1616P0TRKA', N'1616P04N6A', N'SignalStrength', N'訊號強度', N'int(11)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (554, N'1616P0TSWA', N'1616P04PLA', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (555, N'1616P0TU7A', N'1616P04PLA', N'WorkOrderId', N'', N'varchar(36)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (556, N'1616P0TVMA', N'1616P04PLA', N'IMEI_MAC', N'', N'varchar(16)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (557, N'1616P0TX1A', N'1616P04PLA', N'ElectricMeterType', N'', N'varchar(15)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (558, N'1616P0TY9A', N'1616P04PLA', N'Floor', N'', N'int(11)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (559, N'1616P0TZLA', N'1616P04PLA', N'LocationType', N'', N'varchar(10)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (560, N'1616P0U10A', N'1616P04PLA', N'Desc', N'', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (561, N'1616P0U2EA', N'1616P04PLA', N'CloseReasonDetailId', N'', N'varchar(50)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (562, N'1616P0U3RA', N'1616P04PLA', N'CloseReason_Id', N'', N'varchar(50)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (563, N'1616P0U55A', N'1616P04PLA', N'OldSealNo1', N'', N'varchar(16)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (564, N'1616P0U6KA', N'1616P04PLA', N'OldSealNo2', N'', N'varchar(16)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (565, N'1616P0U7WA', N'1616P04PLA', N'OldSealNo3', N'', N'varchar(16)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (566, N'1616P0U9AA', N'1616P04PLA', N'NewSealNo1', N'', N'varchar(16)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (567, N'1616P0UAMA', N'1616P04PLA', N'NewSealNo2', N'', N'varchar(16)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (568, N'1616P0UC1A', N'1616P04PLA', N'NewSealNo3', N'', N'varchar(16)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (569, N'1616P0UD9A', N'1616P04PLA', N'Img1', N'', N'varchar(100)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (570, N'1616P0UELA', N'1616P04PLA', N'Img2', N'', N'varchar(100)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (571, N'1616P0UG0A', N'1616P04PLA', N'Img3', N'', N'varchar(100)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (572, N'1616P0UHBA', N'1616P04PLA', N'Img4', N'', N'varchar(100)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (573, N'1616P0UJRA', N'1616P04PLA', N'BillDate_Recently', N'', N'varchar(16)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (574, N'1616P0UL2A', N'1616P04PLA', N'SendTime', N'', N'datetime', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (575, N'1616P0UMGA', N'1616P04PLA', N'CloseTime', N'', N'datetime', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (576, N'1616P0UNTA', N'1616P04PLA', N'FETNetSignalStrength', N'', N'int(11)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (577, N'1616P0UQ7A', N'1616P04PLA', N'SignalStrength', N'訊號強度', N'int(11)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (578, N'1616P0URJA', N'1616P04QXA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (579, N'1616P0USYA', N'1616P04QXA', N'PriceItem', N'', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (580, N'1616P0UU9A', N'1616P04S8A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (581, N'1616P0UVLA', N'1616P04S8A', N'MasterID', N'', N'varchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (582, N'1616P0UWXA', N'1616P04S8A', N'City', N'', N'int(11)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (583, N'1616P0UYBA', N'1616P04S8A', N'PriceAmount', N'', N'int(11)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (584, N'1616P0UZNA', N'1616P04TNA', N'EmpID', N'', N'varchar(20)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (585, N'1616P0V12A', N'1616P04TNA', N'ScreeningDate', N'', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (586, N'1616P0V2DA', N'1616P04TNA', N'ScreeningResult', N'', N'varchar(1)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (587, N'1616P0V3QA', N'1616P04TNA', N'UploadImage1', N'', N'varchar(100)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (588, N'1616P0V51A', N'1616P04TNA', N'UploadImage2', N'', N'varchar(100)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (589, N'1616P0V6FA', N'1616P04TNA', N'UploadImage3', N'', N'varchar(100)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (590, N'1616P0V7SA', N'1616P04TNA', N'Remark', N'', N'varchar(150)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (591, N'1616P0V96A', N'1616P04TNA', N'CreateTime', N'', N'datetime', 1, N'CURRENT_TIMESTAMP', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (592, N'1616P0VALA', N'1616P04V2A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (593, N'1616P0VBXA', N'1616P04V2A', N'Status', N'', N'tinyint(1)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (594, N'1616P0VDBA', N'1616P04V2A', N'LastUpload', N'', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (595, N'1616P0VENA', N'1616P04V2A', N'PowerCategory', N'', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (596, N'1616P0VFZA', N'1616P04V2A', N'IMEI', N'', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (597, N'1616P0VHAA', N'1616P04V2A', N'IMEIUpload', N'', N'datetime', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (598, N'1616P0VJQA', N'1616P04V2A', N'PM10', N'', N'decimal(10,0)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (599, N'1616P0VL1A', N'1616P04V2A', N'PM25', N'', N'decimal(10,0)', 1, N'', 8, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (600, N'1616P0VMFA', N'1616P04V2A', N'VOC', N'', N'int(11)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (601, N'1616P0VNSA', N'1616P04V2A', N'Temperature', N'', N'decimal(10,0)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (602, N'1616P0VQ3A', N'1616P04V2A', N'Rh', N'', N'decimal(10,0)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (603, N'1616P0VRHA', N'1616P04V2A', N'RSSI', N'', N'tinyint(4)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (604, N'1616P0VSUA', N'1616P04V2A', N'Voltage1', N'', N'int(11)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (605, N'1616P0VU8A', N'1616P04V2A', N'Voltage2', N'', N'int(11)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (606, N'1616P0VVKA', N'1616P04V2A', N'Current1', N'', N'int(11)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (607, N'1616P0VWZA', N'1616P04V2A', N'Current2', N'', N'int(11)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (608, N'1616P0VYAA', N'1616P04V2A', N'Noted', N'', N'varchar(200)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (609, N'1616P0VZQA', N'1616P04V2A', N'InspectPeriod', N'巡檢週期', N'int(11)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (610, N'1616P0W11A', N'1616P04V2A', N'DisableFlag', N'是否停用', N'tinyint(1)', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (611, N'1616P0W2CA', N'1616P04V2A', N'Location_Id', N'', N'varchar(50)', 0, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (612, N'1616P0W3SA', N'1616P04WDA', N'ID', N'', N'int(11)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (613, N'1616P0W53A', N'1616P04WDA', N'Testcol', N'', N'float(10,6)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (614, N'1616P0W6EA', N'1616P04XTA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (615, N'1616P0W7RA', N'1616P04XTA', N'Category', N'', N'varchar(20)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (616, N'1616P0W95A', N'1616P04XTA', N'Class', N'', N'varchar(20)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (617, N'1616P0WAGA', N'1616P04Z4A', N'Id', N'guid', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (618, N'1616P0WBTA', N'1616P04Z4A', N'Reason', N'原因', N'varchar(100)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (619, N'1616P0WD7A', N'1616P04Z4A', N'Definition', N'定義', N'varchar(100)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (620, N'1616P0WEMA', N'1616P050FA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (621, N'1616P0WFYA', N'1616P050FA', N'WorkNo', N'', N'varchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (622, N'1616P0WH9A', N'1616P050FA', N'Address', N'', N'varchar(100)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (623, N'1616P0WJPA', N'1616P050FA', N'Latitude', N'', N'decimal(10,6)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (624, N'1616P0WL0A', N'1616P050FA', N'Longitude', N'', N'decimal(10,6)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (625, N'1616P0WMEA', N'1616P050FA', N'WorkEmp', N'', N'varchar(50)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (626, N'1616P0WNRA', N'1616P050FA', N'VerifyEmp', N'', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (627, N'1616P0WQ2A', N'1616P050FA', N'CheckEmp', N'', N'varchar(50)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (628, N'1616P0WRGA', N'1616P050FA', N'UnitManager', N'', N'varchar(50)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (629, N'1616P0WSTA', N'1616P050FA', N'Noted', N'', N'varchar(50)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (630, N'1616P0WU7A', N'1616P050FA', N'WorkClass_Id', N'', N'varchar(50)', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (631, N'1616P0WVJA', N'1616P050FA', N'PriceSet_Id', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (632, N'1616P0WWYA', N'1616P050FA', N'WorkStatusMapping_Id', N'', N'int(11)', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (633, N'1616P0WYCA', N'1616P050FA', N'CreateDate', N'', N'datetime', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (634, N'1616P0WZPA', N'1616P050FA', N'Location_Id', N'', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (635, N'1616P0X13A', N'1616P050FA', N'IMEI', N'當下設備IMEI', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (636, N'1616P0X2EA', N'1616P050FA', N'WorkDispatch_Id', N'', N'varchar(50)', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (637, N'1616P0X3UA', N'1616P050FA', N'City', N'', N'int(11)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (638, N'1616P0X55A', N'1616P051VA', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (639, N'1616P0X6GA', N'1616P051VA', N'WorkNo', N'', N'varchar(36)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (640, N'1616P0X7WA', N'1616P051VA', N'DCUNo', N'DCU編號', N'varchar(20)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (641, N'1616P0X9AA', N'1616P051VA', N'DCUType', N'DCU型號', N'varchar(20)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (642, N'1616P0XAMA', N'1616P051VA', N'DCUSerialNo', N'', N'varchar(20)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (643, N'1616P0XBYA', N'1616P051VA', N'ChannelType', N'頻道組別', N'varchar(2)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (644, N'1616P0XD9A', N'1616P051VA', N'IMGNo', N'圖號座標', N'varchar(11)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (645, N'1616P0XELA', N'1616P051VA', N'TaipowerDistrict', N'', N'varchar(2)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (646, N'1616P0XFXA', N'1616P051VA', N'TaipowerBusinessArea', N'', N'varchar(2)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (647, N'1616P0XH8A', N'1616P051VA', N'PostCode', N'', N'varchar(15)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (648, N'1616P0XJNA', N'1616P051VA', N'Address', N'', N'varchar(200)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (649, N'1616P0XL2A', N'1616P051VA', N'ListLock', N'', N'varchar(5)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (650, N'1616P0XMDA', N'1616P051VA', N'WorkEmp', N'', N'varchar(50)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (651, N'1616P0XNQA', N'1616P051VA', N'VerifyEmp', N'', N'varchar(50)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (652, N'1616P0XQ1A', N'1616P051VA', N'CheckEmp', N'', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (653, N'1616P0XRFA', N'1616P051VA', N'UnitManager', N'', N'varchar(50)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (654, N'1616P0XSVA', N'1616P051VA', N'WorkClass_Id', N'', N'varchar(50)', 0, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (655, N'1616P0XU9A', N'1616P051VA', N'WorkStatusMapping_Id', N'', N'int(11)', 0, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (656, N'1616P0XWUA', N'1616P051VA', N'CreateDate', N'', N'datetime', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (657, N'1616P0XY8A', N'1616P051VA', N'CityName', N'', N'varchar(15)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (658, N'1616P0XZKA', N'1616P051VA', N'AreaName', N'', N'varchar(15)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (659, N'1616P0Y0WA', N'1616P051VA', N'City', N'', N'int(11)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (660, N'1616P0Y2AA', N'1616P051VA', N'CloseReasonDetailId', N'', N'varchar(50)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (661, N'1616P0Y3QA', N'1616P051VA', N'CloseReason_Id', N'', N'varchar(50)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (662, N'1616P0Y51A', N'1616P051VA', N'Collected', N'', N'tinyint(4)', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (663, N'1616P0Y6FA', N'1616P051VA', N'AuditorEmp', N'', N'varchar(50)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (664, N'1616P0Y7SA', N'1616P051VA', N'WorkDispatch_Id', N'', N'varchar(50)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (665, N'1616P0Y96A', N'1616P051VA', N'PickDate', N'領單時間', N'datetime', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (666, N'1616P0YAHA', N'1616P051VA', N'EndDate', N'結案時間', N'datetime', 1, N'', 29, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (667, N'1616P0YBXA', N'1616P051VA', N'LocationType', N'', N'varchar(50)', 1, N'', 30, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (668, N'1616P0YD8A', N'1616P051VA', N'InductionType', N'引電方式', N'varchar(50)', 1, N'', 31, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (669, N'1616P0YEKA', N'1616P051VA', N'ConnectionMethod', N'通訊方式', N'varchar(50)', 1, N'', 32, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (670, N'1616P0YFZA', N'1616P051VA', N'Floor', N'樓層', N'int(11)', 1, N'', 33, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (671, N'1616P0YHAA', N'1616P0539A', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (672, N'1616P0YJQA', N'1616P0539A', N'WorkNo', N'', N'varchar(36)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (673, N'1616P0YL1A', N'1616P0539A', N'ElectricNo', N'', N'varchar(15)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (674, N'1616P0YMFA', N'1616P0539A', N'AccountName', N'', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (675, N'1616P0YNSA', N'1616P0539A', N'PostCode', N'', N'varchar(15)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (676, N'1616P0YQ6A', N'1616P0539A', N'Address', N'', N'varchar(200)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (677, N'1616P0YRLA', N'1616P0539A', N'DCUNo', N'', N'varchar(20)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (678, N'1616P0YSXA', N'1616P0539A', N'ElectricMeterNo', N'', N'varchar(12)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (679, N'1616P0YUBA', N'1616P0539A', N'ElectricMeterCode', N'型式代碼', N'varchar(15)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (680, N'1616P0YVNA', N'1616P0539A', N'ModuleType', N'模組型號', N'varchar(15)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (681, N'1616P0YWZA', N'1616P0539A', N'ElectricMeterType', N'電表類別', N'varchar(15)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (682, N'1616P0YYDA', N'1616P0539A', N'WorkEmp', N'', N'varchar(50)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (683, N'1616P0YZQA', N'1616P0539A', N'VerifyEmp', N'', N'varchar(50)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (684, N'1616P0Z11A', N'1616P0539A', N'CheckEmp', N'', N'varchar(50)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (685, N'1616P0Z2FA', N'1616P0539A', N'UnitManager', N'', N'varchar(50)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (686, N'1616P0Z3VA', N'1616P0539A', N'WorkClass_Id', N'', N'varchar(50)', 0, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (687, N'1616P0Z56A', N'1616P0539A', N'WorkStatusMapping_Id', N'', N'int(11)', 0, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (688, N'1616P0Z6HA', N'1616P0539A', N'WorkDispatch_Id', N'', N'varchar(50)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (689, N'1616P0Z7UA', N'1616P0539A', N'CreateDate', N'', N'datetime', 1, N'', 19, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (690, N'1616P0Z98A', N'1616P0539A', N'CityName', N'', N'varchar(15)', 1, N'', 20, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (691, N'1616P0ZAKA', N'1616P0539A', N'AreaName', N'', N'varchar(15)', 1, N'', 21, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (692, N'1616P0ZBZA', N'1616P0539A', N'City', N'', N'int(11)', 1, N'', 22, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (693, N'1616P0ZDAA', N'1616P0539A', N'CloseReasonDetailId', N'', N'varchar(50)', 1, N'', 23, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (694, N'1616P0ZEMA', N'1616P0539A', N'CloseReason_Id', N'', N'varchar(50)', 1, N'', 24, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (695, N'1616P0ZG1A', N'1616P0539A', N'Collected', N'是否已從app領取', N'tinyint(4)', 1, N'', 25, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (696, N'1616P0ZHCA', N'1616P0539A', N'ModuleSN', N'', N'varchar(15)', 1, N'', 26, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (697, N'1616P0ZJSA', N'1616P0539A', N'AuditorEmp', N'', N'varchar(50)', 1, N'', 27, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (698, N'1616P0ZL3A', N'1616P0539A', N'PickDate', N'領單時間', N'datetime', 1, N'', 28, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (699, N'1616P0ZMHA', N'1616P0539A', N'EndDate', N'結案時間', N'datetime', 1, N'', 29, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (700, N'1616P0ZNUA', N'1616P0539A', N'LocationType', N'', N'varchar(20)', 1, N'', 30, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (701, N'1616P0ZQ8A', N'1616P0539A', N'Floor', N'樓層', N'int(11)', 1, N'', 31, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (702, N'1616P0ZRKA', N'1616P054LA', N'Id', N'', N'int(11)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (703, N'1616P0ZSWA', N'1616P054LA', N'Product', N'工單字軌', N'varchar(1)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (704, N'1616P0ZU7A', N'1616P054LA', N'WorkNo', N'工單單日流水號', N'int(11)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (705, N'1616P0ZVMA', N'1616P054LA', N'MaxNo', N'單日流水號最大值', N'int(11)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (706, N'1616P0ZX1A', N'1616P054LA', N'MinNo', N'單日流水號最小值', N'int(11)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (707, N'1616P0ZYCA', N'1616P0560A', N'Id', N'', N'int(11)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (708, N'1616P0ZZSA', N'1616P0560A', N'Product', N'', N'varchar(2)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (709, N'1616P1013A', N'1616P0560A', N'WorkNo', N'', N'int(11)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (710, N'1616P102EA', N'1616P0560A', N'MaxNo', N'', N'int(11)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (711, N'1616P103RA', N'1616P0560A', N'MinNo', N'', N'int(11)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (712, N'1616P1052A', N'1616P057BA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (713, N'1616P106DA', N'1616P057BA', N'WorkOrderId', N'工單GUID', N'varchar(50)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (714, N'1616P107TA', N'1616P057BA', N'AuditorDate', N'審核日期', N'datetime', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (715, N'1616P1097A', N'1616P057BA', N'AuditorDescription', N'審核描述', N'varchar(100)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (716, N'1616P10AJA', N'1616P057BA', N'AuditorEmp', N'審核人員', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (717, N'1616P10BYA', N'1616P057BA', N'CheckPoint', N'關卡', N'varchar(50)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (718, N'1616P10D9A', N'1616P057BA', N'AuditorStatus', N'審核狀態', N'tinyint(1)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (719, N'1616P10EPA', N'1616P058NA', N'Id', N'', N'int(11)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (720, N'1616P10G3A', N'1616P058NA', N'status', N'', N'varchar(20)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (721, N'1616P10HEA', N'1616P058NA', N'Desc', N'', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (722, N'1616ZCEAKA', N'1616ZCDM6A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (723, N'1616ZCEBZA', N'1616ZCDM6A', N'RoleName', N'角色名稱', N'varchar(45)', 1, N'', 2, N'角色名稱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (724, N'1616ZCEDDA', N'1616ZCDNLA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (725, N'1616ZCEEQA', N'1616ZCDNLA', N'ContractNo', N'合約編號', N'varchar(20)', 0, N'', 2, N'合約編號', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (726, N'1616ZCEG4A', N'1616ZCDNLA', N'ProjectNo', N'專案代碼', N'varchar(20)', 0, N'', 3, N'專案代碼', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (727, N'1616ZCEHFA', N'1616ZCDNLA', N'ProjectName', N'專案名稱', N'varchar(30)', 1, N'', 4, N'專案名稱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (728, N'1616ZCEKAA', N'1616ZCDNLA', N'TaxId', N'客戶統一編號', N'char(8)', 0, N'', 5, N'客戶統一編號', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (729, N'1616ZCEMPA', N'1616ZCDNLA', N'Name', N'客戶名稱', N'varchar(50)', 1, N'', 6, N'客戶名稱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (730, N'1616ZCEP0A', N'1616ZCDNLA', N'Address', N'公司地址', N'varchar(100)', 1, N'', 7, N'公司地址', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (731, N'1616ZCEQBA', N'1616ZCDNLA', N'Telephone', N'電話', N'varchar(20)', 1, N'', 8, N'電話', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (732, N'1616ZCERRA', N'1616ZCDNLA', N'Email', N'Email', N'varchar(100)', 1, N'', 9, N'Email', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (733, N'1616ZCET5A', N'1616ZCDNLA', N'ContractStart', N'合約有效期-起', N'datetime', 0, N'', 10, N'合約有效期-起', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (734, N'1616ZCEUGA', N'1616ZCDNLA', N'ContractEnd', N'合約有效期-迄', N'datetime', 0, N'', 11, N'合約有效期-迄', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (735, N'1616ZCEVWA', N'1616ZCDNLA', N'ContactName', N'客戶聯絡窗口', N'varchar(50)', 1, N'', 12, N'客戶聯絡窗口', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (736, N'1616ZCEX7A', N'1616ZCDNLA', N'FhProductDesc', N'富鴻網產品描述', N'varchar(100)', 1, N'', 13, N'富鴻網產品描述', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (737, N'1616ZCEYJA', N'1616ZCDNLA', N'FhContactName', N'富鴻網聯絡窗口', N'varchar(50)', 1, N'', 14, N'富鴻網聯絡窗口', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (738, N'1616ZCEZVA', N'1616ZCDNLA', N'ProductPDM', N'富鴻網產品PDM', N'varchar(50)', 1, N'', 15, N'富鴻網產品PDM', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (739, N'1616ZCF16A', N'1616ZCDNLA', N'ProductPJM', N'富鴻網產品PJM', N'varchar(50)', 1, N'', 16, N'富鴻網產品PJM', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (740, N'1616ZCF2LA', N'1616ZCDNLA', N'AutoRepair', N'啟動自動派維修工單', N'tinyint(1)', 1, N'0', 17, N'啟動自動派維修工單', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (741, N'1616ZCF3XA', N'1616ZCDQ0A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (742, N'1616ZCF58A', N'1616ZCDQ0A', N'UniNumber', N'', N'varchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (743, N'1616ZCF6NA', N'1616ZCDQ0A', N'CategoryName', N'', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (744, N'1616ZCF82A', N'1616ZCDQ0A', N'MixCategoryId', N'', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (745, N'1616ZCFK9A', N'1616ZCDRBA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (746, N'1616ZCFMUA', N'1616ZCDRBA', N'WorkOrderNo', N'', N'varchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (747, N'1616ZCFP8A', N'1616ZCDRBA', N'CustomerContractId', N'', N'varchar(50)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (748, N'1616ZCFQNA', N'1616ZCDRBA', N'RepairDateTime', N'報修日期、時間', N'datetime', 0, N'', 4, N'報修日期、時間', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (749, N'1616ZCFRZA', N'1616ZCDRBA', N'ProblemMain', N'障礙主類', N'varchar(50)', 0, N'', 5, N'障礙主類', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (750, N'1616ZCFTGA', N'1616ZCDRBA', N'ProblemSub', N'障礙次類', N'varchar(50)', 0, N'', 6, N'障礙次類', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (751, N'1616ZCFW4A', N'1616ZCDRBA', N'ProblemDesc', N'描述障礙內容', N'varchar(100)', 1, N'', 7, N'描述障礙內容', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (752, N'1616ZCFYVA', N'1616ZCDRBA', N'ContactrName', N'描述障礙內容', N'varchar(100)', 1, N'', 8, N'描述障礙內容', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (753, N'1616ZCG09A', N'1616ZCDRBA', N'ContactrTel', N'描述障礙內容', N'varchar(100)', 1, N'', 9, N'描述障礙內容', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (754, N'1616ZCG1LA', N'1616ZCDRBA', N'ContactrEmail', N'描述障礙內容', N'varchar(100)', 1, N'', 10, N'描述障礙內容', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (755, N'1616ZCG30A', N'1616ZCDRBA', N'VideoPath', N'', N'varchar(200)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (756, N'1616ZCG4EA', N'1616ZCDSNA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (757, N'1616ZCG5RA', N'1616ZCDSNA', N'Dept', N'部門', N'varchar(50)', 1, N'', 2, N'部門', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (758, N'1616ZCG72A', N'1616ZCDSNA', N'Team', N'組別', N'varchar(50)', 1, N'', 3, N'組別', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (759, N'1616ZCG8GA', N'1616ZCDSNA', N'OriginSource', N'原始來源', N'varchar(50)', 1, N'', 4, N'原始來源', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (760, N'1616ZCG9WA', N'1616ZCDTZA', N'EmployeeId', N'帳號', N'varchar(20)', 0, N'', 1, N'帳號', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (761, N'1616ZCGBAA', N'1616ZCDTZA', N'Name', N'員工姓名', N'varchar(30)', 1, N'', 2, N'員工姓名', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (762, N'1616ZCGJ6A', N'1616ZCDTZA', N'ENGName', N'員工英文名稱', N'varchar(30)', 1, N'', 3, N'員工英文名稱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (763, N'1616ZCGN8A', N'1616ZCDTZA', N'Phone', N'聯絡電話', N'varchar(20)', 1, N'', 4, N'聯絡電話', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (764, N'1616ZCGTWA', N'1616ZCDTZA', N'Email', N'電子信箱', N'varchar(50)', 1, N'', 5, N'電子信箱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (765, N'1616ZCGVAA', N'1616ZCDTZA', N'PWD', N'密碼', N'varchar(50)', 1, N'', 6, N'密碼', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (766, N'1616ZCGWQA', N'1616ZCDTZA', N'Origin', N'來源', N'varchar(50)', 1, N'', 7, N'來源', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (767, N'1616ZCH3HA', N'1616ZCDTZA', N'PhoneToken', N'', N'varchar(100)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (768, N'1616ZCHAGA', N'1616ZCDTZA', N'DepartmentId', N'部門', N'varchar(50)', 0, N'', 9, N'部門', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (769, N'1616ZCHETA', N'1616ZCDTZA', N'EmployeeStatus', N'帳號狀態', N'int(11)', 1, N'', 10, N'帳號狀態', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (770, N'1616ZCHHCA', N'1616ZCDVAA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (771, N'1616ZCHJSA', N'1616ZCDVAA', N'CityCode', N'城市代碼', N'varchar(45)', 1, N'', 2, N'城市代碼', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (772, N'1616ZCHKKA', N'1616ZCDVAA', N'CityName', N'城市名稱', N'varchar(45)', 1, N'', 3, N'城市名稱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (773, N'1616ZCHMEA', N'1616ZCDVAA', N'AreaCode', N'郵遞區號', N'varchar(45)', 1, N'', 4, N'郵遞區號', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (774, N'1616ZCHNRA', N'1616ZCDVAA', N'AreaName', N'區域名稱(鄉鎮市區)', N'varchar(45)', 1, N'', 5, N'區域名稱(鄉鎮市區)', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (775, N'1616ZCHQ5A', N'1616ZCDVAA', N'SerialNum', N'', N'int(11)', 1, N'0', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (776, N'1616ZCHRGA', N'1616ZCDWQA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (777, N'1616ZCHSFA', N'1616ZCDWQA', N'EmployeeId', N'', N'varchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (778, N'1616ZCHT5A', N'1616ZCDWQA', N'WorkCategoryId', N'', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (779, N'1616ZCHVJA', N'1616ZCDWQA', N'RegionWorkClass', N'Region/WorkClass', N'varchar(10)', 1, N'', 4, N'Region/WorkClass', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (780, N'1616ZCHWVA', N'1616ZCDWQA', N'EmployeeAreaId', N'', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (781, N'1616ZCHZPA', N'1616ZCDWQA', N'WorkClassId', N'', N'varchar(50)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (782, N'1616ZCJ0XA', N'1616ZCDWQA', N'AuthRolesId', N'', N'varchar(50)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (783, N'1616ZCJ3NA', N'1616ZCDWQA', N'CanCreate', N'', N'tinyint(1)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (784, N'1616ZCJLPA', N'1616ZCDWQA', N'CanRead', N'', N'tinyint(1)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (785, N'1616ZCJNQA', N'1616ZCDWQA', N'CanDelete', N'', N'tinyint(1)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (786, N'1616ZCKF6A', N'1616ZCDWQA', N'CanUpdate', N'', N'tinyint(1)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (787, N'1616ZCKGLA', N'1616ZCDY1A', N'Id', N'', N'varchar(36)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (788, N'1616ZCKJ0A', N'1616ZCDY1A', N'DateTime', N'發生時間', N'datetime', 0, N'', 2, N'發生時間', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (789, N'1616ZCKKBA', N'1616ZCDY1A', N'EmployeeId', N'登入帳號', N'varchar(45)', 0, N'', 3, N'登入帳號', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (790, N'1616ZCKLNA', N'1616ZCDY1A', N'Environment', N'環境 (Web、App)', N'varchar(45)', 0, N'', 4, N'環境 (Web、App)', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (791, N'1616ZCKN2A', N'1616ZCDY1A', N'ExceptionPath', N'例外發生位置', N'varchar(100)', 0, N'', 5, N'例外發生位置', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (792, N'1616ZCKPDA', N'1616ZCDY1A', N'ExceptionMessageJson', N'例外訊息Json', N'varchar(1000)', 0, N'', 6, N'例外訊息Json', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (793, N'1616ZCKQQA', N'1616ZCDZFA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (794, N'1616ZCKS4A', N'1616ZCDZFA', N'Category', N'', N'varchar(30)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (795, N'1616ZCKTJA', N'1616ZCDZFA', N'ColumnDescribe', N'', N'varchar(50)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (796, N'1616ZCKUVA', N'1616ZCDZFA', N'ColumnValue', N'', N'varchar(50)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (797, N'1616ZCKW6A', N'1616ZCDZFA', N'ColumnType', N'', N'varchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (798, N'1616ZCKXHA', N'1616ZCDZFA', N'ParentCategoryId', N'', N'varchar(50)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (799, N'1616ZCKYUA', N'1616ZCDZFA', N'ColumnSort', N'', N'int(11)', 1, N'', 7, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (800, N'1616ZCL08A', N'1616ZCE0VA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (801, N'1616ZCL1KA', N'1616ZCE0VA', N'ClassName', N'類別名稱', N'varchar(45)', 1, N'', 2, N'類別名稱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (802, N'1616ZCL2ZA', N'1616ZCE0VA', N'ClassPath', N'類別路徑', N'varchar(45)', 1, N'', 3, N'類別路徑', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (803, N'1616ZCL4AA', N'1616ZCE0VA', N'ParentId', N'上層類別 Id', N'varchar(50)', 1, N'', 4, N'上層類別 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (804, N'1616ZCL5MA', N'1616ZCE0VA', N'Sort', N'', N'int(11)', 1, N'0', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (805, N'1616ZCL77A', N'1616ZCE29A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (806, N'1616ZCL8CA', N'1616ZCE29A', N'WorkOrderId', N'工單號碼 Id', N'varchar(50)', 0, N'', 2, N'工單號碼 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (807, N'1616ZCL9PA', N'1616ZCE29A', N'ImageSort', N'影像排序', N'int(11)', 0, N'', 3, N'影像排序', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (808, N'1616ZCLB3A', N'1616ZCE29A', N'ImageType', N'影像分類', N'varchar(50)', 1, N'', 4, N'影像分類', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (809, N'1616ZCLCEA', N'1616ZCE29A', N'ImagePath', N'影像名稱', N'varchar(100)', 0, N'', 5, N'影像名稱', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (810, N'1616ZCLDRA', N'1616ZCE3PA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (811, N'1616ZCLF5A', N'1616ZCE3PA', N'Product', N'工單字軌', N'varchar(1)', 0, N'', 2, N'工單字軌', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (812, N'1616ZCLGGA', N'1616ZCE3PA', N'WorkNo', N'工單單日流水號', N'int(11)', 0, N'', 3, N'工單單日流水號', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (813, N'1616ZCLHTA', N'1616ZCE3PA', N'MaxNo', N'單日流水號最大值', N'int(11)', 0, N'', 4, N'單日流水號最大值', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (814, N'1616ZCLK7A', N'1616ZCE3PA', N'MinNo', N'單日流水號最小值', N'int(11)', 0, N'', 5, N'單日流水號最小值', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (815, N'1616ZCLLMA', N'1616ZCE3PA', N'Date', N'工單號碼分配日期', N'datetime', 0, N'', 6, N'工單號碼分配日期', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (816, N'1616ZCLMYA', N'1616ZCE56A', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (817, N'1616ZCLPCA', N'1616ZCE56A', N'WorkOrderId', N'工單號碼 Id', N'varchar(50)', 0, N'', 2, N'工單號碼 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (818, N'1616ZCLQPA', N'1616ZCE56A', N'AuditorDate', N'審核時間', N'datetime', 1, N'', 3, N'審核時間', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (819, N'1616ZCLS0A', N'1616ZCE56A', N'AuditorDescription', N'審核結果說明', N'varchar(100)', 1, N'', 4, N'審核結果說明', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (820, N'1616ZCLTEA', N'1616ZCE56A', N'AuditorEmployeeId', N'審核人員 Id ', N'varchar(20)', 1, N'', 5, N'審核人員 Id ', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (821, N'1616ZCLUUA', N'1616ZCE56A', N'CheckPoint', N'審核節點', N'varchar(50)', 1, N'', 6, N'審核節點', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (822, N'1616ZCLW8A', N'1616ZCE56A', N'AuditorStatus', N'審核結果', N'tinyint(1)', 1, N'', 7, N'審核結果', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (823, N'1616ZCLXKA', N'1616ZCE6HA', N'Id', N'', N'varchar(50)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (824, N'1616ZCLYZA', N'1616ZCE6HA', N'CustomerRepairId', N'報修工單 Id', N'varchar(50)', 0, N'', 2, N'報修工單 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (825, N'1616ZCM0DA', N'1616ZCE6HA', N'WorkDatetime', N'派工日期時間', N'datetime', 1, N'', 3, N'派工日期時間', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (826, N'1616ZCM1TA', N'1616ZCE6HA', N'ProcessDatetime', N'處理日期時間', N'datetime', 1, N'', 4, N'處理日期時間', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (827, N'1616ZCM34A', N'1616ZCE6HA', N'MaintainProcessDesc', N'維運處理描述', N'varchar(100)', 1, N'', 5, N'維運處理描述', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (828, N'1616ZCM4JA', N'1616ZCE6HA', N'WorkEmpId', N'施工人員 Id', N'varchar(20)', 1, N'', 6, N'施工人員 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (829, N'1616ZCM5VA', N'1616ZCE6HA', N'AuditEmpId', N'審核人員 Id', N'varchar(20)', 1, N'', 7, N'審核人員 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (830, N'1616ZCM76A', N'1616ZCE6HA', N'PmEmpId', N'主管單位 Id', N'varchar(20)', 1, N'', 8, N'主管單位 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (831, N'1616ZCM8HA', N'1616ZCE6HA', N'WorkStatusMappingId', N'工單進程 Id', N'varchar(50)', 1, N'', 9, N'工單進程 Id', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (832, N'161D2APJUA', N'161D2APDCA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (833, N'161D2APL5A', N'161D2APDCA', N'Name', N'活動名稱', N'nvarchar(100)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (834, N'161D2APMKA', N'161D2APDCA', N'AssistId', N'贊助來源', N'varchar(10)', 0, N'''''', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (835, N'161D2APNZA', N'161D2APDCA', N'PlanCoin', N'預計使用幣數', N'decimal', 0, N'0', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (836, N'161D2APQAA', N'161D2APDCA', N'UseCoin', N'實際使用幣數', N'decimal', 0, N'0', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (837, N'161D2APRQA', N'161D2APDCA', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (838, N'161D2APT1A', N'161D2APDCA', N'Note', N'備註', N'nvarchar(-1)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (839, N'161D2APUFA', N'161D2APDCA', N'Status', N'資料狀態', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (840, N'161D2APVSA', N'161D2APDCA', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (841, N'161D2APX3A', N'161D2APDCA', N'Created', N'建檔日期', N'datetime', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (842, N'161D2APYHA', N'161D2APDCA', N'Revised', N'異動日期', N'datetime', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (843, N'165R6BC9MA', N'165R6BBPBA', N'CategoryID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (844, N'165R6BCB1A', N'165R6BBPBA', N'CategoryName', N'', N'nvarchar(15)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (845, N'165R6BCCFA', N'165R6BBPBA', N'Description', N'', N'ntext(1073741823)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (846, N'165R6BCDVA', N'165R6BBPBA', N'Picture', N'', N'image(2147483647)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (847, N'165R6BCF6A', N'165R6BBQRA', N'CustomerID', N'', N'nchar(5)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (848, N'165R6BCGHA', N'165R6BBQRA', N'CustomerTypeID', N'', N'nchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (849, N'165R6BCHUA', N'165R6BBS2A', N'CustomerTypeID', N'', N'nchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (850, N'165R6BCK5A', N'165R6BBS2A', N'CustomerDesc', N'', N'ntext(1073741823)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (851, N'165R6BCLGA', N'165R6BBTDA', N'CustomerID', N'', N'nchar(5)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (852, N'165R6BCMWA', N'165R6BBTDA', N'CompanyName', N'', N'nvarchar(40)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (853, N'165R6BCPAA', N'165R6BBTDA', N'ContactName', N'', N'nvarchar(30)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (854, N'165R6BCQMA', N'165R6BBTDA', N'ContactTitle', N'', N'nvarchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (855, N'165R6BCRYA', N'165R6BBTDA', N'Address', N'', N'nvarchar(60)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (856, N'165R6BCT9A', N'165R6BBTDA', N'City', N'', N'nvarchar(15)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (857, N'165R6BCULA', N'165R6BBTDA', N'Region', N'', N'nvarchar(15)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (858, N'165R6BCVXA', N'165R6BBTDA', N'PostalCode', N'', N'nvarchar(10)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (859, N'165R6BCXBA', N'165R6BBTDA', N'Country', N'', N'nvarchar(15)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (860, N'165R6BCYNA', N'165R6BBTDA', N'Phone', N'', N'nvarchar(24)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (861, N'165R6BD02A', N'165R6BBTDA', N'Fax', N'', N'nvarchar(24)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (862, N'165R6BD2WA', N'165R6BBUQA', N'EmployeeID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (863, N'165R6BD6YA', N'165R6BBUQA', N'LastName', N'', N'nvarchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (864, N'165R6BD89A', N'165R6BBUQA', N'FirstName', N'', N'nvarchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (865, N'165R6BD9LA', N'165R6BBUQA', N'Title', N'', N'nvarchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (866, N'165R6BDB0A', N'165R6BBUQA', N'TitleOfCourtesy', N'', N'nvarchar(25)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (867, N'165R6BDCEA', N'165R6BBUQA', N'BirthDate', N'', N'datetime', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (868, N'165R6BDDUA', N'165R6BBUQA', N'HireDate', N'', N'datetime', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (869, N'165R6BDF5A', N'165R6BBUQA', N'Address', N'', N'nvarchar(60)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (870, N'165R6BDGGA', N'165R6BBUQA', N'City', N'', N'nvarchar(15)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (871, N'165R6BDHWA', N'165R6BBUQA', N'Region', N'', N'nvarchar(15)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (872, N'165R6BDKAA', N'165R6BBUQA', N'PostalCode', N'', N'nvarchar(10)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (873, N'165R6BDLQA', N'165R6BBUQA', N'Country', N'', N'nvarchar(15)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (874, N'165R6BDN4A', N'165R6BBUQA', N'HomePhone', N'', N'nvarchar(24)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (875, N'165R6BDPFA', N'165R6BBUQA', N'Extension', N'', N'nvarchar(4)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (876, N'165R6BDQSA', N'165R6BBUQA', N'Photo', N'', N'image(2147483647)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (877, N'165R6BDS3A', N'165R6BBUQA', N'Notes', N'', N'ntext(1073741823)', 1, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (878, N'165R6BDTLA', N'165R6BBUQA', N'ReportsTo', N'', N'int', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (879, N'165R6BDUXA', N'165R6BBUQA', N'PhotoPath', N'', N'nvarchar(255)', 1, N'', 18, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (880, N'165R6BDW8A', N'165R6BBW4A', N'EmployeeID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (881, N'165R6BDXKA', N'165R6BBW4A', N'TerritoryID', N'', N'nvarchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (882, N'165R6BDYZA', N'165R6BBXFA', N'OrderID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (883, N'165R6BE0AA', N'165R6BBXFA', N'ProductID', N'', N'int', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (884, N'165R6BE1QA', N'165R6BBXFA', N'UnitPrice', N'', N'money', 0, N'0', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (885, N'165R6BE31A', N'165R6BBXFA', N'Quantity', N'', N'smallint', 0, N'1', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (886, N'165R6BE4CA', N'165R6BBXFA', N'Discount', N'', N'real', 0, N'0', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (887, N'165R6BE5PA', N'165R6BBYVA', N'OrderID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (888, N'165R6BE73A', N'165R6BBYVA', N'CustomerID', N'', N'nchar(5)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (889, N'165R6BE8EA', N'165R6BBYVA', N'EmployeeID', N'', N'int', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (890, N'165R6BE9UA', N'165R6BBYVA', N'OrderDate', N'', N'datetime', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (891, N'165R6BEB5A', N'165R6BBYVA', N'RequiredDate', N'', N'datetime', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (892, N'165R6BECGA', N'165R6BBYVA', N'ShippedDate', N'', N'datetime', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (893, N'165R6BEDWA', N'165R6BBYVA', N'ShipVia', N'', N'int', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (894, N'165R6BF0MA', N'165R6BBYVA', N'Freight', N'', N'money', 1, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (895, N'165R6BFA5A', N'165R6BBYVA', N'ShipName', N'', N'nvarchar(40)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (896, N'165R6BFBKA', N'165R6BBYVA', N'ShipAddress', N'', N'nvarchar(60)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (897, N'165R6BFCWA', N'165R6BBYVA', N'ShipCity', N'', N'nvarchar(15)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (898, N'165R6BFEAA', N'165R6BBYVA', N'ShipRegion', N'', N'nvarchar(15)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (899, N'165R6BFFMA', N'165R6BBYVA', N'ShipPostalCode', N'', N'nvarchar(10)', 1, N'', 13, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (900, N'165R6BFGYA', N'165R6BBYVA', N'ShipCountry', N'', N'nvarchar(15)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (901, N'165R6BFJCA', N'165R6BC06A', N'ProductID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (902, N'165R6BFKSA', N'165R6BC06A', N'ProductName', N'', N'nvarchar(40)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (903, N'165R6BFM3A', N'165R6BC06A', N'SupplierID', N'', N'int', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (904, N'165R6BFNHA', N'165R6BC06A', N'CategoryID', N'', N'int', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (905, N'165R6BFPUA', N'165R6BC06A', N'QuantityPerUnit', N'', N'nvarchar(20)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (906, N'165R6BFR5A', N'165R6BC06A', N'UnitPrice', N'', N'money', 1, N'0', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (907, N'165R6BFSKA', N'165R6BC06A', N'UnitsInStock', N'', N'smallint', 1, N'0', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (908, N'165R6BFTWA', N'165R6BC06A', N'UnitsOnOrder', N'', N'smallint', 1, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (909, N'165R6BFV7A', N'165R6BC06A', N'ReorderLevel', N'', N'smallint', 1, N'0', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (910, N'165R6BFWJA', N'165R6BC06A', N'Discontinued', N'', N'bit', 0, N'0', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (911, N'165R6BFXYA', N'165R6BC2XA', N'RegionID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (912, N'165R6BFZCA', N'165R6BC2XA', N'RegionDescription', N'', N'nchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (913, N'165R6BG0SA', N'165R6BC48A', N'ShipperID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (914, N'165R6BG20A', N'165R6BC48A', N'CompanyName', N'', N'nvarchar(40)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (915, N'165R6BG3EA', N'165R6BC48A', N'Phone', N'', N'nvarchar(24)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (916, N'165R6BG4RA', N'165R6BC5KA', N'SupplierID', N'', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (917, N'165R6BG65A', N'165R6BC5KA', N'CompanyName', N'', N'nvarchar(40)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (918, N'165R6BG7KA', N'165R6BC5KA', N'ContactName', N'', N'nvarchar(30)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (919, N'165R6BG8WA', N'165R6BC5KA', N'ContactTitle', N'', N'nvarchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (920, N'165R6BGANA', N'165R6BC5KA', N'Address', N'', N'nvarchar(60)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (921, N'165R6BGBMA', N'165R6BC5KA', N'City', N'', N'nvarchar(15)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (922, N'165R6BGD1A', N'165R6BC5KA', N'Region', N'', N'nvarchar(15)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (923, N'165R6BGECA', N'165R6BC5KA', N'PostalCode', N'', N'nvarchar(10)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (924, N'165R6BGFPA', N'165R6BC5KA', N'Country', N'', N'nvarchar(15)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (925, N'165R6BGH0A', N'165R6BC5KA', N'Phone', N'', N'nvarchar(24)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (926, N'165R6BGJEA', N'165R6BC5KA', N'Fax', N'', N'nvarchar(24)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (927, N'165R6BGKRA', N'165R6BC5KA', N'HomePage', N'', N'ntext(1073741823)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (928, N'165R6BGM5A', N'165R6BC6ZA', N'TerritoryID', N'', N'nvarchar(20)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (929, N'165R6BGNGA', N'165R6BC6ZA', N'TerritoryDescription', N'', N'nchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (930, N'165R6BGPWA', N'165R6BC6ZA', N'RegionID', N'', N'int', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (931, N'5X9RB37ZKA', N'5X9RB36MYA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (932, N'5X9RB381FA', N'5X9RB36MYA', N'TableId', N'資料表Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (933, N'5X9RB3845A', N'5X9RB36MYA', N'Name', N'欄位名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (934, N'5X9RB3890A', N'5X9RB36MYA', N'DataType', N'資料型態', N'varchar(20)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (935, N'5X9RB38APA', N'5X9RB36MYA', N'Nullable', N'可空值', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (936, N'5X9RB38E9A', N'5X9RB36MYA', N'DefaultValue', N'預設值', N'varchar(100)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (937, N'5X9RB38G3A', N'5X9RB36MYA', N'Sort', N'排序', N'int', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (938, N'5X9RB38HTA', N'5X9RB36MYA', N'Note', N'說明', N'nvarchar(255)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (939, N'5X9RB38KTA', N'5X9RB36MYA', N'Status', N'資料狀態', N'bit', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (940, N'5X9RB38NHA', N'5X9RB36PRA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (941, N'5X9RB38QJA', N'5X9RB36PRA', N'ProjectId', N'專案Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (942, N'5X9RB395WA', N'5X9RB36PRA', N'LabelHori', N'水平Label', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (943, N'5X9RB397PA', N'5X9RB36PRA', N'ReadSql', N'查詢Sql', N'varchar(500)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (944, N'5X9RB39DFA', N'5X9RB36PRA', N'TableAs', N'資料表別名', N'varchar(10)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (945, N'5X9RB39FLA', N'5X9RB36PRA', N'HasCreate', N'Create功能', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (946, N'5X9RB39HDA', N'5X9RB36PRA', N'HasUpdate', N'Update功能', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (947, N'5X9RB39L2A', N'5X9RB36PRA', N'HasDelete', N'Delete功能', N'bit', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (948, N'5X9RB39NSA', N'5X9RB36PRA', N'HasView', N'View功能', N'bit', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (949, N'5X9RB39QUA', N'5X9RB36PRA', N'HasExport', N'Export功能', N'bit', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (950, N'5X9RB39TLA', N'5X9RB36PRA', N'HasReset', N'Reset功能', N'bit', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (951, N'5X9RB39VJA', N'5X9RB36PRA', N'Status', N'資料狀態', N'bit', 0, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (952, N'5X9RB39XPA', N'5X9RB36TCA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (953, N'5X9RB3A19A', N'5X9RB36TCA', N'EtableId', N'EtableId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (954, N'5X9RB3A4CA', N'5X9RB36TCA', N'InputType', N'輸入類型', N'varchar(10)', 0, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (955, N'5X9RB3A6GA', N'5X9RB36TCA', N'InputData', N'輸入資料', N'nvarchar(50)', 1, N'', 5, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (956, N'5X9RB3A9JA', N'5X9RB36TCA', N'Required', N'必填', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (957, N'5X9RB3ABDA', N'5X9RB36TCA', N'HasCreate', N'Create功能', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (958, N'5X9RB3ACRA', N'5X9RB36TCA', N'HasUpdate', N'Update功能', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (959, N'5X9RB3AE4A', N'5X9RB36TCA', N'PlaceHolder', N'PlaceHolder', N'varchar(10)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (960, N'5X9RB3AHCA', N'5X9RB36TCA', N'DefaultValue', N'預設值', N'varchar(10)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (961, N'5X9RB3AT3A', N'5X9RB36TCA', N'PosGroup', N'同列', N'varchar(10)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (962, N'5X9RB3BH2A', N'5X9RB36TCA', N'LayoutCols', N'版位', N'varchar(10)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (963, N'5X9RB3DMHA', N'5X9RB36TCA', N'Width', N'欄位寬度', N'int', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (964, N'5X9RB3E38A', N'5X9RB36TCA', N'CheckType', N'檢查類型', N'varchar(10)', 0, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (965, N'5X9RB3E4QA', N'5X9RB36TCA', N'CheckData', N'檢查資料', N'varchar(10)', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (966, N'5X9RB3E6SA', N'5X9RB36TCA', N'Sort', N'排序', N'int', 0, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (967, N'5X9RB3E8JA', N'5X9RB36VLA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (968, N'5X9RB3EAAA', N'5X9RB36VLA', N'CrudId', N'CrudId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (969, N'5X9RB3EBUA', N'5X9RB36VLA', N'TableId', N'資料表Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (970, N'5X9RB3EDAA', N'5X9RB36VLA', N'Kid', N'主鍵Id', N'varchar(10)', 0, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (971, N'5X9RB3EEPA', N'5X9RB36VLA', N'MapFid', N'外鍵Id', N'varchar(10)', 1, N'', 5, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (972, N'5X9RB3EG4A', N'5X9RB36VLA', N'Col4', N'Col4', N'varchar(30)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (973, N'5X9RB3EHJA', N'5X9RB36VLA', N'OrderBy', N'OrderBy', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (974, N'5X9RB3EK8A', N'5X9RB36VLA', N'Sort', N'排序', N'int', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (975, N'5X9RB3ELQA', N'5X9RB36XEA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (976, N'5X9RB3ENRA', N'5X9RB36XEA', N'CrudId', N'CrudId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (977, N'5X9RB3F0AA', N'5X9RB36XEA', N'TableAs', N'資料表別名', N'varchar(20)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (978, N'5X9RB3FABA', N'5X9RB36XEA', N'InputType', N'輸入類型', N'varchar(20)', 0, N'', 5, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (979, N'5X9RB3FC9A', N'5X9RB36XEA', N'InputData', N'輸入資料', N'varchar(20)', 1, N'', 6, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (980, N'5X9RB3FELA', N'5X9RB36XEA', N'Op', N'比對方式', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (981, N'5X9RB3FG9A', N'5X9RB36XEA', N'IsRange', N'Range比對', N'bit', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (982, N'5X9RB3FHUA', N'5X9RB36XEA', N'IsFind2', N'進階查詢', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (983, N'5X9RB3FKDA', N'5X9RB36XEA', N'PosGroup', N'同列', N'varchar(10)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (984, N'5X9RB3FM3A', N'5X9RB36XEA', N'LayoutCols', N'版位', N'varchar(20)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (985, N'5X9RB3FNUA', N'5X9RB36XEA', N'ExtInfo', N'其他資料', N'varchar(20)', 1, N'', 12, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (986, N'5X9RB3FQ1A', N'5X9RB36XEA', N'Sort', N'排序', N'int', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (987, N'5X9RB3FRUA', N'5X9RB36ZCA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (988, N'5X9RB3FTJA', N'5X9RB36ZCA', N'CrudId', N'CrudId', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (989, N'5X9RB3G21A', N'5X9RB36ZCA', N'Width', N'欄位寬度', N'int', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (990, N'5X9RB3G3PA', N'5X9RB36ZCA', N'RitemType', N'結果欄位類型', N'varchar(10)', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (991, N'5X9RB3G5KA', N'5X9RB36ZCA', N'ExtInfo', N'其他資料', N'varchar(30)', 1, N'', 7, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (992, N'5X9RB3G71A', N'5X9RB36ZCA', N'Sort', N'排序', N'int', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (993, N'5X9RB3G8EA', N'5X9RB3720A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (994, N'5X9RB3GG2A', N'5X9RB3720A', N'DbName', N'Db名稱', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (995, N'5X9RB3GK9A', N'5X9RB3720A', N'ProjectPath', N'專案路徑', N'varchar(255)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (996, N'5X9RB3GLJA', N'5X9RB3720A', N'ConnectStr', N'Db連線字串', N'varchar(255)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (997, N'5X9RB3GN2A', N'5X9RB3720A', N'Status', N'資料狀態', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (998, N'5X9RB3GPHA', N'5X9RB373ZA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (999, N'5X9RB3GRZA', N'5X9RB373ZA', N'ProjectId', N'專案Id', N'varchar(10)', 0, N'', 2, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1000, N'5X9RB3GT3A', N'5X9RB373ZA', N'Name', N'資料表名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1001, N'5X9RB3GWNA', N'5X9RB373ZA', N'Note', N'說明', N'nvarchar(255)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1002, N'5X9RB3GZ3A', N'5X9RB373ZA', N'Status', N'資料狀態', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1003, N'5XBA43L8QA', N'5X9RB36TCA', N'ColumnId', N'欄位Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1004, N'5XBA43LBNA', N'5X9RB36XEA', N'ColumnId', N'欄位Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1005, N'5XD29XCRAA', N'5XD29XBSMA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1006, N'5XD29XCUNA', N'5XD29XBSMA', N'Name', N'部門名稱', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1007, N'5XD29XCW1A', N'5XD29XBSMA', N'MgrId', N'主管Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1008, N'5XD29XD5LA', N'5XD29XC3BA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1009, N'5XD29XD72A', N'5XD29XC3BA', N'Account', N'帳號', N'varchar(20)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1010, N'5XD29XD8JA', N'5XD29XC3BA', N'Name', N'使用者名稱', N'nvarchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1011, N'5XD29XDARA', N'5XD29XC3BA', N'DeptId', N'部門', N'varchar(10)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1012, N'5XD29XDBYA', N'5XD29XC3BA', N'Status', N'資料狀態', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1013, N'5XD29XDDDA', N'5XD29XC6LA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1014, N'5XD29XDF1A', N'5XD29XC6LA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1015, N'5XD29XDGTA', N'5XD29XC6LA', N'JobName', N'工作名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1016, N'5XD29XDKZA', N'5XD29XC6LA', N'JobType', N'工作類型', N'nvarchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1017, N'5XD29XDN0A', N'5XD29XC6LA', N'JobPlace', N'工作地點', N'nvarchar(30)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1018, N'5XD29XDPVA', N'5XD29XC6LA', N'StartEnd', N'起迄時間', N'varchar(30)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1019, N'5XD29XDUAA', N'5XD29XC6LA', N'CorpName', N'公司名稱', N'nvarchar(30)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1020, N'5XD29XDVWA', N'5XD29XC6LA', N'CorpUsers', N'公司人數', N'int', 0, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1021, N'5XD29XDXPA', N'5XD29XC6LA', N'IsManaged', N'管理職', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1022, N'5XD29XE1AA', N'5XD29XC6LA', N'JobDesc', N'工作說明', N'varchar(-1)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1023, N'5XD29XE2UA', N'5XD29XC7WA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1024, N'5XD29XE9LA', N'5XD29XC7WA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1025, N'5XD29XFPMA', N'5XD29XC7WA', N'LangName', N'語言名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1026, N'5XD29XFX1A', N'5XD29XC7WA', N'ListenLevel', N'聴力', N'tinyint', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1027, N'5XD29XFZXA', N'5XD29XC7WA', N'SpeakLevel', N'說', N'tinyint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1028, N'5XD29XG6HA', N'5XD29XC7WA', N'ReadLevel', N'閱讀', N'tinyint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1029, N'5XD29XG8HA', N'5XD29XC7WA', N'WriteLevel', N'書寫', N'tinyint', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1030, N'5XD29XGACA', N'5XD29XC7WA', N'Sort', N'排序', N'int', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1031, N'5XD29XGC3A', N'5XD29XC9AA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1032, N'5XD29XGE9A', N'5XD29XC9AA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1033, N'5XD29XGG3A', N'5XD29XC9AA', N'LicenseName', N'證照名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1034, N'5XD29XGHSA', N'5XD29XC9AA', N'StartEnd', N'起迄時間', N'varchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1035, N'5XD29XGKPA', N'5XD29XC9AA', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1036, N'5XD29XGNVA', N'5XD29XCAWA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1037, N'5XD29XGR4A', N'5XD29XCAWA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1038, N'5XD29XGSRA', N'5XD29XCAWA', N'SchoolName', N'學校名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1039, N'5XD29XGV8A', N'5XD29XCAWA', N'SchoolDept', N'科系', N'nvarchar(20)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1040, N'5XD29XGWUA', N'5XD29XCAWA', N'SchoolType', N'學歷種類', N'nvarchar(20)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1041, N'5XD29XGZGA', N'5XD29XCAWA', N'StartEnd', N'起迄時間', N'varchar(30)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1042, N'5XD29XH1CA', N'5XD29XCAWA', N'Graduated', N'是否畢業', N'bit', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1043, N'5XD29XH4HA', N'5XD29XCDPA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'PKey', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1044, N'5XD29XH6EA', N'5XD29XCDPA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1045, N'5XD29XH8EA', N'5XD29XCDPA', N'SkillName', N'技能名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1046, N'5XD29XHA2A', N'5XD29XCDPA', N'SkillDesc', N'技能說明', N'nvarchar(500)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1047, N'5XLQ99LTVA', N'5XD29XC9AA', N'Sort', N'排序', N'int', 0, N'', 6, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1048, N'5XLQ99LV9A', N'5XD29XCDPA', N'Sort', N'排序', N'int', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1049, N'5YFVGEZSJA', N'5XD29XC3BA', N'Pwd', N'密碼', N'varchar(32)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1050, N'5YFVJXBYXA', N'5X9RB36MYA', N'Code', N'欄位代碼', N'varchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1051, N'5YFVJXC0WA', N'5X9RB36PRA', N'ProgCode', N'功能代碼', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1052, N'5YFVJXC2BA', N'5X9RB36PRA', N'ProgName', N'功能名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1053, N'5YFVJXC3RA', N'5X9RB36PRA', N'AuthType', N'權限種類', N'tinyint', 0, N'', 14, N'see Code, 0(無), 1(Ctrl), 2(Action)', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1054, N'5YFVJXC4ZA', N'5X9RB36PRA', N'Created', N'建檔時間', N'datetime', 0, N'', 16, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1055, N'5YFVJXC6KA', N'5X9RB36PRA', N'Revised', N'修改時間', N'datetime', 1, N'', 17, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1056, N'5YFVJXC7TA', N'5X9RB36ZCA', N'ColumnCode', N'欄位代碼', N'varchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1057, N'5YFVJXC9YA', N'5X9RB36ZCA', N'Name', N'顯示名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1058, N'5YFVJXCB7A', N'5X9RB3720A', N'Code', N'專案代碼', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1059, N'5YFVJXCCVA', N'5X9RB373ZA', N'Code', N'資料表代碼', N'varchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1060, N'5Z5BHXMCMA', N'5Z5BHXK86A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1061, N'5Z5BHXME5A', N'5Z5BHXK86A', N'UserId', N'請假人', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1062, N'5Z5BHXMFJA', N'5Z5BHXK86A', N'AgentId', N'代理人', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1063, N'5Z5BHXMGLA', N'5Z5BHXK86A', N'LeaveType', N'假別', N'char(1)', 0, N'', 4, N'Code LeaveType', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1064, N'5Z5BHXMJ7A', N'5Z5BHXK86A', N'StartTime', N'開始時間', N'datetime', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1065, N'5Z5BHXMKSA', N'5Z5BHXK86A', N'EndTime', N'結束時間', N'datetime', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1066, N'5Z5BHXMM5A', N'5Z5BHXK86A', N'Hours', N'請假時數', N'decimal', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1067, N'5Z5BHXMS5A', N'5Z5BHXK86A', N'FlowSignStatus', N'流程簽核狀態', N'char(1)', 0, N'', 9, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1068, N'5Z5BHXMU0A', N'5Z5BHXK86A', N'Status', N'資料狀態', N'bit', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1069, N'5Z5BHXMVTA', N'5Z5BHXK86A', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1070, N'5Z5BHXMXVA', N'5Z5BHXK86A', N'Created', N'建檔日期', N'datetime', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1071, N'5Z5BHXMZRA', N'5Z5BHXK86A', N'Reviser', N'修改人員', N'varchar(10)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1072, N'5Z5BHXN1KA', N'5Z5BHXK86A', N'Revised', N'修改日期', N'datetime', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1073, N'5ZKB7A6VPA', N'5X9RB36VLA', N'HalfWidth', N'是否半幅寬度', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1074, N'D58FUTP10A', N'5X9RB36TCA', N'EitemType', N'編輯欄位種類', N'varchar(10)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1075, N'D58FUTPHMA', N'5X9RB36TCA', N'ItemData', N'欄位資料', N'nvarchar(50)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1076, N'D58FUTPZ6A', N'5X9RB36VLA', N'PkeyFid', N'主鍵欄位Id', N'varchar(10)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1077, N'D58FUTQEQA', N'5X9RB36VLA', N'FkeyFid', N'外鍵欄位Id', N'varchar(10)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1078, N'D58FUTQVNA', N'5X9RB36XEA', N'QitemType', N'查詢欄位種類', N'varchar(20)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1079, N'D58FUTRAMA', N'5X9RB36XEA', N'ItemData', N'欄位資料', N'varchar(20)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1080, N'D58FUTT5TA', N'5X9RB373ZA', N'TranLog', N'是否記錄交易', N'bit', 0, N'0', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1081, N'D58FV79WAA', N'5Z5BHXK86A', N'FlowLevel', N'流程目前Level', N'tinyint', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1082, N'D58FV7ABUA', N'5Z5BHXK86A', N'FlowStatus', N'流程狀態', N'char(1)', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1083, N'D58FV7ATEA', N'5Z5BHXK86A', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1084, N'D58FV7B84A', N'5XD29XC3BA', N'PhotoFile', N'相片檔名', N'nvarchar(100)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1085, N'D58J2RNGAA', N'D58J2RM39A', N'Type', N'資料類別', N'varchar(20)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1086, N'D58J2RNXYA', N'D58J2RM39A', N'Value', N'Key值', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1087, N'D58J2RPC0A', N'D58J2RM39A', N'Name', N'顯示內容', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1088, N'D58J2RPTKA', N'D58J2RM39A', N'Sort', N'排序', N'int', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1089, N'D58J2RQ9CA', N'D58J2RM39A', N'Ext', N'擴充資訊', N'varchar(30)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1090, N'D58J2RR6RA', N'D58J2RM39A', N'Note', N'備註', N'nvarchar(255)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1091, N'D58LXL78TA', N'D58LXKZJUA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1092, N'D58LXL7PHA', N'D58LXKZJUA', N'CmsType', N'Cms類別', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1093, N'D58LXL84GA', N'D58LXKZJUA', N'DataType', N'資料型態', N'varchar(10)', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1094, N'D58LXL8LJA', N'D58LXKZJUA', N'Title', N'標題', N'nvarchar(255)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1095, N'D58LXL926A', N'D58LXKZJUA', N'Text', N'文字內容', N'nvarchar(-1)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1096, N'D58LXL9JRA', N'D58LXKZJUA', N'Html', N'HTML內容', N'nvarchar(-1)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1097, N'D58LXL9ZYA', N'D58LXKZJUA', N'Note', N'備註', N'nvarchar(255)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1098, N'D58LXLAE4A', N'D58LXKZJUA', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1099, N'D58LXLAWDA', N'D58LXKZJUA', N'StartTime', N'開始時間', N'datetime', 0, N'', 9, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1100, N'D58LXLBBRA', N'D58LXKZJUA', N'EndTime', N'結束時間', N'datetime', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1101, N'D58LXLBS3A', N'D58LXKZJUA', N'Status', N'資料狀態', N'bit', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1102, N'D58LXLC7BA', N'D58LXKZJUA', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1103, N'D58LXLCNPA', N'D58LXKZJUA', N'Created', N'建檔日期', N'datetime', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1104, N'D58LXLD4AA', N'D58LXKZJUA', N'Reviser', N'修改人員', N'varchar(10)', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1105, N'D58LXLDKHA', N'D58LXKZJUA', N'Revised', N'修改日期', N'datetime', 1, N'', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1106, N'D58LXLE05A', N'D58LXL00BA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1107, N'D58LXLEGNA', N'D58LXL00BA', N'FldText', N'文字欄位', N'nchar(10)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1108, N'D58LXLEXFA', N'D58LXL00BA', N'FldNum', N'整數欄位', N'int', 1, N'', 3, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1109, N'D58LXLFDXA', N'D58LXL00BA', N'FldNum2', N'小數欄位', N'float', 1, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1110, N'D58LXLFVLA', N'D58LXL00BA', N'FldCheck', N'Check欄位', N'bit', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1111, N'D58LXLGATA', N'D58LXL00BA', N'FldRadio', N'Radio欄位', N'tinyint', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1112, N'D58LXLGR2A', N'D58LXL00BA', N'FldSelect', N'下拉式欄位', N'varchar(10)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1113, N'D58LXLH7YA', N'D58LXL00BA', N'FldDate', N'日期欄位', N'date', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1114, N'D58LXLHNJA', N'D58LXL00BA', N'FldDatetime', N'時間欄位', N'datetime', 1, N'', 9, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1115, N'D58LXLJ38A', N'D58LXL00BA', N'FldFile', N'檔案欄位', N'nvarchar(100)', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1116, N'D58LXLJJKA', N'D58LXL00BA', N'FldColor', N'Color欄位', N'varchar(10)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1117, N'D58LXLJZDA', N'D58LXL00BA', N'FldTextarea', N'多行文字欄位', N'nvarchar(-1)', 1, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1118, N'D58LXLKFWA', N'D58LXL00BA', N'FldHtml', N'HTML欄位', N'nvarchar(-1)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1119, N'D58LXLKXXA', N'D58LXL0GHA', N'Type', N'資料類別', N'varchar(20)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1120, N'D58LXLLC9A', N'D58LXL0GHA', N'Value', N'Key值', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1121, N'D58LXLLTNA', N'D58LXL0GHA', N'Name_zhTW', N'名稱(繁中)', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1122, N'D58LXLM8FA', N'D58LXL0GHA', N'Name_zhCN', N'名稱(簡中)', N'nvarchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1123, N'D58LXLMQTA', N'D58LXL0GHA', N'Name_enUS', N'名稱(英文)', N'nvarchar(30)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1124, N'D58LXLN5BA', N'D58LXL0GHA', N'Sort', N'排序', N'int', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1125, N'D58LXLNLEA', N'D58LXL0GHA', N'Ext', N'擴充資訊', N'varchar(30)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1126, N'D58LXLP29A', N'D58LXL0GHA', N'Note', N'備註', N'nvarchar(255)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1127, N'D58LXLPJHA', N'D58LXL0Y0A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1128, N'D58LXLPZMA', N'D58LXL0Y0A', N'Name', N'名稱', N'nvarchar(50)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1129, N'D58LXLQF2A', N'D58LXL0Y0A', N'TplFile', N'範本檔名', N'nvarchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1130, N'D58LXLQWKA', N'D58LXL0Y0A', N'ToEmails', N'收件者', N'varchar(500)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1131, N'D58LXLRCUA', N'D58LXL0Y0A', N'Sql', N'SQL內容', N'nvarchar(500)', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1132, N'D58LXLRT0A', N'D58LXL0Y0A', N'Status', N'資料狀態', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1133, N'D58LXLS80A', N'D58LXL1D4A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1134, N'D58LXLSQUA', N'D58LXL1D4A', N'Code', N'代碼', N'varchar(20)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1135, N'D58LXLT5GA', N'D58LXL1D4A', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1136, N'D58LXLTMCA', N'D58LXL1D4A', N'Portrait', N'是否直立', N'bit', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1137, N'D58LXLU24A', N'D58LXL1D4A', N'Status', N'資料狀態', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1138, N'D58LXLUH6A', N'D58LXL1VTA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1139, N'D58LXLUY9A', N'D58LXL1VTA', N'FlowId', N'流程Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1140, N'D58LXLVE4A', N'D58LXL1VTA', N'StartNode', N'開始節點', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1141, N'D58LXLVVGA', N'D58LXL1VTA', N'EndNode', N'結束節點', N'varchar(10)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1142, N'D58LXLWA6A', N'D58LXL1VTA', N'CondStr', N'條件字串', N'varchar(255)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1143, N'D58LXLWR6A', N'D58LXL1VTA', N'Sort', N'排序', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1144, N'D58LXLX7DA', N'D58LXL2A8A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1145, N'D58LXLXPBA', N'D58LXL2A8A', N'FlowId', N'流程Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1146, N'D58LXLY5WA', N'D58LXL2A8A', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1147, N'D58LXLYM9A', N'D58LXL2A8A', N'NodeType', N'節點類別', N'char(1)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1148, N'D58LXLZ2TA', N'D58LXL2A8A', N'PosX', N'位置X', N'smallint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1149, N'D58LXLZHUA', N'D58LXL2A8A', N'PosY', N'位置Y', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1150, N'D58LXLZZFA', N'D58LXL2A8A', N'SignerType', N'簽核者類別', N'varchar(2)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1151, N'D58LXM0F2A', N'D58LXL2A8A', N'SignerValue', N'簽核者值', N'varchar(30)', 1, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1152, N'D58LXM0XDA', N'D58LXL2A8A', N'PassType', N'通過類別', N'char(1)', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1153, N'D58LXM1D6A', N'D58LXL2A8A', N'PassNum', N'通過數量', N'smallint', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1154, N'D58LXM1UJA', N'D58LXL2SLA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1155, N'D58LXM2ADA', N'D58LXL2SLA', N'FlowId', N'流程Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1156, N'D58LXM2SWA', N'D58LXL2SLA', N'SourceId', N'來源資料Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1157, N'D58LXM374A', N'D58LXL2SLA', N'NodeName', N'節點名稱', N'nvarchar(30)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1158, N'D58LXM3PDA', N'D58LXL2SLA', N'FlowLevel', N'流程Level', N'smallint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1159, N'D58LXM44MA', N'D58LXL2SLA', N'TotalLevel', N'合計Level', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1160, N'D58LXM4STA', N'D58LXL2SLA', N'SignerId', N'簽核者Id', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1161, N'D58LXM51YA', N'D58LXL2SLA', N'SignerName', N'簽核者姓名', N'nvarchar(20)', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1162, N'D58LXM5GQA', N'D58LXL2SLA', N'SignStatus', N'簽核狀態', N'char(1)', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1163, N'D58LXM5YEA', N'D58LXL2SLA', N'SignTime', N'簽核時間', N'datetime', 1, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1164, N'D58LXM6DAA', N'D58LXL2SLA', N'Note', N'說明', N'nvarchar(255)', 1, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1165, N'D58LXM6UQA', N'D58LXL378A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1166, N'D58LXM7ABA', N'D58LXL378A', N'Type', N'資料類別', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1167, N'D58LXM7R3A', N'D58LXL378A', N'FileName', N'上傳檔名', N'nvarchar(100)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1168, N'D58LXM861A', N'D58LXL378A', N'OkCount', N'成功筆數', N'smallint', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1169, N'D58LXM8MUA', N'D58LXL378A', N'FailCount', N'失敗筆數', N'smallint', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1170, N'D58LXM93BA', N'D58LXL378A', N'TotalCount', N'合計筆數', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1171, N'D58LXM9J1A', N'D58LXL378A', N'CreatorName', N'建檔人員', N'nvarchar(30)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1172, N'D58LXM9ZEA', N'D58LXL378A', N'Created', N'建檔日期', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1173, N'D58LXMAE9A', N'D58LXL3N4A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1174, N'D58LXMAWMA', N'D58LXL3N4A', N'Code', N'代碼', N'varchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1175, N'D58LXMBB0A', N'D58LXL3N4A', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1176, N'D58LXMBSCA', N'D58LXL3N4A', N'Icon', N'圖示', N'varchar(20)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1177, N'D58LXMC85A', N'D58LXL3N4A', N'Url', N'Url', N'varchar(100)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1178, N'D58LXMCQ7A', N'D58LXL3N4A', N'Sort', N'排序', N'smallint', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1179, N'D58LXMD5AA', N'D58LXL3N4A', N'AuthRow', N'資料權限', N'tinyint', 0, N'0', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1180, N'D58LXMDL8A', N'D58LXL3N4A', N'FunCreate', N'FunCreate', N'tinyint', 0, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1181, N'D58LXME1HA', N'D58LXL3N4A', N'FunRead', N'FunRead', N'tinyint', 0, N'0', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1182, N'D58LXMEGYA', N'D58LXL3N4A', N'FunUpdate', N'FunUpdate', N'tinyint', 0, N'0', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1183, N'D58LXMEX3A', N'D58LXL3N4A', N'FunDelete', N'FunDelete', N'tinyint', 0, N'0', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1184, N'D58LXMFD9A', N'D58LXL3N4A', N'FunPrint', N'FunPrint', N'tinyint', 0, N'0', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1185, N'D58LXMFVYA', N'D58LXL3N4A', N'FunExport', N'FunExport', N'tinyint', 0, N'0', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1186, N'D58LXMGAPA', N'D58LXL3N4A', N'FunView', N'FunView', N'tinyint', 0, N'0', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1187, N'D58LXMGRPA', N'D58LXL3N4A', N'FunOther', N'FunOther', N'tinyint', 0, N'0', 15, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1188, N'D58LXMH73A', N'D58LXL44TA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1189, N'D58LXMHPPA', N'D58LXL44TA', N'Name', N'名稱', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1190, N'D58LXMJ4NA', N'D58LXL4KKA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1191, N'D58LXMJKJA', N'D58LXL4KKA', N'RoleId', N'角色Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1192, N'D58LXMK1QA', N'D58LXL4KKA', N'ProgId', N'功能Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1193, N'D58LXMKHDA', N'D58LXL4KKA', N'FunCreate', N'FunCreate', N'tinyint', 0, N'0', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1194, N'D58LXMKYWA', N'D58LXL4KKA', N'FunRead', N'FunRead', N'tinyint', 0, N'0', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1195, N'D58LXMLD7A', N'D58LXL4KKA', N'FunUpdate', N'FunUpdate', N'tinyint', 0, N'0', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1196, N'D58LXMLUYA', N'D58LXL4KKA', N'FunDelete', N'FunDelete', N'tinyint', 0, N'0', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1197, N'D58LXMMAHA', N'D58LXL4KKA', N'FunPrint', N'FunPrint', N'tinyint', 0, N'0', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1198, N'D58LXMMSRA', N'D58LXL4KKA', N'FunExport', N'FunExport', N'tinyint', 0, N'0', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1199, N'D58LXMN8NA', N'D58LXL4KKA', N'FunView', N'FunView', N'tinyint', 0, N'0', 10, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1200, N'D58LXMNPHA', N'D58LXL4KKA', N'FunOther', N'FunOther', N'tinyint', 0, N'0', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1201, N'D58LXMP45A', N'D58LXL50NA', N'Sn', N'序號', N'int', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1202, N'D58LXMPLVA', N'D58LXL50NA', N'RowId', N'資料Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1203, N'D58LXMQ1QA', N'D58LXL50NA', N'TableName', N'資料表名稱', N'varchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1204, N'D58LXMQG0A', N'D58LXL50NA', N'ColName', N'欄位名稱', N'varchar(30)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1205, N'D58LXMQYKA', N'D58LXL50NA', N'OldValue', N'舊值', N'nvarchar(500)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1206, N'D58LXMRE7A', N'D58LXL50NA', N'NewValue', N'新值', N'nvarchar(500)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1207, N'D58LXMRVJA', N'D58LXL50NA', N'Act', N'執行動作', N'varchar(10)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1208, N'D58LXMSB0A', N'D58LXL50NA', N'Created', N'建檔日期', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1209, N'D58LXMSSCA', N'D58LXL5FUA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1210, N'D58LXMT79A', N'D58LXL5FUA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1211, N'D58LXMTNNA', N'D58LXL5FUA', N'RoleId', N'角色Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1212, N'D58WX65UJA', N'D58WX60WVA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 1, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1213, N'D58WX66AAA', N'D58WX60WVA', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1214, N'D58WX66RHA', N'D58WX60WVA', N'Created', N'建檔日期', N'datetime', 0, N'', 3, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1215, N'D58WX677AA', N'D58WX61CCA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1216, N'D58WX67N5A', N'D58WX61CCA', N'Name', N'尋寶名稱', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1217, N'D58WX683EA', N'D58WX61CCA', N'StartTime', N'開始時間', N'datetime', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1218, N'D58WX68JCA', N'D58WX61CCA', N'EndTime', N'結束時間', N'datetime', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1219, N'D58WX68ZGA', N'D58WX61CCA', N'IsBatch', N'是否批次解謎', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1220, N'D58WX69E7A', N'D58WX61CCA', N'IsMove', N'是否移動地點', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1221, N'D58WX6ABUA', N'D58WX61CCA', N'GiftName', N'獎品內容', N'nvarchar(100)', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1222, N'D58WX6ATUA', N'D58WX61CCA', N'Note', N'注意事項', N'nvarchar(500)', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1223, N'D58WX6C6SA', N'D58WX61CCA', N'LaunchStatus', N'上架狀態', N'char(1)', 0, N'''0''', 11, N'refer XpCode.LaunchStatus', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1224, N'D58WX6CNVA', N'D58WX61CCA', N'Status', N'資料狀態', N'bit', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1225, N'D58WX6D3LA', N'D58WX61CCA', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1226, N'D58WX6E0GA', N'D58WX61TFA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1227, N'D58WX6EFQA', N'D58WX61TFA', N'CmsType', N'CMS種類', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1228, N'D58WX6EWHA', N'D58WX61TFA', N'Title', N'標題', N'nvarchar(255)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1229, N'D58WX6FC1A', N'D58WX61TFA', N'Text', N'文字內容', N'nvarchar(-1)', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1230, N'D58WX6FT1A', N'D58WX61TFA', N'Html', N'Html內容', N'nvarchar(-1)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1231, N'D58WX6G8UA', N'D58WX61TFA', N'Note', N'備註', N'nvarchar(255)', 1, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1232, N'D58WX6GPJA', N'D58WX61TFA', N'FileName', N'上傳檔名', N'nvarchar(100)', 1, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1233, N'D58WX6H4WA', N'D58WX61TFA', N'StartTime', N'開始時間', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1234, N'D58WX6HL3A', N'D58WX61TFA', N'EndTime', N'結束時間', N'datetime', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1235, N'D58WX6J13A', N'D58WX61TFA', N'Status', N'資料狀態', N'bit', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1236, N'D58WX6JHKA', N'D58WX61TFA', N'Creator', N'建檔人員', N'varchar(10)', 0, N'', 11, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1237, N'D58WX6JZ4A', N'D58WX61TFA', N'Created', N'建檔日期', N'datetime', 0, N'', 12, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1238, N'D58WX6KEGA', N'D58WX61TFA', N'Reviser', N'修改人員', N'varchar(10)', 1, N'', 13, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1239, N'D58WX6KVNA', N'D58WX61TFA', N'Revised', N'修改日期', N'datetime', 1, N'', 14, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1240, N'D58WX6LB5A', N'D58WX627KA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1241, N'D58WX6LSHA', N'D58WX627KA', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1242, N'D58WX6M70A', N'D58WX627KA', N'UserId', N'用戶Id', N'varchar(10)', 0, N'', 3, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1243, N'D58WX6MNHA', N'D58WX627KA', N'Reply', N'答題內容', N'nvarchar(500)', 0, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1244, N'D58WX6N48A', N'D58WX627KA', N'Created', N'建檔日期', N'datetime', 0, N'', 5, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1245, N'D58WX6NKEA', N'D58WX62PGA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1246, N'D58WX6P1NA', N'D58WX62PGA', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1247, N'D58WX6PHDA', N'D58WX62PGA', N'FileName', N'上傳檔案名稱', N'nvarchar(100)', 0, N'', 3, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1248, N'D58WX6PZDA', N'D58WX62PGA', N'Hint', N'提示', N'nvarchar(100)', 1, N'', 4, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1249, N'D58WX6QEEA', N'D58WX62PGA', N'Answer', N'正確答案', N'varchar(22)', 0, N'', 5, N'MD5加密', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1250, N'D58WX6QWGA', N'D58WX62PGA', N'Sort', N'排序', N'smallint', 0, N'', 6, N'', 0)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1251, N'D58WX6RBPA', N'D58WX634WA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1252, N'D58WX6RT8A', N'D58WX634WA', N'Name', N'姓名', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1253, N'D58WX6S9UA', N'D58WX634WA', N'Account', N'帳號', N'varchar(20)', 0, N'', 3, N'可修改', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1254, N'D58WX6SRJA', N'D58WX634WA', N'Pwd', N'密碼', N'varchar(22)', 0, N'''''', 4, N'MD5加密', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1255, N'D58WX6T64A', N'D58WX634WA', N'Status', N'資料狀態', N'bit', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1256, N'D58WX6TMNA', N'D58WX634WA', N'IsAdmin', N'是否管理者', N'bit', 0, N'', 6, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1257, N'D58WX6U3JA', N'D58WX63L5A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1258, N'D58WX6UKQA', N'D58WX63L5A', N'Name', N'姓名', N'nvarchar(30)', 1, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1259, N'D58WX6V0WA', N'D58WX63L5A', N'Phone', N'手機號碼', N'varchar(15)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1260, N'D58WX6VFNA', N'D58WX63L5A', N'Email', N'Email', N'varchar(100)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1261, N'D58WX6VXLA', N'D58WX63L5A', N'Address', N'地址', N'nvarchar(255)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1262, N'D58WX6WCUA', N'D58WX63L5A', N'Created', N'建檔日期', N'datetime', 0, N'', 8, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1263, N'D58WX6WUUA', N'D58WX63L5A', N'Revised', N'修改日期', N'datetime', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1264, N'D58WX6XA1A', N'D58WX6485A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1265, N'D58WX6XRPA', N'D58WX6485A', N'Name', N'姓名', N'nvarchar(30)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1266, N'D58WX6Y7NA', N'D58WX6485A', N'Account', N'帳號', N'varchar(30)', 0, N'', 3, N'可修改', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1267, N'D58WX6YNSA', N'D58WX6485A', N'Pwd', N'密碼', N'varchar(22)', 0, N'''''', 4, N'MD5加密', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1268, N'D58WX6Z41A', N'D58WX6485A', N'Phone', N'手機號碼', N'varchar(15)', 0, N'', 5, N'不可修改', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1269, N'D58WX6ZKCA', N'D58WX6485A', N'Email', N'Email', N'varchar(100)', 0, N'', 6, N'不可修改', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1270, N'D58WX70B0A', N'D58WX6485A', N'Address', N'地址', N'nvarchar(255)', 0, N'', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1271, N'D58WX70X9A', N'D58WX6485A', N'IsCorp', N'是否公司', N'bit', 0, N'', 8, N'公司才能設定Bao.IsMove=true', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1272, N'D58WX71C0A', N'D58WX6485A', N'Created', N'建檔日期', N'datetime', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1273, N'D70XCQLA3A', N'D58LXL00BA', N'FldInt', N'', N'int', 1, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1274, N'D70XCQLSCA', N'D58LXL00BA', N'FldDec', N'', N'float', 1, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1275, N'D70XCQM7TA', N'D58LXL00BA', N'FldDt', N'', N'datetime', 1, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1276, N'D8ZRXEVPDA', N'D58WX61CCA', N'StageCount', N'關卡數目', N'tinyint', 0, N'', 10, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1277, N'D8ZRXEW46A', N'D58WX61CCA', N'Revised', N'異動日期', N'datetime', 0, N'', 14, N'含建檔日期', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1278, N'D8ZRXEWK8A', N'D8ZRXETU8A', N'UserId', N'App用戶Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1279, N'D8ZRXEX1RA', N'D8ZRXETU8A', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1280, N'D8ZRXEXHBA', N'D8ZRXETU8A', N'AttendStatus', N'參加狀態', N'char(1)', 0, N'', 3, N'refer XpCode AttendStatus', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1281, N'D8ZRXEXY2A', N'D8ZRXETU8A', N'Created', N'建檔日期', N'datetime', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1282, N'D8ZRXEYE4A', N'D8ZRXEUAEA', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1283, N'D8ZRXEYVPA', N'D8ZRXEUAEA', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1284, N'D8ZRXEZB3A', N'D8ZRXEUAEA', N'UserId', N'App用戶Id', N'varchar(10)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1285, N'D8ZRXEZTXA', N'D8ZRXEUAEA', N'Reply', N'答題內容', N'nvarchar(500)', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1286, N'D8ZRXF08SA', N'D8ZRXEUAEA', N'Created', N'建檔日期', N'datetime', 0, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1287, N'D8ZRXF0Q4A', N'D8ZRXEUS7A', N'Id', N'Id', N'varchar(10)', 0, N'', 1, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1288, N'D8ZRXF163A', N'D8ZRXEUS7A', N'BaoId', N'尋寶Id', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1289, N'D8ZRXF1LKA', N'D8ZRXEUS7A', N'FileName', N'上傳檔案名稱', N'nvarchar(100)', 0, N'', 3, N'關卡圖檔', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1290, N'D8ZRXF21QA', N'D8ZRXEUS7A', N'AppHint', N'App用戶提示', N'nvarchar(100)', 1, N'', 4, N'顯示在App', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1291, N'D8ZRXF2GXA', N'D8ZRXEUS7A', N'CustHint', N'客戶提示', N'nvarchar(100)', 1, N'', 5, N'for 客戶維護用途', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1292, N'D8ZRXF2YXA', N'D8ZRXEUS7A', N'Answer', N'正確答案', N'varchar(22)', 0, N'', 6, N'MD5加密', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1293, N'D8ZRXF3D4A', N'D8ZRXEUS7A', N'Sort', N'排序', N'smallint', 0, N'', 7, N'base 0', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1294, N'D8ZRXF3V7A', N'D58WX63L5A', N'Status', N'資料狀態', N'bit', 0, N'0', 7, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1295, N'D8ZRXF4ARA', N'D58WX6485A', N'Status', N'資料狀態', N'bit', 0, N'', 9, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1296, N'D9QS7Q771A', N'D58WX61CCA', N'IsMoney', N'是否獎金', N'bit', 0, N'', 7, N'0(獎品), 1(獎金)', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1297, N'D9QS7Q7NDA', N'D8ZRXETU8A', N'NowLevel', N'目前關卡', N'smallint', 0, N'1', 4, N'base 1', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1298, N'D9QS7Q84SA', N'D58WX63L5A', N'AuthCode', N'認證號碼', N'varchar(10)', 1, N'', 6, N'App用戶建立帳號或是回復帳號時, 必須經過認證', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1299, N'D9QTSQG2QA', N'D9QTSQF55A', N'Type', N'資料類別', N'varchar(20)', 0, N'', 1, N'', 1)
GO
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1300, N'D9QTSQGHUA', N'D9QTSQF55A', N'Value', N'Key值', N'varchar(10)', 0, N'', 2, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1301, N'D9QTSQGYWA', N'D9QTSQF55A', N'Name', N'顯示名稱', N'nvarchar(30)', 0, N'', 3, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1302, N'D9QTSQHD9A', N'D9QTSQF55A', N'Sort', N'排序', N'int', 0, N'', 4, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1303, N'D9QTSQHVPA', N'D9QTSQF55A', N'Ext', N'擴充資訊', N'varchar(30)', 1, N'', 5, N'', 1)
INSERT [dbo].[Column] ([Sn], [Id], [TableId], [Code], [Name], [DataType], [Nullable], [DefaultValue], [Sort], [Note], [Status]) VALUES (1304, N'D9QTSQJAGA', N'D9QTSQF55A', N'Note', N'備註', N'nvarchar(255)', 1, N'', 6, N'', 1)
SET IDENTITY_INSERT [dbo].[Column] OFF
GO
SET IDENTITY_INSERT [dbo].[Crud] ON 

INSERT [dbo].[Crud] ([Sn], [Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (1, N'161D2WBJ8A', N'161D29Q5SA', N'Act', N'活動維護', 1, N'select * from dbo.Act
order by Id', N'', 1, 1, 1, 1, 0, 0, 0, 1, CAST(N'2022-03-19T17:00:45.000' AS DateTime), NULL)
INSERT [dbo].[Crud] ([Sn], [Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (2, N'5XDCQU13AA', N'Hr', N'UserExt', N'用戶學經歷維護', 1, N'select u.*, d.name as DeptName from [User] u
join [Dept] d on u.DeptId=d.Id
order by u.Id', N'', 0, 1, 0, 1, 0, 1, 1, 1, CAST(N'2020-12-12T19:18:07.000' AS DateTime), CAST(N'2021-01-20T18:09:39.000' AS DateTime))
INSERT [dbo].[Crud] ([Sn], [Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (3, N'5Z5JPZR5HA', N'Hr', N'Leave', N'請假作業', 1, N'select l.* 
from Leave l
join [User] u on l.UserId=u.Id
join [User] u2 on l.AgentId=u2.Id
order by l.Id', N'', 1, 1, 1, 1, 0, 1, 1, 1, CAST(N'2021-02-18T01:11:15.000' AS DateTime), CAST(N'2021-02-20T11:53:27.000' AS DateTime))
INSERT [dbo].[Crud] ([Sn], [Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (4, N'D8J9A1MFLA', N'Db', N'Test', N'資料表維護2', 1, N'select 
    p.Code as ProjectCode, p.DbName,
    a.Code, a.Name, a.TranLog,
    '''' as _Fun, a.Status, 
    a.Id
from dbo.[Table] a
inner join dbo.Project p on p.Id=a.ProjectId
order by a.Id desc', N'a', 1, 1, 1, 1, 0, 0, 0, 1, CAST(N'2022-01-20T11:10:47.000' AS DateTime), CAST(N'2022-01-20T15:25:28.000' AS DateTime))
INSERT [dbo].[Crud] ([Sn], [Id], [ProjectId], [ProgCode], [ProgName], [LabelHori], [ReadSql], [TableAs], [HasCreate], [HasUpdate], [HasDelete], [HasView], [HasExport], [HasReset], [AuthType], [Status], [Created], [Revised]) VALUES (5, N'D8JNSZN7YA', N'Db', N'Table2', N'資料表維護2', 1, N'select 
    p.Code as ProjectCode, p.DbName,
    a.Code, a.Name, a.TranLog,
    '''' as _Fun, a.Status, 
    a.Id
from dbo.[Table] a
inner join dbo.Project p on p.Id=a.ProjectId
order by a.Id desc', N'', 1, 1, 1, 1, 0, 0, 0, 1, CAST(N'2022-01-20T16:11:25.000' AS DateTime), CAST(N'2022-05-06T00:18:24.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Crud] OFF
GO
SET IDENTITY_INSERT [dbo].[CrudEitem] ON 

INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (1, N'161D72LH2A', N'161D72LFNA', N'161D2APJUA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (2, N'161D72LJGA', N'161D72LFNA', N'161D2APL5A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (3, N'161D72LKWA', N'161D72LFNA', N'161D2APMKA', N'S', N'Assists', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (4, N'161D72LMAA', N'161D72LFNA', N'161D2APNZA', N'DEC', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (5, N'161D72LNQA', N'161D72LFNA', N'161D2APQAA', N'DEC', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (6, N'161D72LQ4A', N'161D72LFNA', N'161D2APRQA', N'F', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (7, N'161D72LRJA', N'161D72LFNA', N'161D2APT1A', N'TA', N'', 0, 1, 1, N'', N'', N'', N'2,6', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (8, N'161D72LSVA', N'161D72LFNA', N'161D2APUFA', N'C', N'啟用', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (9, N'161D72LU9A', N'161D72LFNA', N'161D2APX3A', N'RO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 8)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (10, N'161D72LVPA', N'161D72LFNA', N'161D2APYHA', N'RO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 9)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (11, N'5XEYLM3KAA', N'5XEYLM3AWA', N'5XD29XD5LA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (12, N'5XEYLM3N0A', N'5XEYLM3AWA', N'5XD29XD72A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (13, N'5XEYNLFSBA', N'5XEYLM3AWA', N'5XD29XD8JA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (14, N'5XEYNLFW4A', N'5XEYLM3AWA', N'5XD29XDARA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (15, N'5XEYNLFXLA', N'5XEYLM3AWA', N'5XD29XDBYA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (16, N'5XEYNLFYVA', N'5XEYNLFBNA', N'5XD29XDDDA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (17, N'5XEYNLG0EA', N'5XEYNLFBNA', N'5XD29XDF1A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (18, N'5XEYNLG1MA', N'5XEYNLFBNA', N'5XD29XDGTA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (19, N'5XEYNLG31A', N'5XEYNLFBNA', N'5XD29XDKZA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (20, N'5XEYNLG4KA', N'5XEYNLFBNA', N'5XD29XDN0A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (21, N'5XEYNLG5VA', N'5XEYNLFBNA', N'5XD29XDPVA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (22, N'5XEYNLG7CA', N'5XEYNLFBNA', N'5XD29XDUAA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (23, N'5XEYNLG8MA', N'5XEYNLFBNA', N'5XD29XDVWA', N'INT', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (24, N'5XEYNLGA4A', N'5XEYNLFBNA', N'5XD29XDXPA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 8)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (25, N'5XEYNLGBGA', N'5XEYNLFBNA', N'5XD29XE1AA', N'MO', N'1000', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 9)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (26, N'5XEYURNH5A', N'5XEYURMVMA', N'5XD29XGNVA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (27, N'5XEYURNJEA', N'5XEYURMVMA', N'5XD29XGR4A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (28, N'5XEYURNKSA', N'5XEYURMVMA', N'5XD29XGSRA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (29, N'5XEYURNN1A', N'5XEYURMVMA', N'5XD29XGV8A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (30, N'5XEYURNQBA', N'5XEYURMVMA', N'5XD29XGWUA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (31, N'5XEYURNRRA', N'5XEYURMVMA', N'5XD29XGZGA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (32, N'5XEYURNSWA', N'5XEYURMVMA', N'5XD29XH1CA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (33, N'5XEYURNX4A', N'5XEYURN5GA', N'5XD29XE2UA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (34, N'5XEYURNZNA', N'5XEYURN5GA', N'5XD29XE9LA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (35, N'5XEYURP18A', N'5XEYURN5GA', N'5XD29XGACA', N'SO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (36, N'5XEYURP33A', N'5XEYURN5GA', N'5XD29XFPMA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (37, N'5XEYURP56A', N'5XEYURN5GA', N'5XD29XFX1A', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (38, N'5XEYURP6HA', N'5XEYURN5GA', N'5XD29XFZXA', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (39, N'5XEYURP80A', N'5XEYURN5GA', N'5XD29XG6HA', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (40, N'5XEYURP9NA', N'5XEYURN5GA', N'5XD29XG8HA', N'S', N'LangLevels', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (41, N'5XEYURPBDA', N'5XEYURNAJA', N'5XD29XGC3A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (42, N'5XEYURPDTA', N'5XEYURNAJA', N'5XD29XGE9A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (43, N'5XEYURPFAA', N'5XEYURNAJA', N'5XD29XGG3A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (44, N'5XEYURPGVA', N'5XEYURNAJA', N'5XD29XGHSA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (45, N'5XEYURPN5A', N'5XEYURNAJA', N'5XD29XGKPA', N'F', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (46, N'5XEYURPPJA', N'5XEYURNC2A', N'5XD29XH4HA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (47, N'5XEYURPQVA', N'5XEYURNC2A', N'5XD29XH6EA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (48, N'5XEYURPT8A', N'5XEYURNC2A', N'5XD29XHC2A', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (49, N'5XEYURPWGA', N'5XEYURNC2A', N'5XD29XH8EA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (50, N'5XEYURPYZA', N'5XEYURNC2A', N'5XD29XHA2A', N'TA', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (51, N'5XLQA0CC6A', N'5XEYURNC2A', N'5XLQ99LV9A', N'SO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (52, N'5Z642A9Q8A', N'5Z642A9LLA', N'5Z5BHXMCMA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (53, N'5Z642A9QYA', N'5Z642A9LLA', N'5Z5BHXME5A', N'S', N'Users', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (54, N'5Z642A9RUA', N'5Z642A9LLA', N'5Z5BHXMFJA', N'S', N'Users', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (55, N'5Z642A9T0A', N'5Z642A9LLA', N'5Z5BHXMGLA', N'S', N'LeaveTypes', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (56, N'5Z642A9TYA', N'5Z642A9LLA', N'5Z5BHXMJ7A', N'DT', N'', 1, 1, 1, N'', N'', N'', N'2,4', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (57, N'5Z642A9ULA', N'5Z642A9LLA', N'5Z5BHXMKSA', N'DT', N'', 1, 1, 1, N'', N'', N'', N'2,4', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (58, N'5Z642A9VKA', N'5Z642A9LLA', N'5Z5BHXMM5A', N'DEC', N'', 1, 1, 1, N'', N'', N'', N'2,1', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (59, N'5Z642A9XHA', N'5Z642A9LLA', N'5Z5BHXMS5A', N'RO', N'FlowSignStatusName', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (60, N'5Z642A9YGA', N'5Z642A9LLA', N'5Z5BHXMU0A', N'C', N'啟用', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 8)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (61, N'5Z642A9ZHA', N'5Z642A9LLA', N'5Z5BHXMVTA', N'RO', N'CreatorName', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 9)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (62, N'5Z642AA1FA', N'5Z642A9LLA', N'5Z5BHXMXVA', N'RO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 10)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (63, N'5Z642AA2HA', N'5Z642A9LLA', N'5Z5BHXMZRA', N'RO', N'ReviserName', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 11)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (64, N'5Z642AA37A', N'5Z642A9LLA', N'5Z5BHXN1KA', N'RO', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 12)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (65, N'D8J9A1TH3A', N'D8J9A1SKGA', N'5X9RB3GPHA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (66, N'D8J9A1TZHA', N'D8J9A1SKGA', N'5X9RB3GRZA', N'S', N'Projects', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (67, N'D8J9A1ULAA', N'D8J9A1SKGA', N'5YFVJXCCVA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (68, N'D8J9A1UXFA', N'D8J9A1SKGA', N'5X9RB3GT3A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (69, N'D8J9A1VD2A', N'D8J9A1SKGA', N'D58FUTT5TA', N'C', N'是', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (70, N'D8J9A1VVNA', N'D8J9A1SKGA', N'5X9RB3GZ3A', N'C', N'啟用', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (71, N'D8J9A1WAHA', N'D8J9A1T1AA', N'5X9RB37ZKA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (72, N'D8J9A1WRSA', N'D8J9A1T1AA', N'5X9RB381FA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (73, N'D8J9A1X7LA', N'D8J9A1T1AA', N'5YFVJXBYXA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (74, N'D8J9A1XP4A', N'D8J9A1T1AA', N'5X9RB3845A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (75, N'D8J9A1Y4LA', N'D8J9A1T1AA', N'5X9RB3890A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (76, N'D8J9A1YL9A', N'D8J9A1T1AA', N'5X9RB38APA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (77, N'D8J9A1Z1FA', N'D8J9A1T1AA', N'5X9RB38E9A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (78, N'D8J9A1ZHGA', N'D8J9A1T1AA', N'5X9RB38G3A', N'INT', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (79, N'D8J9A1ZZCA', N'D8J9A1T1AA', N'5X9RB38HTA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 8)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (80, N'D8J9A20FPA', N'D8J9A1T1AA', N'5X9RB38KTA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 9)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (81, N'D8JNSZTP0A', N'D8JNSZSWHA', N'5X9RB3GPHA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (82, N'D8JNSZU55A', N'D8JNSZSWHA', N'5X9RB3GRZA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (83, N'D8JNSZUNGA', N'D8JNSZSWHA', N'5YFVJXCCVA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (84, N'D8JNSZV2FA', N'D8JNSZSWHA', N'5X9RB3GT3A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (85, N'D8JNSZVJXA', N'D8JNSZSWHA', N'D58FUTT5TA', N'C', N'是', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (86, N'D8JNSZW0MA', N'D8JNSZSWHA', N'5X9RB3GZ3A', N'C', N'正常', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (87, N'D8JNSZWECA', N'D8JNSZT7JA', N'5X9RB37ZKA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 0)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (88, N'D8JNSZWXHA', N'D8JNSZT7JA', N'5X9RB381FA', N'H', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 1)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (89, N'D8JNSZXAKA', N'D8JNSZT7JA', N'5YFVJXBYXA', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 2)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (90, N'D8JNSZXS2A', N'D8JNSZT7JA', N'5X9RB3845A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 3)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (91, N'D8JNSZY7TA', N'D8JNSZT7JA', N'5X9RB3890A', N'T', N'', 1, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 4)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (92, N'D8JNSZYP2A', N'D8JNSZT7JA', N'5X9RB38APA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 5)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (93, N'D8JNSZZ72A', N'D8JNSZT7JA', N'5X9RB38E9A', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 6)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (94, N'D8JNSZZNVA', N'D8JNSZT7JA', N'5X9RB38G3A', N'INT', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 7)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (95, N'D8JNT002PA', N'D8JNSZT7JA', N'5X9RB38HTA', N'T', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 8)
INSERT [dbo].[CrudEitem] ([Sn], [Id], [EtableId], [ColumnId], [EitemType], [ItemData], [Required], [HasCreate], [HasUpdate], [PlaceHolder], [DefaultValue], [PosGroup], [LayoutCols], [Width], [CheckType], [CheckData], [Sort]) VALUES (96, N'D8JNT00JHA', N'D8JNSZT7JA', N'5X9RB38KTA', N'C', N'', 0, 1, 1, N'', N'', N'', N'', 0, N'0', N'', 9)
SET IDENTITY_INSERT [dbo].[CrudEitem] OFF
GO
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'161D72LFNA', N'161D2WBJ8A', N'161D2APDCA', N'Id', N'', N'1', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYLM3AWA', N'5XDCQU13AA', N'5XD29XC3BA', N'Id', N'', N'0', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYNLFBNA', N'5XDCQU13AA', N'5XD29XC6LA', N'Id', N'UserId', N'0', N'', 2, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURMVMA', N'5XDCQU13AA', N'5XD29XCAWA', N'Id', N'UserId', N'0', N'', 1, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURN5GA', N'5XDCQU13AA', N'5XD29XC7WA', N'Id', N'UserId', N'0', N'Sort', 3, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURNAJA', N'5XDCQU13AA', N'5XD29XC9AA', N'Id', N'UserId', N'0', N'', 4, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5XEYURNC2A', N'5XDCQU13AA', N'5XD29XCDPA', N'Id', N'UserId', N'0', N'', 5, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'5Z642A9LLA', N'5Z5JPZR5HA', N'5Z5BHXK86A', N'Id', N'', N'1', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'D8J9A1SKGA', N'D8J9A1MFLA', N'5X9RB373ZA', N'Id', N'', N'0', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'D8J9A1T1AA', N'D8J9A1MFLA', N'5X9RB36MYA', N'Id', N'TableId', N'0', N'', 1, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'D8JNSZSWHA', N'D8JNSZN7YA', N'5X9RB373ZA', N'Id', N'', N'0', N'', 0, 0)
INSERT [dbo].[CrudEtable] ([Id], [CrudId], [TableId], [PkeyFid], [FkeyFid], [Col4], [OrderBy], [Sort], [HalfWidth]) VALUES (N'D8JNSZT7JA', N'D8JNSZN7YA', N'5X9RB36MYA', N'Id', N'TableId', N'0', N'', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[CrudQitem] ON 

INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (1, N'161D72L4QA', N'161D2WBJ8A', N'161D2APL5A', N'', N'T', N'', N'Equal', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (2, N'5XDCQUBPRA', N'5XDCQU13AA', N'5XD29XD72A', N'', N'T', N'', N'Like', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (3, N'5XDCS43M4A', N'5XDCQU13AA', N'5XD29XD8JA', N'', N'T', N'', N'Like', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (4, N'5XDCS43PJA', N'5XDCQU13AA', N'5XD29XDARA', N'', N'S', N'Depts', N'Equal', 0, 0, N'', N'', 2)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (5, N'5Z5ZUACK6A', N'5Z5JPZR5HA', N'5Z5BHXMGLA', N'', N'S', N'LeaveTypes', N'Equal', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (6, N'5Z5ZUACL6A', N'5Z5JPZR5HA', N'5Z5BHXMS5A', N'', N'S', N'SignStatuses', N'Equal', 0, 0, N'', N'', 2)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (7, N'5Z87DRL40A', N'5Z5JPZR5HA', N'5Z5BHXMJ7A', N'', N'D', N'', N'InRange', 1, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (8, N'D8J9A1MWSA', N'D8J9A1MFLA', N'5X9RB3GRZA', N'', N'S', N'Projects', N'Equal', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (9, N'D8J9A1NEQA', N'D8J9A1MFLA', N'5YFVJXCCVA', N'', N'T', N'', N'Like', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (10, N'D8J9A1NUSA', N'D8J9A1MFLA', N'5X9RB3GT3A', N'', N'T', N'', N'Like', 0, 0, N'', N'', 2)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (11, N'D8JEACLSTA', N'D8J9A1MFLA', N'D58FUTT5TA', N'', N'S', N'YesNos', N'Equal', 0, 0, N'', N'', 3)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (12, N'D8JNSZNM8A', N'D8JNSZN7YA', N'5X9RB3GRZA', N'', N'S', N'Projects', N'Equal', 0, 0, N'', N'', 0)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (13, N'D8JNSZP38A', N'D8JNSZN7YA', N'5YFVJXCCVA', N'', N'T', N'', N'Like', 0, 0, N'', N'', 1)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (14, N'D8JNSZPJJA', N'D8JNSZN7YA', N'5X9RB3GT3A', N'', N'T', N'', N'Like', 0, 0, N'', N'', 2)
INSERT [dbo].[CrudQitem] ([Sn], [Id], [CrudId], [ColumnId], [TableAs], [QitemType], [ItemData], [Op], [IsRange], [IsFind2], [PosGroup], [LayoutCols], [Sort]) VALUES (15, N'D8JNSZQ05A', N'D8JNSZN7YA', N'D58FUTT5TA', N'', N'S', N'YesNos', N'Equal', 0, 0, N'', N'', 3)
SET IDENTITY_INSERT [dbo].[CrudQitem] OFF
GO
SET IDENTITY_INSERT [dbo].[CrudRitem] ON 

INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (1, N'161D72L61A', N'161D2WBJ8A', N'Name', N'活動名稱', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (2, N'161D72L7FA', N'161D2WBJ8A', N'AssistId', N'贊助來源', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (3, N'161D72L8SA', N'161D2WBJ8A', N'PlanCoin', N'預計使用幣數', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (4, N'161D72LA6A', N'161D2WBJ8A', N'UseCoin', N'實際使用幣數', 0, N'0', 3)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (5, N'161D72LBLA', N'161D2WBJ8A', N'Status', N'資料狀態', 0, N'SN', 4)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (6, N'161D72LCXA', N'161D2WBJ8A', N'Created', N'建檔日期', 0, N'0', 5)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (7, N'161D72LE8A', N'161D2WBJ8A', N'_Fun', N'維護', 0, N'CF', 6)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (8, N'5XEXK6A9SA', N'5XDCQU13AA', N'Account', N'帳號', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (9, N'5XEXK6ASFA', N'5XDCQU13AA', N'Name', N'使用者名稱', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (10, N'5XEXK6B26A', N'5XDCQU13AA', N'DeptName', N'部門', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (11, N'5XEXK6B5MA', N'5XDCQU13AA', N'Status', N'資料狀態', 0, N'SS', 3)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (12, N'5XEXK6B9RA', N'5XDCQU13AA', N'_Fun', N'維護', 0, N'CF', 4)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (13, N'5Z5ZUACLWA', N'5Z5JPZR5HA', N'UserId', N'請假人', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (14, N'5Z5ZUACMUA', N'5Z5JPZR5HA', N'AgentId', N'代理人', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (15, N'5Z5ZUACP0A', N'5Z5JPZR5HA', N'LeaveType', N'假別', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (16, N'5Z5ZUACPQA', N'5Z5JPZR5HA', N'StartTime', N'開始時間', 0, N'DT', 3)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (17, N'5Z5ZUACQUA', N'5Z5JPZR5HA', N'EndTime', N'結束時間', 0, N'DT', 4)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (18, N'5Z5ZUACRPA', N'5Z5JPZR5HA', N'Hours', N'請假時數', 0, N'0', 5)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (19, N'5Z5ZUACTKA', N'5Z5JPZR5HA', N'FlowSignStatus', N'流程簽核狀態', 0, N'0', 6)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (20, N'5Z5ZUACUHA', N'5Z5JPZR5HA', N'Created', N'Created', 0, N'DT', 7)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (21, N'D8J9A1PT9A', N'D8J9A1MFLA', N'ProjectCode', N'專案', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (22, N'D8J9A1Q72A', N'D8J9A1MFLA', N'Code', N'資料表代碼', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (23, N'D8J9A1QPKA', N'D8J9A1MFLA', N'Name', N'資料表名稱', 0, N'0', 3)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (24, N'D8J9A1R5AA', N'D8J9A1MFLA', N'TranLog', N'是否記錄交易', 0, N'YE', 4)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (25, N'D8J9A1RMEA', N'D8J9A1MFLA', N'_Fun', N'維護', 0, N'CF', 5)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (26, N'D8J9A1S3AA', N'D8J9A1MFLA', N'Status', N'資料狀態', 0, N'SN', 6)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (27, N'D8JAARUJEA', N'D8J9A1MFLA', N'DbName', N'資料庫', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (28, N'D8JNSZQGBA', N'D8JNSZN7YA', N'ProjectCode', N'專案Id', 0, N'0', 0)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (29, N'D8JNSZQZ8A', N'D8JNSZN7YA', N'Code', N'資料表代碼', 0, N'0', 2)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (30, N'D8JNSZRD6A', N'D8JNSZN7YA', N'Name', N'資料表名稱', 0, N'0', 3)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (31, N'D8JNSZRV4A', N'D8JNSZN7YA', N'TranLog', N'是否記錄交易', 0, N'YE', 4)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (32, N'D8JNSZSBAA', N'D8JNSZN7YA', N'Status', N'資料狀態', 0, N'SN', 6)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (33, N'D8JPP0VNCA', N'D8JNSZN7YA', N'DbName', N'資料庫名稱', 0, N'0', 1)
INSERT [dbo].[CrudRitem] ([Sn], [Id], [CrudId], [ColumnCode], [Name], [Width], [RitemType], [Sort]) VALUES (34, N'D8JPP0W6JA', N'D8JNSZN7YA', N'_Fun', N'維護', 0, N'CF', 5)
SET IDENTITY_INSERT [dbo].[CrudRitem] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([Sn], [Id], [Code], [DbName], [DbType], [ProjectPath], [ConnectStr], [Status], [FromTmpTable]) VALUES (1, N'1616XFNCSA', N'Test_F2a', N'Test_F2', 0, N'(empty)', N'(empty)', 0, 1)
INSERT [dbo].[Project] ([Sn], [Id], [Code], [DbName], [DbType], [ProjectPath], [ConnectStr], [Status], [FromTmpTable]) VALUES (2, N'161D29Q5SA', N'EarthIssue', N'Earth', 0, N'D:\_project2\EarthIssue', N'data source=(localdb)\mssqllocaldb;initial catalog=Earth;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1, 0)
INSERT [dbo].[Project] ([Sn], [Id], [Code], [DbName], [DbType], [ProjectPath], [ConnectStr], [Status], [FromTmpTable]) VALUES (3, N'165R6ANSGA', N'Northwind', N'Northwind', 0, N'(empty)', N'data source=(localdb)\mssqllocaldb;initial catalog=Northwind;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1, 0)
INSERT [dbo].[Project] ([Sn], [Id], [Code], [DbName], [DbType], [ProjectPath], [ConnectStr], [Status], [FromTmpTable]) VALUES (4, N'D58WWHCYQA', N'BaoAdm', N'Bao', 0, N'd:\_projects\BaoAdm', N'data source=(localdb)\mssqllocaldb;initial catalog=Bao;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1, 0)
INSERT [dbo].[Project] ([Sn], [Id], [Code], [DbName], [DbType], [ProjectPath], [ConnectStr], [Status], [FromTmpTable]) VALUES (5, N'Db', N'DbAdm', N'Db', 0, N'D:\_project2\DbAdm', N'data source=(localdb)\mssqllocaldb;initial catalog=Db;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1, 0)
INSERT [dbo].[Project] ([Sn], [Id], [Code], [DbName], [DbType], [ProjectPath], [ConnectStr], [Status], [FromTmpTable]) VALUES (6, N'Hr', N'HrAdm', N'Hr', 0, N'D:\_project2\HrAdm', N'data source=(localdb)\mssqllocaldb;initial catalog=Hr;integrated security=True;multipleactiveresultsets=True;max pool size=1000;', 1, 0)
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[Table] ON 

INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (1, N'1616P03AXA', N'1616NY85WA', N'_EFMigrationsHistory', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (2, N'1616P03CSA', N'1616NY85WA', N'AirConstructionRecord', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (3, N'1616P03E3A', N'1616NY85WA', N'AirInspect', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (4, N'1616P03FHA', N'1616NY85WA', N'AirInstall', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (5, N'1616P03GUA', N'1616NY85WA', N'AirMaintain', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (6, N'1616P03J5A', N'1616NY85WA', N'AirVisuallyInspect', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (7, N'1616P03KGA', N'1616NY85WA', N'Area', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (8, N'1616P03LWA', N'1616NY85WA', N'AuthRoles', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (9, N'1616P03NAA', N'1616NY85WA', N'AuthUser', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (10, N'1616P03PMA', N'1616NY85WA', N'BillDate', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (11, N'1616P03QYA', N'1616NY85WA', N'CloseReason', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (12, N'1616P03S9A', N'1616NY85WA', N'CloseReasonDetail', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (13, N'1616P03TLA', N'1616NY85WA', N'Contract', N'合約主檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (14, N'1616P03V0A', N'1616NY85WA', N'Department', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (15, N'1616P03WEA', N'1616NY85WA', N'District', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (16, N'1616P03XRA', N'1616NY85WA', N'DocumentSetting', N'資料設定主檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (17, N'1616P03YZA', N'1616NY85WA', N'Employee', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (18, N'1616P040DA', N'1616NY85WA', N'EmployeeArea', N'員工區域主檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (19, N'1616P041TA', N'1616NY85WA', N'EmployeeAreaDetail', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (20, N'1616P0434A', N'1616NY85WA', N'EmployeeWorkClassDetail', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (21, N'1616P044FA', N'1616NY85WA', N'EnergyAreaMapping', N'能源區域關聯表', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (22, N'1616P045YA', N'1616NY85WA', N'EnergyDcuAbnormal', N'能源Dcu異常主檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (23, N'1616P0479A', N'1616NY85WA', N'EnergyDcuMaster', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (24, N'1616P048PA', N'1616NY85WA', N'EnergyDcuSurvey', N'能源Dcu會勘', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (25, N'1616P04A0A', N'1616NY85WA', N'EnergyFanAbnormal', N'能源Fan異常主檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (26, N'1616P04BBA', N'1616NY85WA', N'EnergyFanMaster', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (27, N'1616P04CRA', N'1616NY85WA', N'EnergyFanSurvey', N'能源Fan會勘', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (28, N'1616P04E2A', N'1616NY85WA', N'Errorlog', N'異常錯誤Log', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (29, N'1616P04FAA', N'1616NY85WA', N'Location', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (30, N'1616P04GQA', N'1616NY85WA', N'LoginLog', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (31, N'1616P04J4A', N'1616NY85WA', N'OrderImg', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (32, N'1616P04KFA', N'1616NY85WA', N'PowerInstallDcu', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (33, N'1616P04LVA', N'1616NY85WA', N'PowerInstallFan', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (34, N'1616P04N6A', N'1616NY85WA', N'PowerMaintainDcu', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (35, N'1616P04PLA', N'1616NY85WA', N'PowerMaintainFan', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (36, N'1616P04QXA', N'1616NY85WA', N'PriceSet', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (37, N'1616P04S8A', N'1616NY85WA', N'PriceSetDetail', N'計價明細檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (38, N'1616P04TNA', N'1616NY85WA', N'QuickScreeningRecord', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (39, N'1616P04V2A', N'1616NY85WA', N'sensor', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (40, N'1616P04WDA', N'1616NY85WA', N'Test', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (41, N'1616P04XTA', N'1616NY85WA', N'WorkClass', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (42, N'1616P04Z4A', N'1616NY85WA', N'WorkDispatch', N'工單派修原因主檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (43, N'1616P050FA', N'1616NY85WA', N'WorkOrder', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (44, N'1616P051VA', N'1616NY85WA', N'WorkOrderDcu', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (45, N'1616P0539A', N'1616NY85WA', N'WorkOrderFan', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (46, N'1616P054LA', N'1616NY85WA', N'WorkOrderNo', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (47, N'1616P0560A', N'1616NY85WA', N'WorkOrderPowerNo', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (48, N'1616P057BA', N'1616NY85WA', N'WorkProcedure', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (49, N'1616P058NA', N'1616NY85WA', N'WorkStatusMapping', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (50, N'1616ZCDM6A', N'1616XFNCSA', N'AuthRoles', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (51, N'1616ZCDNLA', N'1616XFNCSA', N'CustomerContract', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (52, N'1616ZCDQ0A', N'1616XFNCSA', N'CustomerMapping', N'客戶對應設定', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (53, N'1616ZCDRBA', N'1616XFNCSA', N'CustomerRepair', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (54, N'1616ZCDSNA', N'1616XFNCSA', N'Department', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (55, N'1616ZCDTZA', N'1616XFNCSA', N'Employee', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (56, N'1616ZCDVAA', N'1616XFNCSA', N'EmployeeArea', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (57, N'1616ZCDWQA', N'1616XFNCSA', N'EmployeeAuthWork', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (58, N'1616ZCDY1A', N'1616XFNCSA', N'Errorlog', N'異常錯誤Log', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (59, N'1616ZCDZFA', N'1616XFNCSA', N'MixCategories', N'各類別主檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (60, N'1616ZCE0VA', N'1616XFNCSA', N'WorkClass', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (61, N'1616ZCE29A', N'1616XFNCSA', N'WorkOrderImage', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (62, N'1616ZCE3PA', N'1616XFNCSA', N'WorkOrderNo', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (63, N'1616ZCE56A', N'1616XFNCSA', N'WorkProcedure', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (64, N'1616ZCE6HA', N'1616XFNCSA', N'WorkResponse', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (65, N'161D2APDCA', N'161D29Q5SA', N'Act', N'公益活動', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (66, N'165R6BBPBA', N'165R6ANSGA', N'Categories', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (67, N'165R6BBQRA', N'165R6ANSGA', N'CustomerCustomerDemo', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (68, N'165R6BBS2A', N'165R6ANSGA', N'CustomerDemographics', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (69, N'165R6BBTDA', N'165R6ANSGA', N'Customers', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (70, N'165R6BBUQA', N'165R6ANSGA', N'Employees', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (71, N'165R6BBW4A', N'165R6ANSGA', N'EmployeeTerritories', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (72, N'165R6BBXFA', N'165R6ANSGA', N'Order Details', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (73, N'165R6BBYVA', N'165R6ANSGA', N'Orders', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (74, N'165R6BC06A', N'165R6ANSGA', N'Products', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (75, N'165R6BC2XA', N'165R6ANSGA', N'Region', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (76, N'165R6BC48A', N'165R6ANSGA', N'Shippers', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (77, N'165R6BC5KA', N'165R6ANSGA', N'Suppliers', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (78, N'165R6BC6ZA', N'165R6ANSGA', N'Territories', N'', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (79, N'5X9RB36MYA', N'Db', N'Column', N'欄位檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (80, N'5X9RB36PRA', N'Db', N'Crud', N'CRUD設定', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (81, N'5X9RB36TCA', N'Db', N'CrudEitem', N'CRUD維護欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (82, N'5X9RB36VLA', N'Db', N'CrudEtable', N'CRUD維護資料表', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (83, N'5X9RB36XEA', N'Db', N'CrudQitem', N'CRUD查詢欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (84, N'5X9RB36ZCA', N'Db', N'CrudRitem', N'CRUD查詢結果欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (85, N'5X9RB3720A', N'Db', N'Project', N'專案檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (86, N'5X9RB373ZA', N'Db', N'Table', N'資料表檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (87, N'5XD29XBSMA', N'Hr', N'Dept', N'部門', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (88, N'5XD29XC3BA', N'Hr', N'User', N'使用者', N'', 1, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (89, N'5XD29XC6LA', N'Hr', N'UserJob', N'工作經驗', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (90, N'5XD29XC7WA', N'Hr', N'UserLang', N'語言能力', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (91, N'5XD29XC9AA', N'Hr', N'UserLicense', N'用戶證照', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (92, N'5XD29XCAWA', N'Hr', N'UserSchool', N'學歷資料', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (93, N'5XD29XCDPA', N'Hr', N'UserSkill', N'專業技能', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (94, N'5Z5BHXK86A', N'Hr', N'Leave', N'假單', N'', 1, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (95, N'D58J2RM39A', N'Db', N'XpCode', N'雜項檔', N'', 1, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (96, N'D58LXKZJUA', N'Hr', N'Cms', N'CMS', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (97, N'D58LXL00BA', N'Hr', N'CustInput', N'自訂輸入欄位', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (98, N'D58LXL0GHA', N'Hr', N'XpCode', N'雜項檔', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (99, N'D58LXL0Y0A', N'Hr', N'XpEasyRpt', N'簡單報表', N'', 0, 1)
GO
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (100, N'D58LXL1D4A', N'Hr', N'XpFlow', N'流程', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (101, N'D58LXL1VTA', N'Hr', N'XpFlowLine', N'流程線', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (102, N'D58LXL2A8A', N'Hr', N'XpFlowNode', N'流程節點', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (103, N'D58LXL2SLA', N'Hr', N'XpFlowSign', N'流程簽核資料', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (104, N'D58LXL378A', N'Hr', N'XpImportLog', N'匯入資料', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (105, N'D58LXL3N4A', N'Hr', N'XpProg', N'系統功能', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (106, N'D58LXL44TA', N'Hr', N'XpRole', N'角色', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (107, N'D58LXL4KKA', N'Hr', N'XpRoleProg', N'角色功能', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (108, N'D58LXL50NA', N'Hr', N'XpTranLog', N'交易記錄', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (109, N'D58LXL5FUA', N'Hr', N'XpUserRole', N'用戶角色', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (110, N'D58WX60WVA', N'D58WWHCYQA', N'Attend', N'手機用戶參加尋寶資料', N'', 0, 0)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (111, N'D58WX61CCA', N'D58WWHCYQA', N'Bao', N'尋寶資料', N'', 1, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (112, N'D58WX61TFA', N'D58WWHCYQA', N'Cms', N'CMS內容', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (113, N'D58WX627KA', N'D58WWHCYQA', N'Reply', N'用戶答題資料', N'', 0, 0)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (114, N'D58WX62PGA', N'D58WWHCYQA', N'Stage', N'尋寶關卡', N'', 1, 0)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (115, N'D58WX634WA', N'D58WWHCYQA', N'User', N'管理系統用戶', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (116, N'D58WX63L5A', N'D58WWHCYQA', N'UserApp', N'手機用戶資料', N'', 1, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (117, N'D58WX6485A', N'D58WWHCYQA', N'UserCust', N'客戶資料', N'', 1, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (118, N'D8ZRXETU8A', N'D58WWHCYQA', N'BaoAttend', N'App用戶參加者資料', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (119, N'D8ZRXEUAEA', N'D58WWHCYQA', N'BaoReply', N'用戶答題資料', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (120, N'D8ZRXEUS7A', N'D58WWHCYQA', N'BaoStage', N'尋寶關卡', N'', 0, 1)
INSERT [dbo].[Table] ([Sn], [Id], [ProjectId], [Code], [Name], [Note], [TranLog], [Status]) VALUES (121, N'D9QTSQF55A', N'D58WWHCYQA', N'XpCode', N'雜項檔', N'', 0, 1)
SET IDENTITY_INSERT [dbo].[Table] OFF
GO
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'AuthRoles', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'RoleName', N'AuthRoles', N'varchar(45)', 1, N'', 2, N'角色名稱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'CustomerContract', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ContractNo', N'CustomerContract', N'varchar(20)', 0, N'', 2, N'合約編號')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProjectNo', N'CustomerContract', N'varchar(20)', 0, N'', 3, N'專案代碼')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProjectName', N'CustomerContract', N'varchar(30)', 1, N'', 4, N'專案名稱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'TaxId', N'CustomerContract', N'char(8)', 0, N'', 5, N'客戶統一編號')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Name', N'CustomerContract', N'varchar(50)', 1, N'', 6, N'客戶名稱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Address', N'CustomerContract', N'varchar(100)', 1, N'', 7, N'公司地址')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Telephone', N'CustomerContract', N'varchar(20)', 1, N'', 8, N'電話')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Email', N'CustomerContract', N'varchar(100)', 1, N'', 9, N'Email')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ContractStart', N'CustomerContract', N'datetime', 0, N'', 10, N'合約有效期-起')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ContractEnd', N'CustomerContract', N'datetime', 0, N'', 11, N'合約有效期-迄')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ContactName', N'CustomerContract', N'varchar(50)', 1, N'', 12, N'客戶聯絡窗口')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'FhProductDesc', N'CustomerContract', N'varchar(100)', 1, N'', 13, N'富鴻網產品描述')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'FhContactName', N'CustomerContract', N'varchar(50)', 1, N'', 14, N'富鴻網聯絡窗口')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProductPDM', N'CustomerContract', N'varchar(50)', 1, N'', 15, N'富鴻網產品PDM')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProductPJM', N'CustomerContract', N'varchar(50)', 1, N'', 16, N'富鴻網產品PJM')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AutoRepair', N'CustomerContract', N'tinyint(1)', 1, N'0', 17, N'啟動自動派維修工單')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'CustomerMapping', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'UniNumber', N'CustomerMapping', N'varchar(20)', 0, N'', 2, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CategoryName', N'CustomerMapping', N'varchar(50)', 1, N'', 3, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'MixCategoryId', N'CustomerMapping', N'varchar(50)', 1, N'', 4, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'CustomerRepair', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkOrderNo', N'CustomerRepair', N'varchar(20)', 0, N'', 2, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CustomerContractId', N'CustomerRepair', N'varchar(50)', 0, N'', 3, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'RepairDateTime', N'CustomerRepair', N'datetime', 0, N'', 4, N'報修日期、時間')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProblemMain', N'CustomerRepair', N'varchar(50)', 0, N'', 5, N'障礙主類')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProblemSub', N'CustomerRepair', N'varchar(50)', 0, N'', 6, N'障礙次類')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProblemDesc', N'CustomerRepair', N'varchar(100)', 1, N'', 7, N'描述障礙內容')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ContactrName', N'CustomerRepair', N'varchar(100)', 1, N'', 8, N'描述障礙內容')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ContactrTel', N'CustomerRepair', N'varchar(100)', 1, N'', 9, N'描述障礙內容')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ContactrEmail', N'CustomerRepair', N'varchar(100)', 1, N'', 10, N'描述障礙內容')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'VideoPath', N'CustomerRepair', N'varchar(200)', 1, N'', 11, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'Department', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Dept', N'Department', N'varchar(50)', 1, N'', 2, N'部門')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Team', N'Department', N'varchar(50)', 1, N'', 3, N'組別')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'OriginSource', N'Department', N'varchar(50)', 1, N'', 4, N'原始來源')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'EmployeeId', N'Employee', N'varchar(20)', 0, N'', 1, N'帳號')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Name', N'Employee', N'varchar(30)', 1, N'', 2, N'員工姓名')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ENGName', N'Employee', N'varchar(30)', 1, N'', 3, N'員工英文名稱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Phone', N'Employee', N'varchar(20)', 1, N'', 4, N'聯絡電話')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Email', N'Employee', N'varchar(50)', 1, N'', 5, N'電子信箱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'PWD', N'Employee', N'varchar(50)', 1, N'', 6, N'密碼')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Origin', N'Employee', N'varchar(50)', 1, N'', 7, N'來源')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'PhoneToken', N'Employee', N'varchar(100)', 1, N'', 8, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'DepartmentId', N'Employee', N'varchar(50)', 0, N'', 9, N'部門')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'EmployeeStatus', N'Employee', N'int(11)', 1, N'', 10, N'帳號狀態')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'EmployeeArea', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CityCode', N'EmployeeArea', N'varchar(45)', 1, N'', 2, N'城市代碼')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CityName', N'EmployeeArea', N'varchar(45)', 1, N'', 3, N'城市名稱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AreaCode', N'EmployeeArea', N'varchar(45)', 1, N'', 4, N'郵遞區號')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AreaName', N'EmployeeArea', N'varchar(45)', 1, N'', 5, N'區域名稱(鄉鎮市區)')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'SerialNum', N'EmployeeArea', N'int(11)', 1, N'0', 6, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'EmployeeAuthWork', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'EmployeeId', N'EmployeeAuthWork', N'varchar(20)', 0, N'', 2, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkCategoryId', N'EmployeeAuthWork', N'varchar(50)', 1, N'', 3, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'RegionWorkClass', N'EmployeeAuthWork', N'varchar(10)', 1, N'', 4, N'Region/WorkClass')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'EmployeeAreaId', N'EmployeeAuthWork', N'varchar(50)', 1, N'', 5, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkClassId', N'EmployeeAuthWork', N'varchar(50)', 1, N'', 6, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AuthRolesId', N'EmployeeAuthWork', N'varchar(50)', 1, N'', 7, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CanCreate', N'EmployeeAuthWork', N'tinyint(1)', 1, N'', 8, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CanRead', N'EmployeeAuthWork', N'tinyint(1)', 1, N'', 9, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CanDelete', N'EmployeeAuthWork', N'tinyint(1)', 1, N'', 10, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CanUpdate', N'EmployeeAuthWork', N'tinyint(1)', 1, N'', 11, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'Errorlog', N'varchar(36)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'DateTime', N'Errorlog', N'datetime', 0, N'', 2, N'發生時間')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'EmployeeId', N'Errorlog', N'varchar(45)', 0, N'', 3, N'登入帳號')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Environment', N'Errorlog', N'varchar(45)', 0, N'', 4, N'環境 (Web、App)')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ExceptionPath', N'Errorlog', N'varchar(100)', 0, N'', 5, N'例外發生位置')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ExceptionMessageJson', N'Errorlog', N'varchar(1000)', 0, N'', 6, N'例外訊息Json')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'MixCategories', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Category', N'MixCategories', N'varchar(30)', 1, N'', 2, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ColumnDescribe', N'MixCategories', N'varchar(50)', 1, N'', 3, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ColumnValue', N'MixCategories', N'varchar(50)', 1, N'', 4, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ColumnType', N'MixCategories', N'varchar(50)', 1, N'', 5, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ParentCategoryId', N'MixCategories', N'varchar(50)', 1, N'', 6, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ColumnSort', N'MixCategories', N'int(11)', 1, N'', 7, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'WorkClass', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ClassName', N'WorkClass', N'varchar(45)', 1, N'', 2, N'類別名稱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ClassPath', N'WorkClass', N'varchar(45)', 1, N'', 3, N'類別路徑')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ParentId', N'WorkClass', N'varchar(50)', 1, N'', 4, N'上層類別 Id')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Sort', N'WorkClass', N'int(11)', 1, N'0', 5, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'WorkOrderImage', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkOrderId', N'WorkOrderImage', N'varchar(50)', 0, N'', 2, N'工單號碼 Id')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ImageSort', N'WorkOrderImage', N'int(11)', 0, N'', 3, N'影像排序')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ImageType', N'WorkOrderImage', N'varchar(50)', 1, N'', 4, N'影像分類')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ImagePath', N'WorkOrderImage', N'varchar(100)', 0, N'', 5, N'影像名稱')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'WorkOrderNo', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Product', N'WorkOrderNo', N'varchar(1)', 0, N'', 2, N'工單字軌')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkNo', N'WorkOrderNo', N'int(11)', 0, N'', 3, N'工單單日流水號')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'MaxNo', N'WorkOrderNo', N'int(11)', 0, N'', 4, N'單日流水號最大值')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'MinNo', N'WorkOrderNo', N'int(11)', 0, N'', 5, N'單日流水號最小值')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Date', N'WorkOrderNo', N'datetime', 0, N'', 6, N'工單號碼分配日期')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'WorkProcedure', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkOrderId', N'WorkProcedure', N'varchar(50)', 0, N'', 2, N'工單號碼 Id')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AuditorDate', N'WorkProcedure', N'datetime', 1, N'', 3, N'審核時間')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AuditorDescription', N'WorkProcedure', N'varchar(100)', 1, N'', 4, N'審核結果說明')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AuditorEmployeeId', N'WorkProcedure', N'varchar(20)', 1, N'', 5, N'審核人員 Id ')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CheckPoint', N'WorkProcedure', N'varchar(50)', 1, N'', 6, N'審核節點')
GO
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AuditorStatus', N'WorkProcedure', N'tinyint(1)', 1, N'', 7, N'審核結果')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'Id', N'WorkResponse', N'varchar(50)', 0, N'', 1, N'')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'CustomerRepairId', N'WorkResponse', N'varchar(50)', 0, N'', 2, N'報修工單 Id')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkDatetime', N'WorkResponse', N'datetime', 1, N'', 3, N'派工日期時間')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'ProcessDatetime', N'WorkResponse', N'datetime', 1, N'', 4, N'處理日期時間')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'MaintainProcessDesc', N'WorkResponse', N'varchar(100)', 1, N'', 5, N'維運處理描述')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkEmpId', N'WorkResponse', N'varchar(20)', 1, N'', 6, N'施工人員 Id')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'AuditEmpId', N'WorkResponse', N'varchar(20)', 1, N'', 7, N'審核人員 Id')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'PmEmpId', N'WorkResponse', N'varchar(20)', 1, N'', 8, N'主管單位 Id')
INSERT [dbo].[tmpColumn] ([Code], [TableCode], [DataType], [Nullable], [DefaultValue], [Sort], [Note]) VALUES (N'WorkStatusMappingId', N'WorkResponse', N'varchar(50)', 1, N'', 9, N'工單進程 Id')
GO
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'AuthRoles', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'CustomerContract', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'CustomerMapping', N'客戶對應設定')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'CustomerRepair', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'Department', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'Employee', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'EmployeeArea', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'EmployeeAuthWork', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'Errorlog', N'異常錯誤Log')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'MixCategories', N'各類別主檔')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'WorkClass', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'WorkOrderImage', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'WorkOrderNo', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'WorkProcedure', N'')
INSERT [dbo].[tmpTable] ([Code], [Note]) VALUES (N'WorkResponse', N'')
GO
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'AuthType', N'0', N'無', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'AuthType', N'1', N'Controller', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'AuthType', N'2', N'Action', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'0', N'None', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Email', N'Email', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Max', N'Max', 5, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Min', N'Min', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Range', N'Range', 6, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'CheckType', N'Url', N'Url', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'C', N'CheckBox', 7, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'D', N'Date', 9, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'DEC', N'Decimal', 5, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'DT', N'DateTime', 10, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'F', N'File', 11, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'H', N'Hide', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'HTML', N'Html', 12, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'INT', N'Integer', 4, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'MO', N'Modal', 14, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'PWD', N'Password', 15, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'R', N'Radio', 8, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'RO', N'ReadOnly', 16, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'S', N'Select', 6, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'SO', N'Sort', 13, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'T', N'Text', 2, N'Q', NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'EitemType', N'TA', N'TextArea', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'C', N'CheckBox', 6, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'D', N'Date', 8, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'DT', N'DateTime', 9, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'F', N'File', 10, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'H', N'Hide', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'MO', N'Modal', 12, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'N', N'Numeric', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'PWD', N'Password', 13, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'R', N'Radio', 7, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'RO', N'Read Only', 14, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'S', N'Select', 5, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'SO', N'Sort', 11, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'T', N'Text', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'InputType', N'TA', N'TextArea', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Equal', N'Equal', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'In', N'In', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'InRange', N'In Range', 12, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Is', N'Is', 9, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'IsNull', N'Is Null', 10, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Like', N'Like', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Like2', N'Like(模糊)', 5, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'Like2Cols', N'Like Cols(模糊)', 8, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'LikeCols', N'Like Cols', 7, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'LikeList', N'Like List', 6, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'NotLike', N'Not Like', 3, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'NotNull', N'Not Null', 11, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'QitemOp', N'UD', N'User Defined', 13, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'0', N'Normal', 1, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'CF', N'Crud Fun', 2, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'SN', N'Status Name', 4, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'SS', N'Set Status', 6, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'UD', N'User Defined', 7, NULL, NULL)
INSERT [dbo].[XpCode] ([Type], [Value], [Name], [Sort], [Ext], [Note]) VALUES (N'RitemType', N'YE', N'YesEmpty', 3, NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Column_Id]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Column_Id] ON [dbo].[Column]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Crud_Id]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Crud_Id] ON [dbo].[Crud]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CrudEitem_Id]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [CrudEitem_Id] ON [dbo].[CrudEitem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CrudQitem_Id]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [CrudQitem_Id] ON [dbo].[CrudQitem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CrudRitem_Id]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [CrudRitem_Id] ON [dbo].[CrudRitem]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Project_Id]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Project_Id] ON [dbo].[Project]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Table_Id]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [Table_Id] ON [dbo].[Table]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_tmpColumn]    Script Date: 2022/7/26 下午 11:06:18 ******/
CREATE NONCLUSTERED INDEX [ix_tmpColumn] ON [dbo].[tmpColumn]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_DbType]  DEFAULT ((0)) FOR [DbType]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_FromTmpTable]  DEFAULT ((0)) FOR [FromTmpTable]
GO
ALTER TABLE [dbo].[Table] ADD  CONSTRAINT [DF_Table_TranLog]  DEFAULT ((0)) FOR [TranLog]
GO
ALTER TABLE [dbo].[CrudEitem]  WITH CHECK ADD  CONSTRAINT [FK_CrudEitem_CrudEtable] FOREIGN KEY([EtableId])
REFERENCES [dbo].[CrudEtable] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CrudEitem] CHECK CONSTRAINT [FK_CrudEitem_CrudEtable]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'權限種類, 0(無), 1(Ctrl), 2(Action)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Crud', @level2type=N'COLUMN',@level2name=N'AuthType'
GO
--ALTER DATABASE [Db] SET  READ_WRITE 
--GO
