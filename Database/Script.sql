USE [master]
GO
/****** Object:  Database [Paldesparche]    Script Date: 20/04/2015 7:21:30 p. m. ******/
CREATE DATABASE [Paldesparche]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Paldesparche', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Paldesparche.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Paldesparche_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Paldesparche_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Paldesparche] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Paldesparche].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Paldesparche] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Paldesparche] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Paldesparche] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Paldesparche] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Paldesparche] SET ARITHABORT OFF 
GO
ALTER DATABASE [Paldesparche] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Paldesparche] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Paldesparche] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Paldesparche] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Paldesparche] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Paldesparche] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Paldesparche] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Paldesparche] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Paldesparche] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Paldesparche] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Paldesparche] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Paldesparche] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Paldesparche] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Paldesparche] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Paldesparche] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Paldesparche] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Paldesparche] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Paldesparche] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Paldesparche] SET  MULTI_USER 
GO
ALTER DATABASE [Paldesparche] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Paldesparche] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Paldesparche] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Paldesparche] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Paldesparche]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 20/04/2015 7:21:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Interest]    Script Date: 20/04/2015 7:21:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interest](
	[UserId] [bigint] NOT NULL,
	[ActivityId] [int] NOT NULL,
 CONSTRAINT [PK_Interest] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plan]    Script Date: 20/04/2015 7:21:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](140) NOT NULL,
	[Place] [nvarchar](100) NOT NULL,
	[Starts] [datetime] NOT NULL,
	[Ends] [datetime] NOT NULL,
	[ActivityId] [int] NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 20/04/2015 7:21:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[PlanId] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[PlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 20/04/2015 7:21:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirsName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Interest]  WITH CHECK ADD  CONSTRAINT [FK_Interest_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Interest] CHECK CONSTRAINT [FK_Interest_Activity]
GO
ALTER TABLE [dbo].[Interest]  WITH CHECK ADD  CONSTRAINT [FK_Interest_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Interest] CHECK CONSTRAINT [FK_Interest_User]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Activity]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_User]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Plan] FOREIGN KEY([PlanId])
REFERENCES [dbo].[Plan] ([Id])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Plan]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_User]
GO
USE [master]
GO
ALTER DATABASE [Paldesparche] SET  READ_WRITE 
GO