USE [master]
GO
/****** Object:  Database [JHData]    Script Date: 04/01/2013 12:33:50 ******/
CREATE DATABASE [JHData] ON  PRIMARY 
( NAME = N'JHData', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\JHData.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JHData_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\JHData_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'JHData', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JHData].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [JHData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JHData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JHData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JHData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JHData] SET ARITHABORT OFF 
GO
ALTER DATABASE [JHData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JHData] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JHData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JHData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JHData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JHData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JHData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JHData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JHData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JHData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JHData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JHData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JHData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JHData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JHData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JHData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JHData] SET  READ_WRITE 
GO
ALTER DATABASE [JHData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JHData] SET  MULTI_USER 
GO
ALTER DATABASE [JHData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JHData] SET DB_CHAINING OFF 

USE [JHData]
GO
/****** Object:  Table [dbo].[ActivityType]    Script Date: 04/01/2013 12:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_ActivityType] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agencies]    Script Date: 04/01/2013 12:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agencies](
	[AgencyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](25) NULL,
	[Zip] [nvarchar](12) NULL,
	[Phone] [nvarchar](20) NULL,
	[Url] [nvarchar](50) NULL,
	[DateInitialContact] [datetime] NULL,
	[DateLastContact] [datetime] NULL,
 CONSTRAINT [PK_Agencies] PRIMARY KEY CLUSTERED 
(
	[AgencyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiters]    Script Date: 04/01/2013 12:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiters](
	[RecruiterID] [int] IDENTITY(1,1) NOT NULL,
	[AgencyID] [int] NOT NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[Phone1] [nvarchar](20) NULL,
	[phone2] [nvarchar](20) NULL,
	[Ext] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[DateInititalContact] [datetime] NULL,
	[DateLastContact] [datetime] NULL,
 CONSTRAINT [PK_Recruiters] PRIMARY KEY CLUSTERED 
(
	[RecruiterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyContacts]    Script Date: 04/01/2013 12:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyContacts](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Fname] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Ext] [nvarchar](20) NULL,
 CONSTRAINT [PK_CompanyContacts] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 04/01/2013 12:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[DateSubmited] [datetime] NULL,
	[DateLastFollowUp] [datetime] NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 04/01/2013 12:37:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[City] [nvarchar](30) NULL,
	[State] [nvarchar](20) NULL,
	[Zip] [nvarchar](12) NULL,
	[Phone] [nvarchar](20) NULL,
	[Url] [nvarchar](50) NULL,
	[DateInitialContact] [datetime] NULL,
	[DateLastContatct] [datetime] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityLog]    Script Date: 04/01/2013 12:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RecruiterID] [int] NULL,
	[JobID] [int] NULL,
	[Date] [datetime] NULL,
	[ActivityTypeID] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ActivityLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddAgency]    Script Date: 04/01/2013 12:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dean Forant>
-- Create date: <03/12/13>
-- Description:	<Add Agency to database.>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddAgency]
@Name NCHAR(100),
@Address1 NCHAR(50),
@Address2 NCHAR(50),
@City NCHAR(50),
@State NCHAR(25),
@Zip NCHAR(12),
@Phone NCHAR(20),
@Url NCHAR(50),
@DateInitialContact DateTime,
@DateLastContact DateTime,
@AgencyID INT OUTPUT

AS
BEGIN
INSERT INTO [dbo].[Agencies](
	[Name],
	[Address1],
	[Address2],
	[City],
	[State],
	[Zip],
	[Phone],
	[Url],
	[DateInitialContact],
	[DateLastContact]
)
VALUES(
	@Name,
	@Address1,
	@Address2,
	@City,
	@State,
	@Zip,
	@Phone,
	@Url,
	@DateInitialContact,
	@DateLastContact)

SET @AgencyID = SCOPE_IDENTITY()

END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAgency]    Script Date: 04/01/2013 12:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================================
-- Author: Dean Forant
-- Create Date: 03/15/13
-- Description: Stored Procedure to update an Agency
-- ===============================================================
CREATE PROCEDURE [dbo].[sp_UpdateAgency]
	@ID Int,
	@Name NChar(100),
	@Address1 NChar(50),
	@Address2 NChar(50),
	@City NChar(50),
	@State NChar(25),
	@Zip NChar(50),
	@Phone NChar(20),
	@Url NChar(50),
	@RowsAffected Int OUTPUT
AS
	SET NOCOUNT ON
	UPDATE Agencies 
	SET
		Name = @Name,
		Address1 = @Address1,
		Address2 = @Address2,
		City = @City,
		State = @State,
		Zip = @Zip,
		Phone = @Phone,
		Url = @Url
	WHERE 
		AgencyID = @ID
	SET @RowsAffected = @@ROWCOUNT
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAgency]    Script Date: 04/01/2013 12:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_DeleteAgency]
	@ID Int,
	@RowsAffected Int OUTPUT
AS
	DELETE FROM Agencies wHERE AgencyID = @ID
	SET @RowsAffected = @@ROWCOUNT
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateDateLastContact]    Script Date: 04/01/2013 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateDateLastContact]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@ID int,
	@DateLastContact DateTime,
	@RowsAffected Int OUTPUT
AS
	/* SET NOCOUNT ON */
	UPDATE Agencies
	SET DateLastContact = @DateLastContact
	WHERE AgencyID = @ID

	SET @RowsAffected = @@ROWCOUNT

	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAgencies]    Script Date: 04/01/2013 12:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAgencies]
