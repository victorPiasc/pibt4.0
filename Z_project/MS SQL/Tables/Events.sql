USE [pibtweb]
GO

/****** Object:  Table [dbo].[Events]    Script Date: 07/04/2013 19:05:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Events](
	[EventId] [bigint] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](50) NULL,
	[EventDate] [datetime] NOT NULL,
	[Cost] [money] NULL,
	[Location] [nvarchar](200) NULL,
	[EventContent] [nvarchar](max) NULL,
	[KeyWords] [nvarchar](256) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

