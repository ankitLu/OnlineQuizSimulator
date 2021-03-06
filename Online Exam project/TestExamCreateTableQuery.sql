go
create database [TestExam]
go
USE [TestExam]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 06/02/2009 11:44:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[slNo] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](350) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Option1] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Option2] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Option3] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Option4] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Correct] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF