USE [master]
GO
/****** Object:  Database [MultiTracks]    Script Date: 20/04/2023 11:18:30 ******/
CREATE DATABASE [MultiTracks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MultiTracks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MultiTracks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MultiTracks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MultiTracks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MultiTracks] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MultiTracks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MultiTracks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MultiTracks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MultiTracks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MultiTracks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MultiTracks] SET ARITHABORT OFF 
GO
ALTER DATABASE [MultiTracks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MultiTracks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MultiTracks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MultiTracks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MultiTracks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MultiTracks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MultiTracks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MultiTracks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MultiTracks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MultiTracks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MultiTracks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MultiTracks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MultiTracks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MultiTracks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MultiTracks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MultiTracks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MultiTracks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MultiTracks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MultiTracks] SET  MULTI_USER 
GO
ALTER DATABASE [MultiTracks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MultiTracks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MultiTracks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MultiTracks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MultiTracks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MultiTracks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MultiTracks] SET QUERY_STORE = OFF
GO
USE [MultiTracks]
GO

GO
/****** Object:  Table [dbo].[Album]    Script Date: 20/04/2023 11:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[albumID] [int] IDENTITY(1,1) NOT NULL,
	[dateCreation] [smalldatetime] NOT NULL,
	[artistID] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[imageURL] [varchar](500) NOT NULL,
	[year] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[albumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 20/04/2023 11:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[artistID] [int] IDENTITY(1,1) NOT NULL,
	[dateCreation] [smalldatetime] NOT NULL,
	[title] [varchar](100) NOT NULL,
	[biography] [varchar](max) NOT NULL,
	[imageURL] [varchar](500) NOT NULL,
	[heroURL] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[artistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentSteps]    Script Date: 20/04/2023 11:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentSteps](
	[stepID] [int] IDENTITY(1,1) NOT NULL,
	[text] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[stepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Song]    Script Date: 20/04/2023 11:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song](
	[songID] [int] IDENTITY(1,1) NOT NULL,
	[dateCreation] [smalldatetime] NOT NULL,
	[albumID] [int] NOT NULL,
	[artistID] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[bpm] [decimal](6, 2) NOT NULL,
	[timeSignature] [varchar](10) NOT NULL,
	[multitracks] [bit] NOT NULL,
	[customMix] [bit] NOT NULL,
	[chart] [bit] NOT NULL,
	[rehearsalMix] [bit] NOT NULL,
	[patches] [bit] NOT NULL,
	[songSpecificPatches] [bit] NOT NULL,
	[proPresenter] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[songID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSignature]    Script Date: 20/04/2023 11:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSignature](
	[idTimeSignature] [varchar](10) NOT NULL,
	[timeSignature] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_TimeSignature] PRIMARY KEY CLUSTERED 
(
	[idTimeSignature] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (31, CAST(N'2011-11-20T18:56:00' AS SmallDateTime), 1, N'New Season', N'https://mtracks.azureedge.net/public/images/albums/324/31.jpg', 2001)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (66, CAST(N'2011-11-20T18:56:00' AS SmallDateTime), 2, N'And If Our God Is For Us', N'https://mtracks.azureedge.net/public/images/albums/324/66.jpg', 2010)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (87, CAST(N'2011-11-20T18:56:00' AS SmallDateTime), 52, N'10,000 Reasons', N'https://mtracks.azureedge.net/public/images/albums/324/87.jpg', 2011)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (163, CAST(N'2012-09-21T09:29:00' AS SmallDateTime), 5, N'Cornerstone (Live)', N'https://mtracks.azureedge.net/public/images/albums/324/163.jpg', 2012)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (195, CAST(N'2013-02-25T11:13:00' AS SmallDateTime), 31, N'Zion', N'https://mtracks.azureedge.net/public/images/albums/324/195.jpg', 2013)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (210, CAST(N'2013-04-25T11:22:00' AS SmallDateTime), 118, N'All Sons & Daughters Live', N'https://mtracks.azureedge.net/public/images/albums/324/210.jpg', 2013)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (233, CAST(N'2013-09-27T09:30:00' AS SmallDateTime), 152, N'We Are Young & Free (Live)', N'https://mtracks.azureedge.net/public/images/albums/324/233.jpg', 2013)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (239, CAST(N'2013-11-07T08:00:00' AS SmallDateTime), 165, N'The Ascension', N'https://mtracks.azureedge.net/public/images/albums/324/239.jpg', 2013)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (276, CAST(N'2014-03-25T12:49:00' AS SmallDateTime), 174, N'Live From New York', N'https://mtracks.azureedge.net/public/images/albums/324/276.jpg', 2012)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (292, CAST(N'2014-04-30T10:20:00' AS SmallDateTime), 118, N'All Sons & Daughters', N'https://mtracks.azureedge.net/public/images/albums/324/292.jpg', 2014)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (319, CAST(N'2014-06-18T16:48:00' AS SmallDateTime), 5, N'No Other Name', N'https://mtracks.azureedge.net/public/images/albums/324/319.jpg', 2014)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (418, CAST(N'2015-01-08T09:34:00' AS SmallDateTime), 107, N'We Will Not Be Shaken', N'https://mtracks.azureedge.net/public/images/albums/324/418.jpg', 2015)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (587, CAST(N'2015-10-15T10:28:00' AS SmallDateTime), 5, N'OPEN HEAVEN / River Wild', N'https://mtracks.azureedge.net/public/images/albums/324/587.jpg', 2015)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (665, CAST(N'2016-01-18T11:28:00' AS SmallDateTime), 172, N'Here As In Heaven', N'https://mtracks.azureedge.net/public/images/albums/324/665.jpg', 2016)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (693, CAST(N'2016-03-01T09:17:00' AS SmallDateTime), 107, N'Have It All', N'https://mtracks.azureedge.net/public/images/albums/324/693.jpg', 2016)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (784, CAST(N'2016-05-13T11:54:00' AS SmallDateTime), 421, N'Glory & Wonder', N'https://mtracks.azureedge.net/public/images/albums/324/784.jpg', 2016)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (909, CAST(N'2016-09-20T13:29:00' AS SmallDateTime), 5, N'Let There Be Light', N'https://mtracks.azureedge.net/public/images/albums/324/909.jpg', 2016)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (942, CAST(N'2016-10-19T09:53:00' AS SmallDateTime), 2, N'Never Lose Sight', N'https://mtracks.azureedge.net/public/images/albums/324/942.jpg', 2016)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1051, CAST(N'2017-02-08T09:34:00' AS SmallDateTime), 172, N'There Is A Cloud', N'https://mtracks.azureedge.net/public/images/albums/324/1051.jpg', 2017)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1055, CAST(N'2017-02-14T09:13:00' AS SmallDateTime), 140, N'Worthy of Your Name', N'https://mtracks.azureedge.net/public/images/albums/324/1055.jpg', 2017)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1094, CAST(N'2017-03-15T08:24:00' AS SmallDateTime), 107, N'Starlight', N'https://mtracks.azureedge.net/public/images/albums/324/1094.jpg', 2017)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1509, CAST(N'2018-01-04T14:30:00' AS SmallDateTime), 660, N'Reckless Love', N'https://mtracks.azureedge.net/public/images/albums/324/1509.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1522, CAST(N'2018-01-15T12:59:00' AS SmallDateTime), 400, N'Your Great Name', N'https://mtracks.azureedge.net/public/images/albums/324/1522.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1568, CAST(N'2018-02-08T13:18:00' AS SmallDateTime), 237, N'Bright Faith Bold Future', N'https://mtracks.azureedge.net/public/images/albums/324/1568.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1602, CAST(N'2018-02-27T14:04:00' AS SmallDateTime), 5, N'There Is More', N'https://mtracks.azureedge.net/public/images/albums/324/1602.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1853, CAST(N'2018-07-10T11:17:00' AS SmallDateTime), 174, N'Living With A Fire', N'https://mtracks.azureedge.net/public/images/albums/324/1853.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1887, CAST(N'2018-07-23T10:04:00' AS SmallDateTime), 757, N'Pat Barrett', N'https://mtracks.azureedge.net/public/images/albums/324/1887.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (1899, CAST(N'2018-08-01T10:18:00' AS SmallDateTime), 165, N'Living Hope', N'https://mtracks.azureedge.net/public/images/albums/324/1899.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2020, CAST(N'2018-09-25T12:24:00' AS SmallDateTime), 172, N'Hallelujah Here Below', N'https://mtracks.azureedge.net/public/images/albums/324/2020.jpg', 2018)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2170, CAST(N'2019-01-03T12:55:00' AS SmallDateTime), 461, N'Nothing Else', N'https://mtracks.azureedge.net/public/images/albums/324/2170.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2171, CAST(N'2019-01-03T12:56:00' AS SmallDateTime), 107, N'Victory', N'https://mtracks.azureedge.net/public/images/albums/324/2171.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2330, CAST(N'2019-02-15T12:13:00' AS SmallDateTime), 872, N'To The One', N'https://mtracks.azureedge.net/public/images/albums/324/2330.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2393, CAST(N'2019-03-11T12:22:00' AS SmallDateTime), 31, N'People', N'https://mtracks.azureedge.net/public/images/albums/324/2393.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2540, CAST(N'2019-05-06T14:00:00' AS SmallDateTime), 566, N'Make Room', N'https://mtracks.azureedge.net/public/images/albums/324/2540.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2812, CAST(N'2019-08-26T10:34:00' AS SmallDateTime), 172, N'At Midnight', N'https://mtracks.azureedge.net/public/images/albums/324/2812.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2822, CAST(N'2019-08-28T10:51:00' AS SmallDateTime), 444, N'Better Word', N'https://mtracks.azureedge.net/public/images/albums/324/2822.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2844, CAST(N'2019-09-11T10:21:00' AS SmallDateTime), 5, N'Awake', N'https://mtracks.azureedge.net/public/images/albums/324/2844.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (2940, CAST(N'2019-10-14T10:42:00' AS SmallDateTime), 673, N'I Speak Jesus', N'https://mtracks.azureedge.net/public/images/albums/324/2940.jpg', 2019)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3144, CAST(N'2020-01-15T11:53:00' AS SmallDateTime), 660, N'The Father''s House', N'https://mtracks.azureedge.net/public/images/albums/324/3144.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3258, CAST(N'2020-03-07T19:55:00' AS SmallDateTime), 461, N'Run to the Father', N'https://mtracks.azureedge.net/public/images/albums/324/3258.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3260, CAST(N'2020-03-07T20:02:00' AS SmallDateTime), 172, N'Graves Into Gardens', N'https://mtracks.azureedge.net/public/images/albums/324/3260.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3352, CAST(N'2020-04-02T12:49:00' AS SmallDateTime), 1076, N'Church of the City', N'https://mtracks.azureedge.net/public/images/albums/324/3352.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3389, CAST(N'2020-04-15T14:18:00' AS SmallDateTime), 872, N'Land of the Living', N'https://mtracks.azureedge.net/public/images/albums/324/3389.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3391, CAST(N'2020-04-15T14:56:00' AS SmallDateTime), 1110, N'Maverick City Vol. 3, Part 1', N'https://mtracks.azureedge.net/public/images/albums/324/3391.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3476, CAST(N'2020-05-11T12:27:00' AS SmallDateTime), 107, N'Revival''s In The Air', N'https://mtracks.azureedge.net/public/images/albums/324/3476.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3496, CAST(N'2020-05-18T11:07:00' AS SmallDateTime), 1068, N'Make Room', N'https://mtracks.azureedge.net/public/images/albums/324/3496.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3666, CAST(N'2020-07-20T12:45:00' AS SmallDateTime), 1008, N'Holy Water', N'https://mtracks.azureedge.net/public/images/albums/324/3666.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (3776, CAST(N'2020-08-19T11:10:00' AS SmallDateTime), 152, N'All Of My Best Friends', N'https://mtracks.azureedge.net/public/images/albums/324/3776.jpg', 2020)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4180, CAST(N'2021-01-04T08:56:00' AS SmallDateTime), 991, N'House of Miracles (Live)', N'https://mtracks.azureedge.net/public/images/albums/324/4180.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4199, CAST(N'2021-01-12T16:04:00' AS SmallDateTime), 913, N'Not Holding Back', N'https://mtracks.azureedge.net/public/images/albums/324/4199.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4219, CAST(N'2021-01-15T13:06:00' AS SmallDateTime), 5, N'Fresh Wind', N'https://mtracks.azureedge.net/public/images/albums/324/4219.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4240, CAST(N'2021-01-20T14:25:00' AS SmallDateTime), 1110, N'Move Your Heart', N'https://mtracks.azureedge.net/public/images/albums/324/4240.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4287, CAST(N'2021-02-04T12:03:00' AS SmallDateTime), 1040, N'Believe For It', N'https://mtracks.azureedge.net/public/images/albums/324/4287.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4320, CAST(N'2021-02-17T14:08:00' AS SmallDateTime), 1008, N'Child of Love', N'https://mtracks.azureedge.net/public/images/albums/324/4320.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4366, CAST(N'2021-03-03T14:27:00' AS SmallDateTime), 1268, N'Thank You Jesus For The Blood', N'https://mtracks.azureedge.net/public/images/albums/324/4366.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4423, CAST(N'2021-03-16T13:41:00' AS SmallDateTime), 367, N'Things of Heaven (Where We Come From)', N'https://mtracks.azureedge.net/public/images/albums/324/4423.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4542, CAST(N'2021-04-19T15:28:00' AS SmallDateTime), 147, N'Milk & Honey', N'https://mtracks.azureedge.net/public/images/albums/324/4542.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4550, CAST(N'2021-04-20T11:33:00' AS SmallDateTime), 172, N'Old Church Basement', N'https://mtracks.azureedge.net/public/images/albums/324/4550.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4594, CAST(N'2021-05-06T11:33:00' AS SmallDateTime), 636, N'See The Light', N'https://mtracks.azureedge.net/public/images/albums/324/4594.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4603, CAST(N'2021-05-12T10:27:00' AS SmallDateTime), 165, N'Hymn of Heaven', N'https://mtracks.azureedge.net/public/images/albums/324/4603.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4614, CAST(N'2021-05-17T15:25:00' AS SmallDateTime), 991, N'Too Good To Not Believe', N'https://mtracks.azureedge.net/public/images/albums/324/4614.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4624, CAST(N'2021-05-20T09:54:00' AS SmallDateTime), 461, N'Too Good To Not Believe', N'https://mtracks.azureedge.net/public/images/albums/324/4624.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4667, CAST(N'2021-05-28T12:37:00' AS SmallDateTime), 279, N'Scars in Heaven', N'https://mtracks.azureedge.net/public/images/albums/324/4667.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4692, CAST(N'2021-06-03T10:04:00' AS SmallDateTime), 1321, N'My Jesus', N'https://mtracks.azureedge.net/public/images/albums/324/4692.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4895, CAST(N'2021-07-06T11:51:00' AS SmallDateTime), 31, N'Know You Will', N'https://mtracks.azureedge.net/public/images/albums/324/4895.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (4982, CAST(N'2021-07-12T15:27:00' AS SmallDateTime), 1268, N'New Name Written Down In Glory', N'https://mtracks.azureedge.net/public/images/albums/324/4982.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (5020, CAST(N'2021-07-22T14:47:00' AS SmallDateTime), 152, N'Out Here On a Friday Where It Began', N'https://mtracks.azureedge.net/public/images/albums/324/5020.jpg', 2021)
INSERT [dbo].[Album] ([albumID], [dateCreation], [artistID], [title], [imageURL], [year]) VALUES (5054, CAST(N'2021-07-30T15:58:00' AS SmallDateTime), 260, N'Speak to the Mountains', N'https://mtracks.azureedge.net/public/images/albums/324/5054.jpg', 2021)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Artist] ON 

INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1, CAST(N'2011-11-20T18:49:00' AS SmallDateTime), N'Israel and New Breed', N'ISRAEL HOUGHTON & NEW BREED is a movement created for those who believe that worship and justice go hand in hand. We exist to reflect the heart of God and His love for the nations, the poor, the lost, and the forgotten. "We are not defined by the petty price tag mentalities of society. Our inheritance lies far beyond eternity. There are no limits when it comes to our destiny. As the deep goes deeper we find our name. We are New Breed".... Are you?
<!-- read more -->
ISRAEL HOUGHTON & NEW BREED have achieved a synthesis of music and message that is electrifying and activating audiences inside and outside of traditional church walls. Most of their albums have been recorded before live audiences to capture their infectious energy. Leader, singer, songwriter and multi-instrumentalist Israel Houghton has seen his compositions become integral components for progressive now-generation churches. Flanked by voices filled with joy, purpose and conviction singing over galvanizing arrangements of music with African, Middle Eastern and South American slants, Israel and New Breed have swiftly amassed a legion of followers that crosses generational and cultural lines. And as barriers are blasted away, the sprawling cutting-edge unit has been fittingly graced with two Gold-selling albums, seven Dove Awards, two Stellar Awards, a Soul Train Award, seven Grammy® Award nominations, and four Grammy® Awards. The most recent being a 2011 Grammy® for Best Pop/Contemporary Gospel Album (Love God.Love People.)

Building on the theme of his Grammy-winning 2009 offering The Power of One, Houghton returned to the studio, this time London''s famed Abbey Road Studios, to record his new masterwork and another Grammy winner, Love God. Love People., with a little help from his friends. There, holed up in a hallowed space of classic recordings by Rock royalty The Beatles, Houghton and his crack team of co-producers Aaron Lindsey and Tommy Sims, along with guests Fred Hammond, Kirk Franklin, and Take 6''s Claude V. McKnight, Mark Kibble and Joey Kibble, created a new ode to love in this epic, 12-song cycle. The result, Love God. Love People. (Integrity Music/Columbia), delivers the musical versatility, profound lyrics and galvanizing displays of vocal and instrumental virtuosity fans have come to expect from Israel Houghton. 

Summing up Love God. Love People., and the culmination of his first 20 years in music ministry, Houghton states, "For this season of my life, this is what I''m still passionate about. If I wasn''t an artist, I would still be an activist - out trying to make a difference and giving a voice to those who don''t have one. New Breed could have easily found its end at any time overnight. Not because the music wasn''t good, but because we had failed up to that point to discover our real purpose. It was not to build a platform under myself but to build a platform under others. Once we as a team grasped the understanding that ''Strength is for service not status'' (Romans: 15), we knew our success was not about winning awards, selling platinum CDs or selling out concert halls. It was about taking whatever momentum we could gather and giving it back in service. That''s what has kept me and New Breed relevant, focused and effective. And I am grateful that God has surrounded me with people who have that same heart.”', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (2, CAST(N'2011-11-20T18:49:00' AS SmallDateTime), N'Chris Tomlin', N'Some artists enter the studio determined to make a radical departure from who and what they are, or indulge some musical flavor of the month in a bid to expand the fan base. In either event, those strategies often backfire — though in staying true to his calling, GRAMMY® winner Chris Tomlin thinks not of popularity, but rather the populace his music can touch and encourage.

“I’m not trying to make a different kind of record,” says Tomlin of his latest effort, Love Ran Red “It’s still the same path I started down: writing songs for the church, songs people can sing, songs that connect with people in their heart and move them in a way only songs can. That’s not changed — and yet this collection I feel is the strongest I’ve ever done.”

<!-- read more -->
That’s setting the bar quite high for his tenth studio recording, given that his last effort “Burning Lights” kicked off 2013 as a No. 1 album. It also led to sold-out tour dates, Billboard Music Awards, being named a BMI Songwriter of the Year and receiving the K-LOVE Fan Award for Male Vocalist of the Year and Dove Award for Songwriter of the Year.

Yet Love Ran Red picks up where its predecessor left off. True to its title, it expresses beating-heart faith and channels love’s ceaseless flow into a dozen songs to get the blood pumping and spirits soaring. To that end, Love Ran Red shows Tomlin reaching and stretching forward, even as he leans back on what’s always worked best. Produced by longtime friend and collaborator Ed Cash (Kari Jobe, Vince Gill, David Crowder* Band, Dave Barnes, Steven Curtis Chapman), the album strikes stirring tones of hope, praise and the peace found only in God’s presence.

The album’s first hit single, “Waterfall” conjures images of people dancing in the rain as Tomlin showers the listener with a call and response: “Your love is like a waterfall, waterfall/ Running wild and free/ You hear my heart when I call, when I call/ Deep calls to deep.” Then there’s “Jesus Loves Me,” the follow-up single. Kicking off with a regal, anthemic piano, the song rolls into thunderhead rhythm before hitting its thrilling, reassuring chorus: “Jesus how can it be? He loves me, he is for me.” Tomlin then declares, in a brilliant turn of phrase: “He holds the stars and holds my heart/ With healing hands that bear the scars.”It’s a very personal song for Tomlin, a songwriter not often known to go that route. “I sang it from somewhere deep inside,” he says. “You can’t outlive the presence of God, the love of God, and God will find you wherever you are. We can spend our whole lives learning all this grand theology of God. But at the end of the day it comes down to ‘Jesus loves me.’”

The track juxtaposes beautifully with “Almighty,” which also starts with solo piano but takes a different lyrical route. “It’s about the majesty of God, the holiness and beauty and complete otherness of God, where we come to worship him for who he is — this massive untouchable God—and bow as low as we can in his presence.” That majestic message collects musical momentum and might, keeping its sing-along appeal even as Tomlin celebrates God’s “sovereign crown of royalty.”

“I don’t think I can write a bigger song in my life than ‘Almighty,’” Tomlin says. “When I hear that opening melody, and that opening piano, it’s like a glimpse of heaven to me. And yet I don’t think I can write a more intimate song of grace than ‘Jesus Loves Me.’ It’s great that they’re both on this record together.” It’s also fortuitous that Tomlin included the latter track, which was written after he thought the album was done. “The funny thing is that you never know what songs will pop up,” he says. “Eleventh hour songs seem to be ones that are really special. That’s what’s so crazy and beautiful.”

The album takes its title from what Tomlin calls its “centerpiece lyric,” as heard on the song “At the Cross”: “Where your love ran red and my sin washed white/ I owe all to you, I owe all to you.” He couldn’t be more passionate about what that couplet represents, and how it describes his place in the musical landscape: “That’s the good news, what every church is trying to say to people, what the gospels point to,” he says. And with each song on this collection, Love Ran Red owes its sweeping scope to an artist seeking to enrich the worship experience. “So many of these songs are so easy for any church to do, and will also translate well to the concert setting,” Tomlin says. “Every song was really labored over and taken seriously, and so many songs were cut: There were 10 that didn’t make it.”

In fact, it took Tomlin seven months to craft, record and refine Love Ran Red, a long time dedicated to a record he hopes will last. This is, after all, the same Chris Tomlin who’s recorded modern-day worship classics such as “How Great Is Our God,” “Our God” and "Indescribable.” With 12 No. 1 radio singles, a GRAMMY® Award, eight additional nominations, three Billboard Music Awards, 21 Dove Awards, 5 gold and 2 platinum digital singles, a platinum and four gold albums to his credit, Chris Tomlin is among the most well-known and influential artists in contemporary Christian music. With 15 of the Top 100 CCLI songs, four of them being in the top ten, it’s estimated that more than 40 million men, women and children sing his songs each week, a statistic that moved TIME magazine to proclaim him “likely the most often sung artist anywhere.”

Yet for all the accolades, awards and recognition, it doesn’t get any better than the recent Sunday when he walked into a small church while working on Love Ran Red. Maybe 100 congregants were present. No one knew or recognized Tomlin, nor did he know a single soul. Then he listened with amazement and hushed humility as the church musicians performed several of his songs, including “Jesus Messiah” and “Whom Shall I Fear?” “It was a reminder that this is what I pray for, and that God gives me songs for,” he says. “It goes beyond me, or a person, or a Chris Tomlin song. To see that was encouraging to me in so many ways.” 

So too has Tomlin encouraged so many with his bold and beautiful declarations of faith. Love Ran Red certainly builds on his ongoing mission, but there’s more to it that that. It also runs deep — and points to Jesus with more energy and enthusiasm than anything he’s recorded before. ', N'https://mtracks.azureedge.net/public/images/artists/cover/512/2.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/2.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (5, CAST(N'2011-11-20T18:49:00' AS SmallDateTime), N'Hillsong Worship', N'Hillsong Worship’s greatest mission is to equip believers everywhere with songs of Holy Spirit power that exalt and glorify the Name of Jesus, build and serve the global Church and fuel revival on the earth. With songs like “What a Beautiful Name,” “Cornerstone,” “Mighty To Save,” “This I Believe (The Creed)” and “Who You Say I Am,” Hillsong Worship’s catalogue is sung by an estimated 50 million people worldwide each week.  Featuring worship leaders and songwriters Brooke Ligertwood, Ben Fielding, Reuben Morgan, Joel Houston, Taya Gaukrodger, Aodhan King, David Ware and more, Hillsong Worship is committed to building on its legacy of creating songs that, by God’s grace, impact both individual devotion and congregational worship for the glory of God.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/5.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/5.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (31, CAST(N'2011-11-20T18:49:00' AS SmallDateTime), N'Hillsong United', N'Committed to creating a musical expression that is almost uncomfortable in its uniqueness, our mission is to write songs that awaken churches and individuals to the fact that we are redeemed and called into the story of God.
<!-- read more -->
With the familiar faces of worship leaders Joel Houston, Jad Gillies, JD and Matt Crocker upfront, the UNITED team has become an evolving collaboration of pastors, worship leaders, musicians and songwriters, all bound by the common goal of giving voice to a generation who is passionate about God.

Everything we do is an expression of a really extraordinary God doing what only He can do through really ordinary people who love Him, want to serve Him and want to build His Church. To simply serve God and allow Him to do what only He can do has always been the team’s desire.

"Our prayer is that people everywhere would catch this desire and run with it in the same way! Knowing God is with them, God is in control, and He will have His way." – Joel Houston', N'https://mtracks.azureedge.net/public/images/artists/cover/512/31.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/31.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (52, CAST(N'2011-11-20T18:49:00' AS SmallDateTime), N'Matt Redman', N'Matt Redman is married to Beth and they have five children. Based on the south coast of England, they are part of St Peter’s church, Brighton. Matt has been a full-time worship leader since the age of 20 and this journey has taken him to countries such as South Africa, Japan, India, Australia, Germany, and the Czech Republic. Along the way he has sung in venues such as the Angels baseball stadium, both old and new Wembley stadiums, St Paul’s Cathedral and the Royal Albert Hall.
<!-- read more -->
Matt''s earlier songs include "The Heart of Worship," "You Never Let Go," and "Blessed Be Your Name." More recent compositions include the Grammy-nominated "Our God," and the double-Grammy winning "10,000 Reasons" – for which he also received a Billboard award in the USA. His latest record was recorded live at LIFT, a worship leader collective hosted by Passion City Church in Atlanta, GA.

Matt is also the author of several books, including The Unquenchable Worshipper, Facedown, Mirrorball, Blessed Be Your Name (co-authored with Beth Redman) and Indescribable (co-authored with Louie Giglio).', N'https://mtracks.azureedge.net/public/images/artists/cover/512/52.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/52.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (107, CAST(N'2011-11-20T18:49:00' AS SmallDateTime), N'Bethel Music', N'Bethel Music is a ministry of Bethel Church that facilitates and administrates the creation and exportation of worship songs, events, teachings, resources and technology. 

<!-- read more -->

The core of Bethel Music is to capture God’s heart through worship, declaring who He is and who we are in Him. Our desire is for every album we produce to be saturated with the presence of God and draw people deeper into worship of Him.', N'https://mtracks.azureedge.net/public/images/artists/cover/512/107.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/107.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (118, CAST(N'2012-04-16T16:36:00' AS SmallDateTime), N'All Sons & Daughters', N'Music lovers worldwide are captivated, swept up in the surging wave of modern folk as heard in the likes of Mumford and Sons, The Avett Brothers, Neon Trees, The Civil Wars, and others. Organic, acoustic, and packed with live energy and freedom, it''s the unpolished imperfection and open invitation to sing along that has catapulted these artists into the spotlight and up the charts.

<!-- read more -->

For All Sons & Daughters'' Leslie Jordan and David Leonard, these qualities are even more keenly experienced in music that connects broken people with their God. Worship leaders at Journey Church in Franklin, TN, their critically acclaimed EPs, Brokenness Aside, Reason To Sing, and The Longing, along with their full length albums, Season One and Live bear witness to the power of worship by the people, for the people and of the people. In the truest sense, the mesmerizing, soul-baring lyrics and acoustic styling of this talented duo are beginning to make an impact...inside and outside the church.

Fragments. Change. Growth.

Releasing in May 2014, All Sons & Daughters'' self-titled studio album turns the page on a new chapter for the duo, a new season of leaning into their own musical and lyrical instincts. "We''ve allowed ourselves to be more creative, more reflective of who we are, while still writing songs for the church," Leslie says of the self-titled album. The album''s cover art-an incredible mixed-media piece created specifically for AS&D by artist Deeann Rieves-perfectly represents the fragmented beauty of growth and decay inherent in all of life. "We asked Deeann, who is familiar with our work, to listen to the new record and paint a piece that fits what you hear. What you see on the cover is really unique. We feel like we''re ''standing on the foundation of the fragments and pieces, musically speaking, building on the changes we''ve encountered over the past few years," David says. 

Produced by Paul Mabry, All Sons & Daughters features a ''wish list'' of co-writers, Stu G (of Delirious), Derek Webb, Leeland, Sandra McCracken, Jack Mooring and Francesca Battestelli. "The beauty of co-writing," David explains, " is getting some new blood in to really push us, to think differently about the lyrics." 

I would be a fool / If I could be made new /Come ruin, come ridicule
Recklessly I come, I run to You - "Your Glory and My Good"

"Your Glory & My Good," co-written with Derek Webb, sets the tone for the album. "It was challenging, but so invigorating to write, and it tells such a beautiful story," Leslie says of the song inspired by the story of the woman with a bleeding disorder in Mark 5. "The older I get, the more I experience life, the more I experience my own depravity, the more I see my need for the kind of bold faith this woman had. She was rejected by society, but she knew if she could just get to Jesus, he could heal her. We don''t see that kind of faith much in today''s society, that kind of faith is ridiculed... so I''ve been really challenged by that. Even before we started writing, we knew this song would be special." 

"You Will Remain," available for pre-sell on iTunes, originated from a melody shared by a local guitar shop owner, David Wood. The first song written for the record, its melody led Leslie and David to the Gospel of John where Jesus refers to himself as ''I AM.'' "We were struck by the truth of it," Leslie says. "He didn''t say ''I was'' or ''I will be,'' but ''I am.'' And he wasn''t overstating anything... the constant, unfailing nature of God and his goodness. We never tire of leading this one."

By the means of grace and the hope of glory /All honor and glory forever
From now to the end of the age

Inspired by a prayer of thanksgiving found in the Book of Common Prayer, the benediction that closes out each AS&D event, "We Give You Thanks," emerged with the co-writing help of Jason Ingram. "It''s just such a beautiful moment when we read that prayer as a congregation every night," David explains. "We were sitting around one night and thought ''What if we wrote a chorus around this thing?'' And it''s just been such a cool part of the night, connecting that prayer to the chorus and seeing the congregation catch on." 

More joyful and celebrative overall, the album includes two songs previously recorded live, songs that are catching on with churches nationwide now reinterpreted in studio: "Great Are You Lord" and "God With Us," both audience favorites and significant moments on their tours. In these and all the original worship compositions for this eponymous release, Leslie and David continue to pursue authenticity and honesty in the music they make.

With plans to tour with Crowder in October 2014, All Sons & Daughters take great care to make music that meets people where they are, to find the pulse of the people in the cities where they play, to serve and resource musicians and worship leaders. As always, their song charts are free online, and they continue to take advantage of any opportunity to start new conversations about what worship might look like when approached from an authentic place ...Worship as a true reflection of the heart, however fragmented, however weak, however strong.', N'https://mtracks.azureedge.net/public/images/artists/cover/512/118.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/118.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (140, CAST(N'2013-03-11T14:59:00' AS SmallDateTime), N'Passion', N'Rooted out of the Passion movement, we are committed to leading people towards renewed intimacy with God and fresh encounters of worship.

From its start in 1995 Passion has been rooted in the confession of Isaiah 26:8 – “Yes Lord, walking in the way of Your truth we wait eagerly for You, for Your name and Your renown are the desire of our hearts” - existing to glorify God by uniting students in worship, prayer and justice for spiritual awakening in this generation. Passion has encountered millions of students and 18-25 year olds, young people whose lives have been transformed by the power of the Holy Spirit.

<!-- read more -->
One of the most impactful and stirring aspects of the movement, founded by Louie and Shelley Giglio, has been the sea of voices uniting together to lift up the name of Jesus, currently helmed by Kristian Stanfill, Brett Younker and Melodie Malone. The band has seen worship leaders such as Chris Tomlin, Matt Redman, Crowder, Christy Nockels and more uniting over the years, writing, recording and leading arenas in worship.

Transcending the conferences, songs from Passion have become some of the most recognizable and unforgettable worship anthems of this generation. With more than 1.9 million units sold and a multitude of chart-topping singles such as “How Great Is Our God,” “God Of This City,” “One Thing Remains,” “Even So Come,” and “10,000 Reasons (Bless the Lord),” listeners across the world continue to be impacted by the music of Passion.

Recorded live with the backdrop of three sold-out arenas, Atlanta’s Philips Arena, Infinite Energy Center and Washington D.C.’s The Anthem, Whole Heart, the newest collection of songs from Passion 2018 brought together more than 32,000 students from 700 universities and 35 countries. Passion believes worship and justice go hand in hand. Students sponsored 3,330 children through Compassion International, raised $103,623 for Voice of the Martyrs Korea, which distributes Scripture in North Korea, and brought supplies for children affected by Hurricane Harvey. The gathering of 18-25 year-olds continued to fight modern day slavery through The END IT Movement, assisting in awareness, prevention, rescue and restoration.

Whole Heart follows in the footsteps of beloved top-selling, annual Passion releases, including last year''s Worthy Of Your Name which also topped Billboard''s Top Christian Albums chart. The live recording of Whole Heart
includes “God, You’re So Good,” “All My Hope,” “More Like Jesus,” “Reckless Love” and “Almighty God.”

Through it all, Jesus continues to remain at the center.

Passion is more than music.
More than events.
Passion is a generation living for His name.', N'https://mtracks.azureedge.net/public/images/artists/cover/512/140.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/140.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (147, CAST(N'2013-05-21T11:00:00' AS SmallDateTime), N'Crowder', N'', N'https://mtracks.azureedge.net/public/images/artists/cover/512/147.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/147.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (152, CAST(N'2013-07-02T09:53:00' AS SmallDateTime), N'Hillsong Young & Free', N'Hillsong Young & Free is the youth worship team at Hillsong Church. A team of young people, we represent the heart of a wider, global youth family filled with individuals who’ve found forgiveness, salvation, joy and hope in Jesus Christ. Our songs are the overflow of grateful hearts and express the life we’ve found in our Saviour. More than a label, Young & Free is also our message and mission, as we seek to point to others to the freedom they too can find in Jesus and encourage them to stand strong in their youth and live His love.

<!-- read more -->
 

 ', N'https://mtracks.azureedge.net/public/images/artists/cover/512/152.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/152.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (165, CAST(N'2013-11-07T08:28:00' AS SmallDateTime), N'Phil Wickham', N'Phil Wickham remembers the first time his father heard him play a song he’d written. He wasn’t looking for an audience, but it nevertheless caught the attention of his father—a worship pastor in their San Diego church. “That’s actually a good worship song,” Phil remembers his father telling him. “Can I play that in our sanctuary?” It was the first worship song Phil ever wrote. It would not be the last.
<!-- read more -->
In the ten years and nine records since Phil recorded his first worship album, whatever his father noticed has caught the attention of the world at large. Wickham has a passion for using music to create a community—a place where hearts and minds are inclined as one.

“There is nothing that brings the church together like worship music,” he says. “Not only are we all singing the same truth, we’re singing the same notes. Not only the same notes, but the same rhythm. To be one of the writers who gets to create songs that are used in a corporate setting where people thinking on the same truth and worshiping the same God and clapping to the same beat—it’s a beautiful moment.”', N'https://mtracks.azureedge.net/public/images/artists/cover/512/165.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/165.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (172, CAST(N'2014-01-13T09:05:00' AS SmallDateTime), N'Elevation Worship', N'Elevation Worship is the worship ministry of Elevation Church, a multisite church based in Charlotte, NC, led by Pastor Steven Furtick. Their newest project, Paradoxology, released in April of 2019 and is a collection of songs from their most recent Grammy-nominated album, Hallelujah Here Below, which released in September of 2018. Elevation Worship has produced multiple albums which included RIAA Platinum Certified and American Christian radio top-5 song "O Come to The Altar” and the RIAA Gold Certified song "Do It Again." 

In 2018, Elevation Worship had 8 songs in the CCLI Top 100 list, 2 of which were in the top 20. This ministry is passionate about producing songs for the local church that connect others to God. Their main priority is to create an atmosphere of worship so people can encounter Jesus in a real and personal way. 

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/172.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/172.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (174, CAST(N'2014-02-25T12:08:00' AS SmallDateTime), N'Jesus Culture', N'Jesus Culture is a community of revivalists whose heart is to see a generation impacted through encounters with the presence of God.  The Jesus Culture movement began 20 years ago and continues today at their local church in Sacramento, California. Jesus Culture is focused on equipping young and old to transform society by living in community, discipleship, and living lives surrendered to Jesus in passionate worship. They recorded their first album in 2005 at their youth and young adult conference in Redding, California. They have since released 10 live albums, not including Living with a Fire, their most recent release. They have sold more than three million albums worldwide and garnered more than four million followers on social media and over 83 million views on YouTube. But their greatest accomplishment to date is that after all these years, they are still living with hearts on fire for Jesus. Today, the passionate desire to see a generation rise up and wholeheartedly pursue Jesus is stronger than ever.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/174.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/174.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (237, CAST(N'2015-01-16T10:43:00' AS SmallDateTime), N'Vertical Worship', N'VERTICAL CHURCH ISN’T THE NAME
OF A CHURCH. IT IS AN IDEA.

The idea that worshiping Jesus Christ is best done not when we just sing about Him or what He has done or what He will do in the future. The highest and best worship is modeled by what the angels do: sing to God about God. Vertical.

<!-- read more -->
Vertical Church Band is a collection of people who play every week in places all over Chicagoland as part of Harvest Bible Chapel, a place that believes singing isn’t a warm-up for the sermon; singing is a warm-up for heaven. So the faces may change. The style may evolve. But the aim will stay the same. Vertical.', N'https://mtracks.azureedge.net/public/images/artists/cover/512/237.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/237.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (260, CAST(N'2015-05-13T13:03:00' AS SmallDateTime), N'Chris McClarney', N'Since the beginning, Jesus Culture Music has always had a heart for people to encounter the Presence of God through their worship. Their latest offering partners with Chris McClarney, the songwriter behind the powerful worship anthem “Your Love Never Fails,” which has become one of the most popular songs in America’s churches. Fueled with a passion to see people experience the love and power of Jesus, McClarney brings his debut live album, Everything And Nothing Less, set to release on June 9, 2015. This dynamic album features 9 brand new songs recorded at the 2015 Jesus Culture Sacramento conference. Preorder the album starting May 26th and get songs “Everything And Nothing Less” and “All Consuming Fire” instantly. 

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/260.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/260.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (279, CAST(N'2015-07-07T12:20:00' AS SmallDateTime), N'Casting Crowns', N'Hearing Casting Crowns’ frontman Mark Hall singing those words in the title track of the band’s new album Thrive, it’s hard not to feel peace wash over your soul. Life can be so challenging and it’s easy to become overwhelmed. What a gift to be reminded we were made to thrive!

<!-- read more -->

“The idea of ‘Thrive’ came out of our student ministry. I’ve been a youth pastor for almost 22 years and it’s still what I want to be when I grow up,” Hall says with a grin. “The songs always really start out with what we’re teaching, and for years I’ve been using Psalm 1 in showing them what a believer looks like. It says: ‘Blessed is the one who does not walk in step with the wicked or stand in the way that sinners take or sit in the company of mockers, but whose delight is in the law of the Lord, and who meditates on his law day and night. That person is like a tree planted by streams of water, which yields its fruit in season.’”

For Hall, nature seemed to underscore scripture on a family vacation in Gatlinburg, Tenn. when he looked at the trees near the river. “Their roots are exposed and you can feel them just doing everything they can to get to where the water is,” he says. “When I talk to families about how they are doing, they always say ‘just surviving.’ That is not the life that God designed for us to live. That’s not saying that you’re not going to have problems. None of the New Testament people had it easy. They all had troubles, some even at the expense of their lives. The book of joy, Philippians, was written from prison. Hard times are going to come, but God didn’t put you here just so you could survive through hard times. He put you here to thrive, to dig in and to reach out. This record is an effort to draw a picture of what a believer, a follower of Jesus, would look like if they dug into their roots and understood God and themselves more, and then instead of trying to go be Christian for God, they just let God give them chances to be a Christian.”

Casting Crowns’ has consistently delivered songs that spur listeners to evaluate their relationship with God and with each other. “The basic idea is let God define himself through you and if you’ll do that, you’re going to thrive,” says Hall. “The first six songs on the record are all about learning who God is and who you are. The second six songs are about how that works out. How are you going to get out there and let him live his life through you?”

The album’s lead single “All You’ve Ever Wanted” has a potent message. “It’s combating that logic that we have in us that says when we fail, we need to make it right,” Hall says. “We think we need to make things right with God. We think we’ve got to make him proud again. Not only does it not work, it’s not needed. We’re fighting a battle that’s already won and that’s what this song is about.”

Hall says the hardest song for him to write on the new album was “Love You With the Truth.” “It’s a big, upbeat rockin’ song about a person realizing that they’ve been a really cruddy friend because they haven’t shared the truth with the person closest to them,” Hall explains.  “People say, ‘I want to share the gospel, but I don’t want to ruin my friendship.’ What you are really saying is I love my friendship more than I love my friend. It’s tough, but it’s truth.”

One of the most poignant songs on the album is the compelling ballad “Broken Together.” “Marriage is tough,” Hall says. “We bring a lot of fairytales to the picture when it comes to marriage.  We bring them to the altar with us [thinking]: ‘This is going to be perfect. We don’t have to be apart. We can just wake up together every morning and no one is going to have morning breath. We’re not going to have any problems.’ And then the problems hit and you don’t know where to file those into your picture. . . The idea I’m trying to say is: ‘Can you lay down who you thought I was and love the me that is? Can we take this from where we are now and realize that I can’t be that person?’ Only God is going to be able to make this work and broken people can be broken together. To me, it’s probably the most important song on the record.”

Song after song on the album deals with tough topics and frames life’s challenging moments in Biblical perspective. “House of Their Dreams” paints a portrait of a family who has achieved what the world views as success, but inside their home, they are aching with emptiness and isolation. “Just Be Held” shares an uplifting message for anyone struggling as Hall shares what our heavenly father wants his children to remember: “Your world’s not falling apart, it’s falling into place. I’m on the throne. Stop holding on and just be held.”

“Waiting on the Night to Fall” is a powerful ballad that displays the depth and range in Hall’s voice. The haunting lyric about addiction uses the metaphor of an old man lurking in the woods, biding his time, as Hall sings: “He knows you have the answers, but truth lies dusty on your shelf and the sword that you could slay him with has become an ornament and nothing else.”

“Dream for You” features Hall’s youth group singing background vocals. The song reminds us God’s dream for us is bigger than we could ever imagine. “We have this picture of who God can use,” Hall says, noting that when God spoke to Moses, he found reasons he couldn’t do what God asked. “What God had to do for Moses is He had to wipe away that picture and say, ‘I’m going to use you.’ It’s the same way with us. When God hits us with something like ‘You need to teach this small group’ or ‘you need to live on a mission field,’ we immediately look in our own backpack at our gifts and skills. If I would have lived on that, I would have never been a youth pastor. I would have never written a song. I would have never stood up in front of anybody. I don’t have any of those things in my backpack. . . God is saying, ‘There’s an X-factor here. If you would just step up, I’ll do something that will blow your mind.’”

Working again with producer Mark Miller, who signed the band to his label more than a decade ago, Casting Crowns has crafted another collection of songs that are entertaining and innovative, yet lyrically substantive. Thrive is a rich aural feast that leaves everyone with plenty of food for thought. In writing songs for Thrive, Hall enlisted some of his favorite collaborators, among them Matthew West, Matt Maher and Bernie Herms.

It’s been more than 10 years since the members of Casting Crowns heard their first single on the radio in July 2003, the same day Hall and his wife Melanie welcomed their daughter Zoe. Since then so much has happened in the lives of each member and along the way God has taught them so much. “He’s opened our eyes to our suspicion that He was way bigger than we thought He was,” Hall says with a smile. “He didn’t need Casting Crowns to come along to help His word get out. God is winning. He’s changing the world. It may look at times like things are getting darker and darker, but they are not. Everywhere you go, you can see light and light wins. It always wins.”', N'https://mtracks.azureedge.net/public/images/artists/cover/512/279.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/279.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (367, CAST(N'2016-01-28T11:15:00' AS SmallDateTime), N'Red Rocks Worship', N'Red Rocks Worship is the expression of a dynamic community called Red Rocks Church comprised of worshipers, creatives, songwriters, friends and family all seeking to bring people closer to God.  Based in Denver yet with campuses and reach around the globe, Red Rocks Church and Red Rocks Worship exist to make Heaven more crowded. "We are ONE church in multiple locations. We desire to be a home for the prodigal, an authentic people, humble, generous, and unified. We want everyone to know the only way, the truth, and the life found in Jesus.” - Red Rocks Church  

Their most recent song offerings include the powerful anthem "Echo Holy" & the timely and captivating "Something Has To Break" from their latest EP "Things Of Heaven (Where We Come From) which will lead up to their forthcoming project, “Things Of Heaven (Where We''re Going)” releasing summer 2021.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/367.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/367.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (400, CAST(N'2016-04-12T11:30:00' AS SmallDateTime), N'Todd Dulaney', N'Todd Dulaney spent most of his life pursuing a baseball career, playing 5 years of professional baseball. Now, his joy comes from serving the Lord in any and every capacity of life. He is steadfast and sold out to God and his eyes are focused on ministry and fulfilling His purpose. Dulaney''s dream is to write music which ministers to the heart of God and touches the heart of man. Not what''s hot, but what delivers, what heals, what restores, music that God inhabits. 

<!-- read more -->
Born December 20, 1983 in Maywood, IL, Dulaney grew up as a singer and an elite athlete. After graduating from high school in 2001, Dulaney was drafted from Community College in Mt. Carmel, IL, by the New York Mets to pursue a professional baseball career. While refining his athletic skills, Dulaney realized that there was a higher calling upon his life. He accepted an invitation to travel and perform background vocals for gospel artist and Grammy winner Smokie Norful. 

Todd has worked and shared the stage with many award-winning artists, including Vanessa Bell Armstrong, Jessica Reedy, Maurette Brown-Clark, Michelle Williams, Donnie McClurkin, Fred Hammond, Dr Bobby Jones, Ernest Pugh, TRIN-I-TEE 5:7, Nicole and David Binion, Tye Tribett and Donnie McClurkin just to name a few. God has opened many doors on his behalf allowing him to minister in song at churches worldwide. Dulaney has made appearances on BET''s Bobby Jones Gospel, TBN "Praise the Lord", 15th Street Live, Atlanta Gospel Live, BBTV, TCT "I''m Just Sayin", The 2011 Merge Summit and (3) nominations for the 2012 Stellar Awards second round ballot. Todd is currently a faithful member under the ministry of Dr. Bill Winston at Living Word Christian in Forest Park, IL. He is married to the lovely Kenyetta Stone-Dulaney and his greatest accomplishments are his two lovely children Taylor and Todd Jr.

One thing that Todd desires, is to keep the message of Christ on display more than the brand of the artist.  "Without the Christ of the Gospel, we don''t have Gospel/Christian music" ', N'https://mtracks.azureedge.net/public/images/artists/cover/512/400.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/400.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (421, CAST(N'2016-05-13T11:54:00' AS SmallDateTime), N'Mosaic MSC', N'MOSAIC MSC, a collective of some of Los Angeles’ most talented and culturally diverse singers and musicians, scored their biggest Billboard hit to date in March 2018 with the soulful anthem “Tremble,” which spent 33 weeks on the Hot Christian Songs chart and peaked in the Top 20. The group is the heartbeat of Mosaic, a church founded by cultural pioneer and best-selling author Erwin McManus.  Their debut studio album HEAVEN (produced by Grammy nominated Chad Copelin) was released in September 2018 and quickly reached the Top 30 on the Billboard Top Christian Albums chart. MOSAIC MSC has garnered more than 95 million streams and one million monthly listeners in more than 65 countries.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/421.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/421.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (444, CAST(N'2016-06-29T08:57:00' AS SmallDateTime), N'Leeland', N'Leeland came to the forefront of the worship music world in 2004 and debuted their first project, the revolutionary Sound of Melodies, in 2006. Fast forward to now with four GRAMMY® nominations and eight GMA Dove Award® nominations under their belts, Leeland has become one of the most important voices in a new generation of worship music. Their lives, ministry, and music are a true extension of their passion to simply worship God personally and in community.

<!-- read more -->

Along with 4 Grammy Nominations and 8 Dove Award Nominations, Leeland brings a wealth of experience and excellence to Bethel Music. After touring as a band since 2004, Leeland is excited to partner with Bethel Church and the Bethel Music worship movement. Although they will live with their families in Nashville, TN, Leeland will be a part of songwriting, albums, tours, conferences, and local church worship when they visit Redding, CA.', N'https://mtracks.azureedge.net/public/images/artists/cover/512/444.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/444.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (461, CAST(N'2016-08-19T09:19:00' AS SmallDateTime), N'Cody Carnes', N'Cody Carnes is a worship leader and songwriter whose passion is to create a meeting place for God and people with music. He spends most of his time traveling and leading worship with his wife Kari Jobe Carnes. The couple have co-written numerous songs together including "Closer To Your Heart," "The Garden" and "Lover Of My Soul" from her album The Garden and "Let The Heavens Open" from her album Majestic. He also wrote "The Cross Has The Final Word" - a hopeful, declarative anthem about the overcoming power of Jesus'' name. His debut album, The Darker The Night / The Brighter The Morning released September 2017 with Capitol Christian Music Group. Earlier this year, Carnes released the song "Nothing Else," which he performed live at Passion 2019 for more than 40,000 young adults. 

Carnes resides in Nashville, Tennessee with his wife and their toddler boy Canyon and newborn son Kingston. 
<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/461.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/461.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (566, CAST(N'2017-04-12T14:25:00' AS SmallDateTime), N'Community Music', N'Based out of Chicago, Community Music is the newest addition to a global church planting movement called NewThing started by COMMUNITY Christian Church with over 1,200 churches worldwide. Community Music is comprised of church planters and artists who work together to equip local and global artists and leaders in the Jesus Mission. With a church planting and multiplication DNA they are writing songs for the Church with a clear message that Love overcomes fear and that worship is bigger than just songs and Sundays.

<!-- read more -->
', N'https://mtracks.azureedge.net/public/images/artists/cover/512/566.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/566.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (636, CAST(N'2017-09-07T10:19:00' AS SmallDateTime), N'The Belonging Co', N'The Belonging Co is a church movement based in Nashville, TN. Since it’s inception in 2014, the church has become known as a place to find freedom, breakthrough, and healing through God’s Word, His presence and worship.

The heart of The Belonging Co is that every song released would empower both individuals and the collective body of Christ to encounter God through worship, and experience the freedom that comes through knowing Jesus.

We desire encounter over entertainment, intimacy over industry, presence over presentation, people over position... And most of all JESUS over everything.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/636.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/636.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (660, CAST(N'2017-10-30T11:13:00' AS SmallDateTime), N'Cory Asbury', N'Fueled with a passion to see people encounter the love of the Father, Cory Asbury is a songwriter, singer, speaker, author and worship leader who joined the Bethel Music Collective in May of 2015. Cory began leading worship at his local church at age fourteen, and from there launched into fulltime worship ministry at the International House of Prayer in Kansas City in 2005, until he joined the Bethel Music Collective. Cory is known for his hit single “Reckless Love” inspired by Cory’s journey of discovering the Father’s heart through the birth of his first son and the near-loss of his first daughter. The song was nominated for a Grammy in 2019 after winning two GMA Dove Awards and two K-Love Fan Awards in 2018. His album by the same name hit the top of the charts as Billboard’s #1 Christian Album and won a GMA Dove Award for Worship Album of the Year in 2018. Cory has also received three Billboard Music nominations for Top Christian Artist, Top Christian Album and Top Christian Song of the year. After taking a year off to rest with his family in 2019, Cory is back on the scene with new projects, songs, and a deeper revelation of the Father’s heart. His newest single “The Father’s House” paints a picture of the delight and freedom that is found when we enter the Father’s house and portrays the deep message of identity and sonship in a fun and energetic way. After seeing the impact of “Reckless Love” on listeners around the world, Cory teamed up with Tori Kelly to release “Reckless Love” as a remix with a new, fresh sound in January 2020. Cory also published a devotional for discovering the Father’s heart called Reckless Love that is full of personal stories behind the song. Cory can be found on Bethel Music albums VICTORY (2019) with his song “Endless Hallelujah,” Bethel Music en Español (2019) with “Incontrolable Amor,” and Have It All (2016) with “Son of God.” His first solo album, Let Me See Your Eyes (2009) includes well-known songs “Where I Belong,” “So Good to Me,” and “Jesus, Let Me See Your Eyes.” Cory and his family live in Kalamazoo, Michigan where he serves as a worship pastor and artist in residence. Cory and his wife Anna have four beautiful children—Gabriel, Lily, River, and Willow-Grace.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/660.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/660.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (673, CAST(N'2017-11-28T09:29:00' AS SmallDateTime), N'Here Be Lions', N'Dustin Smith Ministries has recently been rebranded as "Here Be Lions", made up of a ministry team that Dustin leads.', N'https://mtracks.azureedge.net/public/images/artists/cover/512/673.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/673.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (757, CAST(N'2018-04-04T14:26:00' AS SmallDateTime), N'Pat Barrett', N'Best known as the primary singer/songwriter for the band Housefires, Pat Barrett is a worship leader at Grace Midtown in Atlanta, GA. With songs such as “Build My Life” and “Good Good Father,” Barrett is a key songwriter and artist in the broader worship community. He is the first signing on Chris Tomlin’s new label imprint, Bowyer & Bow, in partnership with Capitol CMG. His debut EP is out now, with a full-length album coming later this year.

<!-- read more -->
', N'https://mtracks.azureedge.net/public/images/artists/cover/512/757.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/757.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (872, CAST(N'2018-12-03T13:07:00' AS SmallDateTime), N'UPPERROOM', N'UPPERROOM is a community of believers that values and pursues the manifest presence of God. UPPERROOM is also a praying church that ministers to the heart of the Lord morning, noon, and night fulfilling the greatest commandment to love the Lord our God with all our hearts, souls and minds. Our community is built around this rhythm of life: coming into His presence with thanksgiving and praise, agreeing with who He is through worship and agreeing with what He will do through prayer. This daily Levitical lifestyle transforms us more into His likeness and positions us to go out full of faith in our God and His purposes. As we seek the heart of God together in worship and prayer, new songs of thanksgiving, praise and worship are birthed. These new songs help us to express our hearts to Him. We desire to equip the body of Christ to sing these new songs by providing resources for worship teams in local churches.
 
May you experience the manifest presence of God as you sing these songs. Blessings.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/872.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/872.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (913, CAST(N'2019-03-04T09:35:00' AS SmallDateTime), N'JJ Hairston', N'JJ Hairston and Youthful Praise (affectionately known as YP) continue to make waves in the Gospel Music Industry while garnering national and international recognition. Founded in 1991, the once 35-member church choir from Bridgeport, CT has transformed into a Billboard chart topping national gospel artist.

<!-- read more -->
In 2018, Hairston and the group won 6 Stellar Gospel Music Awards, a Billboard Music Award, and an ASCAP Rhythm & Soul Award. JJ Hairston and Youthful Praise were also nominated for a 2018 GRAMMY for Best Gospel Performance/Song for their infectious worship song “You Deserve It”.

Youthful Praise has performed on several national platforms including, Good Morning America, the McDonald’s Inspiration Celebration Gospel Tour, the Stellar Gospel Music Awards, T.D. Jakes’ MegaFest, and Essence Music Festival to name a few.

Currently, Hairston is preparing for the 2019 release of his new album that has yet to be titled. The album was recorded over 2 live sessions at COZA in Abuja, Nigeria and also in Upper Marlboro, MD at City of Praise Family Ministries where he serves as Minister of Music. He also has a syndicated radio show, ?Youthful Praise with JJ Hairston, and he is preparing for the publication of his new book, "Amazing Love," both in partnership with his wife, Trina.

JJ Hairston is the CEO and founder of the record label Jamestown Music. Hairston’s goal is to continue to develop music through this venture that can be used as a tool for audiences everywhere to develop their personal relationship with God.', N'https://mtracks.azureedge.net/public/images/artists/cover/512/913.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/913.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (991, CAST(N'2019-07-01T14:34:00' AS SmallDateTime), N'Brandon Lake', N'Brandon Lake joined the Bethel Music Collective in January 2019. Brandon is a worship pastor at Seacoast Church in Charleston, South Carolina, and has a passion to write songs for the Church that ultimately further the Kingdom of God.

Brandon Lake released his latest single “This Is A Move” in summer of 2019, co-written with Tasha-Cobbs Leonard as a declaration that miracles, signs, and wonders are still part of God’s nature today. “Pour Me Out,” released in 2018, while his first album released in 2016 called Closer. 

Brandon believes that the people of God should be the freest people on the planet, and he is passionate about releasing joy and excitement while pursuing the presence of God in worship. 

<!-- read more -->
', N'https://mtracks.azureedge.net/public/images/artists/cover/512/991.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/991.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1008, CAST(N'2019-08-14T12:31:00' AS SmallDateTime), N'We the Kingdom', N'Newly signed to Capitol CMG, We the Kingdom features members of the Cash family, most notably Ed Cash, who is an accomplished producer (Bethel, Chris Tomlin, NeedtoBreathe, Crowder, Phil Wickham) and noted songwriter whose credits include “How Great is Our God”, “Red Letters, ”Jesus Messiah”, “Whom Shall I Fear,” “All My Hope” and many others. We The Kingdom’s sound is a unique blend of worship, vulnerability and grit that points people to a transforming experience with Jesus. Their debut EP is due out Fall 2019.

<!-- read more -->
“The heart of We The Kingdom is to create music that candidly tells how God reached into the middle of our brokenness, and drew us into His story of redemption. Songs of testimony and worship have been a healing salve for us. We want to share our journey with others with the hope that God will use that as a catalyst for healing in others. Our heart’s desire is to see captives set free, relationships restored, and people brought to the Cross. We pray that God would sew the thread of His promises through the stories of each song we write, and weave together a tapestry that points straight to the great love of Jesus.”', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1008.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1008.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1040, CAST(N'2019-11-04T10:54:00' AS SmallDateTime), N'CeCe Winans', N'If you ask CeCe Winans what drives her, the answer will be far removed from her endless list of accolades, best-selling albums, widespread industry recognition, and vast amounts of press coverage.

She’ll make no mention of the multiple GRAMMY®, Stellar, and Dove awards she’s garnered over the years, let alone the several gold-and platinum-certified albums she’s scored-not even those she nabbed with brother BeBe as part of the hit-making duo BeBe & CeCe Winans.

<!-- read more -->
She won’t tell you she’s graced the covers of high-profile publications such as Essence, Jet, CCM, and Today’s Christian Woman, among countless others, or that she’s made her rounds in the talk-show circuit, making appearances on The Today Show, Good Morning America, Oprah, Live with Regis & Kathie Lee, and more. And radio hits? Forget about it.

When all is said and done, CeCe’s heart lies someplace else. Thy Kingdom Come (PureSprings Gospel), her eighth solo album, is a reflection of where her heart resides: in the very inner court of the heavenly realms, where Christ Himself is enthroned.

“When you’re in the throne room, your focus is just God,” CeCe says. “Nothing’s more powerful than that. When you do other music-positive music, gospel, inspirational, whatever you want to name it-you’re teaching lessons to other people, which is still very important. But nothing is more powerful than when you’re face to face with God.”

Purified, CeCe’s chart-topping 2005 release, saw the singer entertaining her pop sensibilities, proving once again that she excels at interpreting buoyant, life-affirming songs that a wider audience could embrace. But Thy Kingdom Come is different: it finds the gospel veteran going back to what she does best, namely, lavishing honor and glory upon the King of Kings, while rallying His people to live like royal priesthood.

Not one to pick favorites, she says she loves both ends of the spectrum. But something about singing for God and His church strikes a cord in her that not even the most uplifting, stirring pop tune can.

“Singing for God and his people, It’s more home for me,” she says. “I’m most comfortable because I don’t even have to think hard. It’s something I love and I’ve been doing it for a long time. It comes from the heart. It touches the heart. I get lost in His will. I guess I have more fun shouting from the mountaintop.”

And shout she does. For all intents and purposes, Thy Kingdom Come is one of the most empowering, moving collections of songs CeCe has recorded thus far. To make sure she reached the summit, she wrote or co-wrote 8 of the 14 songs on the project and she enlisted a who’s-who of producers to help her get there, including Tommy Sims, Luther “Mano” Hanes, Percy Bady, new comer Christopher Capehart and his production partner Brannon Tunie, Cedric & Victor Caldwell, and even her own son, Alvin Love III.

Together, they crafted one of the most compelling and complete works in CeCe’s career, combining into one the best-known elements of her beloved repertoire, including the splendor of Alone in His Presence, the worshipful spirit of Alabaster Box, the celebratory nature of her self-titled effort, and the praise-and-worship class of Throne Room.

From the driving, congregational vibe of the project’s second track “Forever”, written by CeCe, one can sense she is once again in her home turf, doing what she loves for an audience that knows what she’s all about. The song is a rousing anthem for the church-a Sunday-morning praise session like only a Winans can deliver.

From there, Thy Kingdom Come ebbs and flows through a variety of styles and movements, spanning energetic urban gospel, beautifully orchestrated balladry, and joyful corporate worship. No matter where she stands in the musical spectrum, CeCe simply owns the lyric, cognizant that she’s simply preparing the listener for deeper intimacy with the Divine God.

“It’s great to sing songs that help us or that encourage us to live right, or to talk right, or to love each other-and those are all powerful messages, things that God smiles upon,” CeCe says. “But when you just talk about the power of the living God and His awesomeness and His holiness, nothing is more powerful than that. It penetrates the heart more than anything.”

Early on in the disc, CeCe seems intent on ushering saints to that place. “He counted us worthy, so let’s be worthy,” she declares triumphantly in the motivational, urban reggae-pop “Worthy”. The song sets the stage for first radio single “Waging War”, a glorious anthem that, once again, reassures believers that the battle is already won-that the victory is ours to take, Christ is our banner and we must be willing to fight.

Through “The Coast Is Clear”, a song written by CeCe’s son Alvin Love III, CeCe invites worshippers to the presence of the Almighty Himself, bidding them to enter into sacred ground. In addition songs like “Oh Holy Place” and “You’re the One”, two heartfelt, beautifully arranged displays of symphonic grandeur, punctuated by live instrumentation and emotive piano, portray CeCe’s unmistakable gift for worship.

That place, CeCe says, is her favorite place to be.

“Being on the corner, preaching to the lost, which is what Jesus came here for in the first place, is important,” she says. “But when you just sit in the sanctuary, you’re just surrounded by His presence. You just rest in the sanctuary, you’re just surrounded by His presence. You just rest and you flow there”.

“At the end of the day, if I’m sitting in church, I’m really happy, I’m really at home. When you’re outside of that, it becomes more about the call. But when you’re inside, you don’t have to be mindful of other things. You’re just alone in His presence.”', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1040.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1040.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1068, CAST(N'2020-01-15T12:03:00' AS SmallDateTime), N'The Church Will Sing', N'The Church Will Sing embarks on Volume 2 with the release of the song “Make Room” featuring Elyssa Smith of UPPERROOM and Community Music (May 15,2020)
 
Penned by Community Music’s husband and wife worship leaders, Lucas Cortazio and Evelyn Heideriqui along with Nashville based writers Josh Farro (formerly of Paramore and co-writer of “This Is Amazing Grace,”) and Bekah White; “Make Room” is a prayer for God to take the place that is rightfully His in our lives.  
 
The Church Will Sing, incorporates churches from all around the United States as the featured vocal of it’s songs.  Volume 1 was the home for several church anthems including “Even Louder”, the collaboration between Bethel Music’s Tony Brown, Housefires Jonathan Jay, and Word Music’s Matt Armstrong and Benji Cowart.  After the initial “The Church Will Sing” release it was later recorded by several worship leaders as well as hip hop artist Steven Malcolm featuring Natalie Grant.  There is great anticipation for Volume 2 which is being recorded now.  For more information visit www.TheChurchWillSing.com

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1068.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1068.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1076, CAST(N'2020-02-12T09:26:00' AS SmallDateTime), N'Church of the City', N'Church of the City is a family of churches spread across the Nashville, Tennessee area that seeks to pursue the way of Jesus for the renewal of the city. Founde
<!-- read more -->d by pastor Darren Whitehead in 2013, Church of the City quickly became a home for many of the artists, songwriters, and creatives who call "Music City" home. In 2016, a collection of these artists gathered together to begin writing songs in response to all they were experiencing in the church and around the city. Church of the City''s debut EP, due in early 2020, is the first recorded collection of these songs. Recorded live with their church family and led by worship leaders Chris McClarney and Jon Reddick, along with a rotating cast of worship leaders and musicians, this project marks a new chapter in the Church of the City story as its songs go out the world for the first time.
', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1076.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1076.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1110, CAST(N'2020-04-15T14:54:00' AS SmallDateTime), N'Maverick City Music', N'Maverick City started with a dream to make space for folk that would otherwise live in their own separate worlds. To break the unspoken rules that exist in the CCM and Gospel World! But I think more importantly to be a mega phone for a community of creatives that have been pushed to the margins of the industry of Church Music. What brings us together, and that sound that is vivaciously smacking you in the face the first time you hit play on on a Maverick track. Isn’t the sound of a community that centered around their deprivation, it’s the audacious sound of true belonging: The beautiful harmony of long lost family.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1110.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1110.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1268, CAST(N'2021-03-03T14:25:00' AS SmallDateTime), N'Charity Gayle', N'Charity Gayle houses a powerful voice which has a fresh yet reminiscent sound. She loves the Lord with fierce faith and has authored songs such as "Amen" "Enter In (Psalm 100)" "New Name Written Down in Glory" "Cleansed" and more. Charity grew up in a home full of worship and has been involved in ministry since she was a child. Charity is featured on The Emerging Sound records Volume 1 through 5. Her first solo album, ‘Lord, You are My Song'' debuted at #1 in the Christian & Gospel genre and #20 in all genres in January 2018. She is currently writing for her highly anticipated sophomore album coming soon.

Charity lives and leads worship with her husband Ryan Kennedy and continues to minister in the US and globally.

<!-- read more -->', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1268.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1268.jpg')
INSERT [dbo].[Artist] ([artistID], [dateCreation], [title], [biography], [imageURL], [heroURL]) VALUES (1321, CAST(N'2021-06-03T10:01:00' AS SmallDateTime), N'Anne Wilson', N'', N'https://mtracks.azureedge.net/public/images/artists/cover/512/1321.jpg', N'https://mtracks.azureedge.net/public/images/artists/hero/2420/1321.jpg')
SET IDENTITY_INSERT [dbo].[Artist] OFF
GO
SET IDENTITY_INSERT [dbo].[AssessmentSteps] ON 

INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (1, N'Familiarize yourself with the code in the solution.')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (2, N'Familiarize yourself with the data structures in the SQL project.')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (3, N'Implement (Sync) Artist Details Page.<ul>')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (4, N'Find markup in the folder multitracks.com-dotNet\Web\multitracks.com\multitracks.com\PageToSync')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (5, N'Create a new page artistDetails.aspx using the provided markup')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (6, N'Make the page data driven to display the appropriate images / text for a given parameter of artistID')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (7, N'The page should pull all the needed data from a Stored Procedure (GetArtistDetails)')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (8, N'The page should make use of the MTDataAccess Class Library. Look at the source of this page for an example. (ExecuteStoredProcedureDS will return a DataTable rather than a DataSet if multiple result sets are needed)</ul>')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (9, N'Implement an API by adding a project under the Web folder in the solution. Use the technology of your choice here (MS Stack). The API should accomplish these tasks:<ul>')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (10, N'Endpoint to search for an artist by name (api.multitracks.com/artist/search)')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (11, N'Endpoint to list all songs with paging support using page size, page number, etc. (api.multitracks.com/song/list)')
INSERT [dbo].[AssessmentSteps] ([stepID], [text]) VALUES (12, N'Endpoint to add an Artist to the Artist table (api.multitracks.com/artist/add)</ul>')
SET IDENTITY_INSERT [dbo].[AssessmentSteps] OFF
GO
SET IDENTITY_INSERT [dbo].[Song] ON 

INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (29, CAST(N'2007-08-11T09:45:00' AS SmallDateTime), 31, 1, N'You Are Good', CAST(128.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (572, CAST(N'2010-12-10T13:04:00' AS SmallDateTime), 66, 2, N'Our God', CAST(105.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (721, CAST(N'2011-10-11T23:45:00' AS SmallDateTime), 87, 52, N'10,000 Reasons', CAST(72.50 AS Decimal(6, 2)), N'3', 0, 0, 0, 1, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (951, CAST(N'2012-09-21T09:31:00' AS SmallDateTime), 163, 5, N'Cornerstone', CAST(71.50 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (984, CAST(N'2012-10-13T21:59:00' AS SmallDateTime), 163, 5, N'I Surrender', CAST(77.00 AS Decimal(6, 2)), N'13', 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (1150, CAST(N'2013-02-25T14:21:00' AS SmallDateTime), 195, 31, N'Oceans (Where Feet May Fail)', CAST(132.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (1248, CAST(N'2013-04-25T11:35:00' AS SmallDateTime), 210, 118, N'Great Are You Lord', CAST(72.00 AS Decimal(6, 2)), N'13', 1, 0, 1, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (1360, CAST(N'2013-08-29T14:44:00' AS SmallDateTime), 233, 152, N'Wake', CAST(131.00 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (1482, CAST(N'2013-11-07T08:39:00' AS SmallDateTime), 239, 165, N'This Is Amazing Grace', CAST(98.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (1688, CAST(N'2014-03-25T12:56:00' AS SmallDateTime), 276, 174, N'Holy Spirit', CAST(72.00 AS Decimal(6, 2)), N'3', 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (1778, CAST(N'2014-04-30T10:47:00' AS SmallDateTime), 292, 118, N'Great Are You Lord', CAST(72.00 AS Decimal(6, 2)), N'13', 0, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (1986, CAST(N'2014-06-18T16:50:00' AS SmallDateTime), 319, 5, N'This I Believe (The Creed)', CAST(71.02 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (2557, CAST(N'2015-01-08T09:53:00' AS SmallDateTime), 418, 107, N'No Longer Slaves', CAST(74.00 AS Decimal(6, 2)), N'3', 0, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (3775, CAST(N'2015-09-30T19:52:00' AS SmallDateTime), 942, 2, N'Good Good Father', CAST(72.50 AS Decimal(6, 2)), N'13', 0, 0, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (3844, CAST(N'2015-10-15T10:31:00' AS SmallDateTime), 587, 5, N'O Praise the Name (Anástasis)', CAST(72.50 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (4359, CAST(N'2016-01-18T12:55:00' AS SmallDateTime), 665, 172, N'Here As In Heaven', CAST(69.50 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (4364, CAST(N'2016-01-18T13:20:00' AS SmallDateTime), 665, 172, N'O Come to the Altar', CAST(70.00 AS Decimal(6, 2)), N'13', 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (4532, CAST(N'2016-02-17T13:05:00' AS SmallDateTime), 693, 107, N'Lion and the Lamb', CAST(90.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (5845, CAST(N'2016-09-15T10:52:00' AS SmallDateTime), 784, 421, N'Tremble', CAST(74.00 AS Decimal(6, 2)), N'3', 1, 1, 0, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (5875, CAST(N'2016-09-20T13:31:00' AS SmallDateTime), 909, 5, N'What a Beautiful Name', CAST(68.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (6684, CAST(N'2017-02-14T09:16:00' AS SmallDateTime), 1055, 140, N'Glorious Day', CAST(110.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (6687, CAST(N'2017-02-14T09:35:00' AS SmallDateTime), 1055, 140, N'Build My Life', CAST(70.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (6688, CAST(N'2017-02-14T09:40:00' AS SmallDateTime), 1055, 140, N'Holy Ground', CAST(72.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (6725, CAST(N'2017-02-21T13:59:00' AS SmallDateTime), 1051, 172, N'Do It Again', CAST(86.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (6894, CAST(N'2017-03-15T08:29:00' AS SmallDateTime), 1094, 107, N'King Of My Heart', CAST(68.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (8462, CAST(N'2017-10-27T13:25:00' AS SmallDateTime), 1509, 660, N'Reckless Love', CAST(83.00 AS Decimal(6, 2)), N'13', 0, 1, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (9152, CAST(N'2018-01-15T13:02:00' AS SmallDateTime), 1522, 400, N'Your Great Name', CAST(103.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (9556, CAST(N'2018-02-27T09:36:00' AS SmallDateTime), 1602, 5, N'Who You Say I Am', CAST(86.00 AS Decimal(6, 2)), N'13', 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (9754, CAST(N'2018-03-19T08:53:00' AS SmallDateTime), 1899, 165, N'Living Hope', CAST(72.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (9770, CAST(N'2018-03-22T11:29:00' AS SmallDateTime), 1568, 237, N'Yes I Will', CAST(75.00 AS Decimal(6, 2)), N'3', 0, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (9891, CAST(N'2018-04-04T14:33:00' AS SmallDateTime), 1887, 757, N'Build My Life', CAST(72.00 AS Decimal(6, 2)), N'3', 1, 1, 0, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (10175, CAST(N'2018-05-24T11:40:00' AS SmallDateTime), 1899, 165, N'Great Things', CAST(102.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (10503, CAST(N'2018-07-10T11:41:00' AS SmallDateTime), 1853, 174, N'Freedom', CAST(124.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (10666, CAST(N'2018-08-06T10:39:00' AS SmallDateTime), 2020, 172, N'Won''t Stop Now', CAST(122.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (10694, CAST(N'2018-08-15T13:22:00' AS SmallDateTime), 2020, 172, N'Here Again', CAST(68.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (10825, CAST(N'2018-08-28T09:52:00' AS SmallDateTime), 2020, 172, N'Echo', CAST(104.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (11088, CAST(N'2018-09-25T12:56:00' AS SmallDateTime), 2020, 172, N'Worthy', CAST(67.50 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (11593, CAST(N'2018-12-05T12:17:00' AS SmallDateTime), 2393, 31, N'Good Grace', CAST(71.00 AS Decimal(6, 2)), N'3', 0, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (11695, CAST(N'2019-01-03T14:05:00' AS SmallDateTime), 2171, 107, N'Raise a Hallelujah', CAST(82.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (11699, CAST(N'2019-01-03T14:23:00' AS SmallDateTime), 2171, 107, N'Goodness of God', CAST(63.00 AS Decimal(6, 2)), N'3', 0, 0, 0, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (11704, CAST(N'2019-01-03T14:28:00' AS SmallDateTime), 2171, 107, N'Stand in Your Love', CAST(72.50 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (12105, CAST(N'2019-02-20T14:29:00' AS SmallDateTime), 2330, 872, N'Surrounded (Fight My Battles)', CAST(68.50 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (12365, CAST(N'2019-03-14T13:42:00' AS SmallDateTime), 2393, 31, N'Another In The Fire', CAST(67.50 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (12889, CAST(N'2019-05-06T13:53:00' AS SmallDateTime), 2540, 566, N'Make Room', CAST(61.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (13013, CAST(N'2019-05-16T10:01:00' AS SmallDateTime), 2170, 461, N'Nothing Else (Live)', CAST(68.00 AS Decimal(6, 2)), N'1', 1, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (13654, CAST(N'2019-07-01T15:04:00' AS SmallDateTime), 2844, 5, N'King of Kings', CAST(68.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (13858, CAST(N'2019-07-19T14:49:00' AS SmallDateTime), 3258, 461, N'Run To The Father', CAST(68.50 AS Decimal(6, 2)), N'13', 0, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (13965, CAST(N'2019-08-08T09:50:00' AS SmallDateTime), 2812, 172, N'See a Victory', CAST(77.50 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (14175, CAST(N'2019-08-29T09:53:00' AS SmallDateTime), 2822, 444, N'Way Maker', CAST(68.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (14789, CAST(N'2019-10-17T14:05:00' AS SmallDateTime), 2940, 673, N'I Speak Jesus', CAST(74.00 AS Decimal(6, 2)), N'3', 1, 1, 0, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (15344, CAST(N'2019-12-30T08:25:00' AS SmallDateTime), 3258, 461, N'Christ Be Magnified', CAST(72.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (15474, CAST(N'2020-01-15T16:14:00' AS SmallDateTime), 3144, 660, N'The Father''s House', CAST(81.00 AS Decimal(6, 2)), N'3', 0, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (15554, CAST(N'2020-01-31T11:28:00' AS SmallDateTime), 3476, 107, N'God Of Revival', CAST(72.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (15813, CAST(N'2020-03-04T10:27:00' AS SmallDateTime), 3476, 107, N'We Praise You', CAST(85.50 AS Decimal(6, 2)), N'3', 1, 1, 0, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (15855, CAST(N'2020-03-09T14:51:00' AS SmallDateTime), 3260, 172, N'Graves Into Gardens', CAST(70.00 AS Decimal(6, 2)), N'13', 1, 1, 0, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (15883, CAST(N'2020-03-12T09:35:00' AS SmallDateTime), 3260, 172, N'The Blessing', CAST(70.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (15986, CAST(N'2020-03-26T12:46:00' AS SmallDateTime), 3776, 152, N'Lord Send Revival', CAST(74.50 AS Decimal(6, 2)), N'13', 0, 0, 1, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16013, CAST(N'2020-03-30T09:44:00' AS SmallDateTime), 3476, 107, N'Egypt', CAST(75.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16020, CAST(N'2020-03-30T14:28:00' AS SmallDateTime), 3260, 172, N'My Testimony', CAST(97.00 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16061, CAST(N'2020-04-02T12:43:00' AS SmallDateTime), 3352, 1076, N'You Keep Hope Alive', CAST(77.00 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16199, CAST(N'2020-04-15T14:19:00' AS SmallDateTime), 3389, 872, N'Rest On Us', CAST(74.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16223, CAST(N'2020-04-15T14:59:00' AS SmallDateTime), 3391, 1110, N'Promises', CAST(86.00 AS Decimal(6, 2)), N'13', 1, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16239, CAST(N'2020-04-21T09:30:00' AS SmallDateTime), 3260, 172, N'Rattle!', CAST(76.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16305, CAST(N'2020-04-29T11:08:00' AS SmallDateTime), 3260, 172, N'Available', CAST(80.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16307, CAST(N'2020-04-29T11:14:00' AS SmallDateTime), 3260, 172, N'Never Lost', CAST(62.00 AS Decimal(6, 2)), N'13', 1, 1, 0, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16443, CAST(N'2020-05-11T12:28:00' AS SmallDateTime), 3476, 107, N'Champion', CAST(72.00 AS Decimal(6, 2)), N'13', 1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16500, CAST(N'2020-05-18T11:12:00' AS SmallDateTime), 3496, 1068, N'Make Room', CAST(62.00 AS Decimal(6, 2)), N'3', 0, 1, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16545, CAST(N'2020-05-21T10:49:00' AS SmallDateTime), 3476, 107, N'Anything Is Possible', CAST(122.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16582, CAST(N'2020-05-27T11:16:00' AS SmallDateTime), 3666, 1008, N'God So Loved', CAST(100.00 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (16948, CAST(N'2020-07-06T13:16:00' AS SmallDateTime), 3776, 152, N'World Outside Your Window', CAST(137.00 AS Decimal(6, 2)), N'3', 0, 0, 0, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (17043, CAST(N'2020-07-20T13:47:00' AS SmallDateTime), 3666, 1008, N'Child of Love', CAST(100.00 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (17381, CAST(N'2020-08-19T11:42:00' AS SmallDateTime), 3776, 152, N'Need Your Love', CAST(126.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (17414, CAST(N'2020-08-23T18:13:00' AS SmallDateTime), 4603, 165, N'Battle Belongs', CAST(81.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (18728, CAST(N'2021-01-04T08:58:00' AS SmallDateTime), 4180, 991, N'House of Miracles', CAST(71.50 AS Decimal(6, 2)), N'3', 1, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (18775, CAST(N'2021-01-12T16:40:00' AS SmallDateTime), 4199, 913, N'Great Jehovah', CAST(100.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (18794, CAST(N'2021-01-13T08:49:00' AS SmallDateTime), 4542, 147, N'Good God Almighty', CAST(81.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (18822, CAST(N'2021-01-15T13:14:00' AS SmallDateTime), 4219, 5, N'Fresh Wind', CAST(63.00 AS Decimal(6, 2)), N'3', 0, 1, 1, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (18836, CAST(N'2021-01-15T14:02:00' AS SmallDateTime), 4423, 367, N'Something Has To Break', CAST(65.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (18882, CAST(N'2021-01-20T14:30:00' AS SmallDateTime), 4240, 1110, N'Rest On Us', CAST(72.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 0, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (18885, CAST(N'2021-01-20T14:33:00' AS SmallDateTime), 4240, 1110, N'I Thank God', CAST(130.00 AS Decimal(6, 2)), N'3', 0, 1, 1, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19047, CAST(N'2021-02-04T12:04:00' AS SmallDateTime), 4287, 1040, N'Believe For It', CAST(79.00 AS Decimal(6, 2)), N'3', 1, 1, 1, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19196, CAST(N'2021-02-17T14:10:00' AS SmallDateTime), 4320, 1008, N'Child of Love (feat. Bear Rinehart of NEEDTOBREATHE)', CAST(100.00 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19320, CAST(N'2021-03-03T14:29:00' AS SmallDateTime), 4366, 1268, N'Thank You Jesus For The Blood', CAST(61.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19559, CAST(N'2021-03-24T12:20:00' AS SmallDateTime), 4550, 172, N'Jireh', CAST(70.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19568, CAST(N'2021-03-25T13:15:00' AS SmallDateTime), 4603, 165, N'House of the Lord', CAST(86.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19986, CAST(N'2021-04-20T11:37:00' AS SmallDateTime), 4550, 172, N'Wait On You', CAST(104.00 AS Decimal(6, 2)), N'18', 1, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19991, CAST(N'2021-04-20T11:39:00' AS SmallDateTime), 4550, 172, N'Used To This', CAST(69.50 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19992, CAST(N'2021-04-20T11:40:00' AS SmallDateTime), 4550, 172, N'Names', CAST(69.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19993, CAST(N'2021-04-20T11:40:00' AS SmallDateTime), 4550, 172, N'Mercy', CAST(62.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 0, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (19995, CAST(N'2021-04-20T11:42:00' AS SmallDateTime), 4550, 172, N'Build Your Church', CAST(89.00 AS Decimal(6, 2)), N'13', 1, 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20115, CAST(N'2021-05-06T11:36:00' AS SmallDateTime), 4594, 636, N'Eyes On You', CAST(125.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20156, CAST(N'2021-05-17T15:25:00' AS SmallDateTime), 4614, 991, N'Too Good To Not Believe', CAST(72.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20183, CAST(N'2021-05-20T09:55:00' AS SmallDateTime), 4624, 461, N'Too Good To Not Believe', CAST(72.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20247, CAST(N'2021-05-25T13:13:00' AS SmallDateTime), 5054, 260, N'Speak to the Mountains', CAST(70.00 AS Decimal(6, 2)), N'13', 1, 0, 1, 0, 0, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20310, CAST(N'2021-05-28T12:37:00' AS SmallDateTime), 4667, 279, N'Scars in Heaven', CAST(80.00 AS Decimal(6, 2)), N'3', 1, 0, 1, 0, 1, 0, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20378, CAST(N'2021-06-03T10:05:00' AS SmallDateTime), 4692, 1321, N'My Jesus', CAST(76.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 1, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20623, CAST(N'2021-06-21T16:04:00' AS SmallDateTime), 4603, 165, N'Hymn of Heaven', CAST(71.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 1, 1)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20837, CAST(N'2021-07-06T11:52:00' AS SmallDateTime), 4895, 31, N'Know You Will', CAST(64.00 AS Decimal(6, 2)), N'3', 1, 0, 0, 0, 1, 1, 0)
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (20960, CAST(N'2021-07-12T15:28:00' AS SmallDateTime), 4982, 1268, N'New Name Written Down In Glory', CAST(98.00 AS Decimal(6, 2)), N'3', 0, 1, 0, 0, 1, 0, 1)
GO
INSERT [dbo].[Song] ([songID], [dateCreation], [albumID], [artistID], [title], [bpm], [timeSignature], [multitracks], [customMix], [chart], [rehearsalMix], [patches], [songSpecificPatches], [proPresenter]) VALUES (21005, CAST(N'2021-07-14T08:55:00' AS SmallDateTime), 5020, 152, N'Phenomena (Da Da)', CAST(132.00 AS Decimal(6, 2)), N'3', 0, 0, 1, 0, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Song] OFF
GO
INSERT [dbo].[TimeSignature] ([idTimeSignature], [timeSignature]) VALUES (N'1', N'2/4')
INSERT [dbo].[TimeSignature] ([idTimeSignature], [timeSignature]) VALUES (N'13', N'6/8')
INSERT [dbo].[TimeSignature] ([idTimeSignature], [timeSignature]) VALUES (N'18', N'12/8')
INSERT [dbo].[TimeSignature] ([idTimeSignature], [timeSignature]) VALUES (N'3', N'4/4')
GO
ALTER TABLE [dbo].[Album] ADD  DEFAULT (getdate()) FOR [dateCreation]
GO
ALTER TABLE [dbo].[Artist] ADD  DEFAULT (getdate()) FOR [dateCreation]
GO
ALTER TABLE [dbo].[Song] ADD  DEFAULT (getdate()) FOR [dateCreation]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Artist] FOREIGN KEY([artistID])
REFERENCES [dbo].[Artist] ([artistID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Artist]
GO
ALTER TABLE [dbo].[Song]  WITH CHECK ADD  CONSTRAINT [FK_Song_TimeSignature] FOREIGN KEY([timeSignature])
REFERENCES [dbo].[TimeSignature] ([idTimeSignature])
GO
ALTER TABLE [dbo].[Song] CHECK CONSTRAINT [FK_Song_TimeSignature]
GO
/****** Object:  StoredProcedure [dbo].[GetAllArtists]    Script Date: 20/04/2023 11:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[GetAllArtists]
AS
BEGIN

	SELECT AR.artistID, AR.title, AR.imageURL, COUNT(AL.artistID) AS albumCount FROM [dbo].[Artist] AR
	LEFT JOIN [dbo].[Album] AL ON AR.artistID = AL.artistID
	GROUP BY AR.title, AR.imageURL, AR.artistID
	ORDER BY AR.title

END
GO
/****** Object:  StoredProcedure [dbo].[GetArtistDetails]    Script Date: 20/04/2023 11:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetArtistDetails]
	@artistID INT
AS
BEGIN

	SET NOCOUNT ON;

	SELECT AR.artistID, AR.title AS ArtistTitle, AR.biography, AR.imageURL AS artistImage, AR.heroURL, 
	AL.albumID, AL.title AS albumTitle, AL.imageURL AS albumImage, AL.[year], AL.artistID AS artistAlbumId,
	S.songID, S.title AS songTitle, S.bpm, S.albumID AS albumSongID,
	T.timeSignature 
	FROM [dbo].[Artist] AR
	LEFT JOIN [dbo].[Album] AL ON AR.artistID = AL.artistID
	LEFT JOIN [dbo].[Song] S ON AL.albumID = S.albumID
	LEFT JOIN [dbo].[TimeSignature] T ON S.timesignature = T.idTimeSignature
	WHERE AR.artistID = @artistID;
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetAssessmentSteps]    Script Date: 20/04/2023 11:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAssessmentSteps]
	@stepID INT = -1
AS
BEGIN

	SELECT [text]
	FROM AssessmentSteps
	WHERE
		@stepID = -1 OR
		stepID = @stepID

END
GO
USE [master]
GO
ALTER DATABASE [MultiTracks] SET  READ_WRITE 
GO
