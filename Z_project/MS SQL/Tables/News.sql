USE [pibtweb]
GO

/****** Object:  Table [dbo].[News]    Script Date: 07/04/2013 19:06:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[News](
	[NewsId] [bigint] IDENTITY(1,1) NOT NULL,
	[NewsTitle] [nvarchar](50) NOT NULL,
	[NewsContent] [nvarchar](max) NULL,
	[NewsDate] [datetime] NOT NULL,
	[KeyWords] [nvarchar](256) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

