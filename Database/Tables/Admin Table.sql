USE [YardeCart]
GO

/****** Object:  Table [dbo].[AdminLogin]    Script Date: 07/16/2013 18:54:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AdminLogin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](100) NOT NULL,
	[AdminPassword] [varchar](100) NOT NULL,
	[CreatedOn] [smalldatetime] NULL,
	[UpdatedOn] [smalldatetime] NULL,
 CONSTRAINT [PK_AdminLogin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


	
ALTER TABLE UserRegistration
ADD 
UserBlocked int not null default(0),
UserDeleted int not null default(0)

ALTER TABLE AdDetails
ADD 
AdBlocked int not null default(0),
AdDeleted int not null default(0)
