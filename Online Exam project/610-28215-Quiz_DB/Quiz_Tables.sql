if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Quiz_tblOnlineTest_Detail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Quiz_tblOnlineTest_Detail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Quiz_tblOnlineTest_Master]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Quiz_tblOnlineTest_Master]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Quiz_tblQsnCreationDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Quiz_tblQsnCreationDetail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Quiz_tblQsnCreationMaster]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Quiz_tblQsnCreationMaster]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Quiz_tblQsnsLimitDetail]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Quiz_tblQsnsLimitDetail]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Quiz_tblQsnsLimitMaster]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Quiz_tblQsnsLimitMaster]
GO

CREATE TABLE [dbo].[Quiz_tblOnlineTest_Detail] (
	[SNo] [int] IDENTITY (1, 1) NOT NULL ,
	[AssesmentId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[QsnId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CorrectAns] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserAns] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Marks] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserMarks] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationLogInId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[DeletionStatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[DeletionDate] [datetime] NULL ,
	[DeletionLogInId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Quiz_tblOnlineTest_Master] (
	[SNo] [int] IDENTITY (1, 1) NOT NULL ,
	[AssesmentId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[QuesPaperId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ActualTimeLimit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserTimeLimit] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[TotalScore] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[UserScore] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Percentage] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationLogInId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[DeletionStatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[DeletionDate] [datetime] NULL ,
	[DeletionLogInId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Quiz_tblQsnCreationDetail] (
	[Sno] [int] IDENTITY (1, 1) NOT NULL ,
	[QuestionId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[OptionOrder] [int] NOT NULL ,
	[OptionValue] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationloginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreationDate] [datetime] NULL ,
	[Deletionstatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Deletionloginid] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DeletionDate] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Quiz_tblQsnCreationMaster] (
	[Sno] [int] IDENTITY (1, 1) NOT NULL ,
	[QuestionId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[QsnDesc] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[NoOfOptions] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CorrectOption] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Marks] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationloginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationDate] [datetime] NOT NULL ,
	[Deletionstatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Deletionloginid] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DeletionDate] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Quiz_tblQsnsLimitDetail] (
	[SNo] [int] IDENTITY (1, 1) NOT NULL ,
	[QsnId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[QsnsManual] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationLoginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationDate] [datetime] NOT NULL ,
	[DeletionStatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[DeletionLoginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DeletionDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Quiz_tblQsnsLimitMaster] (
	[Sno] [int] IDENTITY (1, 1) NOT NULL ,
	[QsnId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[QsnName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[Durationoftest] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationLoginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CreationDate] [datetime] NOT NULL ,
	[DeletionStatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[DeletionLoginId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DeletionDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