AS
	 SET NOCOUNT ON
	 SELECT
		Name,
		Address1,
		Address2,
		City,
		State,
		Zip,
		Phone,
		Url
	FROM Agencies
	ORDER BY Name
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAgency]    Script Date: 04/01/2013 12:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAgency]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
	@ID int
AS
	/* SET NOCOUNT ON */
	SELECT 
		Name,
		Address1,
		Address2,
		City,
		State,
		Zip,
		Phone,
		Url,
		DateInitialContact,
		DateLastContact
	FROM Agencies
	WHERE AgencyId = @ID

	RETURN
GO
/****** Object:  ForeignKey [FK_ActivityLog_ActivityType]    Script Date: 04/01/2013 12:37:22 ******/
ALTER TABLE [dbo].[ActivityLog]  WITH CHECK ADD  CONSTRAINT [FK_ActivityLog_ActivityType] FOREIGN KEY([ActivityTypeID])
REFERENCES [dbo].[ActivityType] ([TypeID])
GO
ALTER TABLE [dbo].[ActivityLog] CHECK CONSTRAINT [FK_ActivityLog_ActivityType]
GO
/****** Object:  ForeignKey [FK_ActivityLog_Jobs]    Script Date: 04/01/2013 12:37:23 ******/
ALTER TABLE [dbo].[ActivityLog]  WITH CHECK ADD  CONSTRAINT [FK_ActivityLog_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
GO
ALTER TABLE [dbo].[ActivityLog] CHECK CONSTRAINT [FK_ActivityLog_Jobs]
GO
/****** Object:  ForeignKey [FK_ActivityLog_Recruiters]    Script Date: 04/01/2013 12:37:23 ******/
ALTER TABLE [dbo].[ActivityLog]  WITH CHECK ADD  CONSTRAINT [FK_ActivityLog_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[ActivityLog] CHECK CONSTRAINT [FK_ActivityLog_Recruiters]
GO
/****** Object:  ForeignKey [FK_Company_Recruiters]    Script Date: 04/01/2013 12:37:34 ******/
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Recruiters] FOREIGN KEY([RecruiterID])
REFERENCES [dbo].[Recruiters] ([RecruiterID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Recruiters]
GO
/****** Object:  ForeignKey [FK_CompanyContacts_Company]    Script Date: 04/01/2013 12:37:36 ******/
ALTER TABLE [dbo].[CompanyContacts]  WITH CHECK ADD  CONSTRAINT [FK_CompanyContacts_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[CompanyContacts] CHECK CONSTRAINT [FK_CompanyContacts_Company]
GO
/****** Object:  ForeignKey [FK_Jobs_Company]    Script Date: 04/01/2013 12:37:38 ******/
ALTER TABLE [dbo].[Jobs]  WITH CHECK ADD  CONSTRAINT [FK_Jobs_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Jobs] CHECK CONSTRAINT [FK_Jobs_Company]
GO
/****** Object:  ForeignKey [FK_Recruiters_Agencies]    Script Date: 04/01/2013 12:37:40 ******/
ALTER TABLE [dbo].[Recruiters]  WITH CHECK ADD  CONSTRAINT [FK_Recruiters_Agencies] FOREIGN KEY([AgencyID])
REFERENCES [dbo].[Agencies] ([AgencyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recruiters] CHECK CONSTRAINT [FK_Recruiters_Agencies]
GO
