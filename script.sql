USE [master]
GO
/****** Object:  Database [BookPOS]    Script Date: 09/01/2017 23:20:34 ******/
CREATE DATABASE [BookPOS] ON  PRIMARY 
( NAME = N'BookPOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BookPOS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookPOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\BookPOS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BookPOS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookPOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookPOS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [BookPOS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [BookPOS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [BookPOS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [BookPOS] SET ARITHABORT OFF
GO
ALTER DATABASE [BookPOS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [BookPOS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [BookPOS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [BookPOS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [BookPOS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [BookPOS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [BookPOS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [BookPOS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [BookPOS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [BookPOS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [BookPOS] SET  DISABLE_BROKER
GO
ALTER DATABASE [BookPOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [BookPOS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [BookPOS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [BookPOS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [BookPOS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [BookPOS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [BookPOS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [BookPOS] SET  READ_WRITE
GO
ALTER DATABASE [BookPOS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [BookPOS] SET  MULTI_USER
GO
ALTER DATABASE [BookPOS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [BookPOS] SET DB_CHAINING OFF
GO
USE [BookPOS]
GO
/****** Object:  Table [dbo].[BookClass]    Script Date: 09/01/2017 23:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookClass](
	[ClassID] [int] NOT NULL,
	[ClassName] [nvarchar](50) NULL,
 CONSTRAINT [PK_BookClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 09/01/2017 23:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberCode] [nvarchar](50) NULL,
	[MemberName] [nvarchar](50) NULL,
	[Phone] [nvarchar](30) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Active] [int] NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/01/2017 23:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRent]    Script Date: 09/01/2017 23:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRent](
	[RentID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberId] [bigint] NOT NULL,
	[StartDate] [date] NULL,
	[IssueDate] [date] NULL,
	[NumberOfDay] [int] NULL,
 CONSTRAINT [PK_BookRent] PRIMARY KEY CLUSTERED 
(
	[RentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 09/01/2017 23:20:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [bigint] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](50) NULL,
	[BookCode] [nvarchar](50) NULL,
	[ISBN] [nvarchar](50) NULL,
	[Author] [nvarchar](50) NULL,
	[CategoryId] [bigint] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SearchBook]    Script Date: 09/01/2017 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchBook]
(
    @BookName        varchar(30) = null,
    @Author          varchar(30) = null,
    @Category		 int  = 0
)
AS
BEGIN
   SELECT BookID,BOOKNAME,BOOKCODE,AUTHOR,b.CATEGORYNAME AS CATEGORY,ISBN
				FROM Book e
				INNER JOIN CATEGORY b on e.categoryId = b.categoryid
				WHERE 1=1	
				AND (@BookName IS NULL OR e.BookName LIKE ''+ @BookName  +'%')
				AND (@Author IS NULL OR e.Author LIKE '' + @Author + '%')
				AND (@Category =0 OR e.CategoryId =  @Category)  

END
GO
/****** Object:  Table [dbo].[RentBookDetail]    Script Date: 09/01/2017 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentBookDetail](
	[RentDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[RentID] [bigint] NOT NULL,
	[BookID] [bigint] NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_RentBookDetail] PRIMARY KEY CLUSTERED 
(
	[RentDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SearchRentBookHistory]    Script Date: 09/01/2017 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchRentBookHistory]
(
	@MemberID BIGINT	       = 0,
	@BookName NVARCHAR(50)     = NULL,
	@Category BIGINT	       = 0,
	@StartDate NVARCHAR(50)    = NULL,
	@EndDate  NVARCHAR(50)     = NULL
)
AS
BEGIN
	SELECT b.RentDetailID, c.BookID,c.BookCode,c.BookName,c.Author,d.CategoryName,c.ISBN
	FROM RentBookDetail b, Book c,Category d
		  where b.RentID in (SELECT RentID FROM BookRent
						     Where 1=1 
						     AND (@MemberID = 0 OR MemberId = @MemberID) 
						     AND (convert(varchar(30),@StartDate,103)  IS NULL
						     OR	 convert(varchar(30),StartDate,103) >= convert(varchar(30),@StartDate,103))
						     AND (convert(varchar(30),@EndDate,103) IS NULL
						     OR  convert(varchar(30),IssueDate,103) <= convert(varchar(30),@EndDate,103)))
		AND c.CategoryId=d.CategoryId
		AND b.BookID=c.BookID
		AND (@BookName IS NULL OR c.BookName Like '%' + @BookName + '%')
		AND (@Category =0 OR c.CategoryId = @Category)
		AND b.Status = 1
		

END
GO
/****** Object:  ForeignKey [FK_BookClass]    Script Date: 09/01/2017 23:20:35 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_BookClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[BookClass] ([ClassID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_BookClass]
GO
/****** Object:  ForeignKey [FK_Rent_MemberID]    Script Date: 09/01/2017 23:20:35 ******/
ALTER TABLE [dbo].[BookRent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_MemberID] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[BookRent] CHECK CONSTRAINT [FK_Rent_MemberID]
GO
/****** Object:  ForeignKey [FK_Category_ID]    Script Date: 09/01/2017 23:20:35 ******/
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Category_ID] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Category_ID]
GO
/****** Object:  ForeignKey [FK_Rent_BookID]    Script Date: 09/01/2017 23:20:43 ******/
ALTER TABLE [dbo].[RentBookDetail]  WITH CHECK ADD  CONSTRAINT [FK_Rent_BookID] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[RentBookDetail] CHECK CONSTRAINT [FK_Rent_BookID]
GO
/****** Object:  ForeignKey [FK_Rent_MasterID]    Script Date: 09/01/2017 23:20:43 ******/
ALTER TABLE [dbo].[RentBookDetail]  WITH CHECK ADD  CONSTRAINT [FK_Rent_MasterID] FOREIGN KEY([RentID])
REFERENCES [dbo].[BookRent] ([RentID])
GO
ALTER TABLE [dbo].[RentBookDetail] CHECK CONSTRAINT [FK_Rent_MasterID]
GO
