USE [SESG]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/03/2013 20:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[CellNumber] [varchar](50) NULL,
	[Company] [varchar](50) NULL,
	[Website] [varchar](50) NULL,
	[ProfilePictureId] [bigint] NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Files]    Script Date: 11/03/2013 20:21:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Files](
	[FileID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Path] [varchar](256) NULL,
	[Type] [varchar](100) NULL,
	[CreatedBy] [bigint] NULL,
	[Source] [varchar](2048) NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Users_DateCreated]    Script Date: 11/03/2013 20:21:17 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_DateCreated]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
/****** Object:  ForeignKey [FK_Files_Users_CreatedBy]    Script Date: 11/03/2013 20:21:17 ******/
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_Users_CreatedBy]
GO
/****** Object:  ForeignKey [FK_Users_Files_ProfilePicture]    Script Date: 11/03/2013 20:21:17 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Files_ProfilePicture] FOREIGN KEY([ProfilePictureId])
REFERENCES [dbo].[Files] ([FileID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Files_ProfilePicture]
GO
