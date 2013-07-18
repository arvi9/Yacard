USE [YardeCart]
GO

/****** Object:  Table [dbo].[CategoryGroup]    Script Date: 07/18/2013 19:27:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CategoryGroup](
	[CategoryGroupId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryGroupName] [varchar](100) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


alter table category
add CategoryGroupId int not null default(0)
