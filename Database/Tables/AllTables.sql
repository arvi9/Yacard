USE [YardeCart]
GO
/****** Object:  Table [dbo].[AdStatus]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdStatus](
	[AdPostId] [int] IDENTITY(1,1) NOT NULL,
	[HistroyId] [int] NOT NULL,
	[ViewersCount] [int] NOT NULL,
	[UserId_Buyer] [int] NOT NULL,
	[SaleDate] [smalldatetime] NULL,
	[SaleLocationId] [int] NULL,
	[CurrentStatus] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sold; Cancelled; View;UserRemoved;NotSold' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AdStatus', @level2type=N'COLUMN',@level2name=N'CurrentStatus'
GO
/****** Object:  Table [dbo].[AdImageDetails]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdImageDetails](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[AdPostId] [int] NULL,
	[ImagePath] [varchar](1000) NULL,
	[VideoLink] [varchar](1000) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdDetails]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdDetails](
	[AdPostId] [int] IDENTITY(1,1) NOT NULL,
	[AdPostTitle] [varchar](500) NULL,
	[Description] [varchar](1000) NULL,
	[Keywords] [varchar](1000) NULL,
	[UserId] [int] NOT NULL,
	[PostedDate] [smalldatetime] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[StateId] [int] NULL,
	[CityId] [int] NULL,
	[CountryId] [int] NULL,
	[ZipCode] [varchar](50) NULL,
	[AdTillDate] [smalldatetime] NULL,
	[AdStatus] [varchar](50) NULL,
	[PaidStatus] [int] NULL,
	[PaidDate] [smalldatetime] NULL,
	[CreatedOn] [smalldatetime] NULL,
	[UpdatedOn] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[CreatedOn] [smalldatetime] NOT NULL,
	[CreatedBy] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankDetails]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankDetails](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [varchar](200) NOT NULL,
	[CreditCardNumber] [varchar](50) NOT NULL,
	[CVCNumber] [varbinary](50) NULL,
	[CardHolderName] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[State]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRegistration]    Script Date: 07/09/2013 19:45:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegistration](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NULL,
	[Gender] [int] NULL,
	[UserPassword] [varchar](100) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Address] [varchar](200) NULL,
	[StreetName] [varchar](100) NULL,
	[CityId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[AcceptedOn] [smalldatetime] NULL,
	[CreatedOn] [smalldatetime] NULL,
	[UpdatedOn] [smalldatetime] NULL,
	[UserStatus] [int] NULL,
 CONSTRAINT [PK_UserRegistration] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Female; 1: Male; 2:Rather not say' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserRegistration', @level2type=N'COLUMN',@level2name=N'Gender'
GO