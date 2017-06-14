USE [pibtweb]
GO

/****** Object:  Table [dbo].[WebEventCode]    Script Date: 07/04/2013 19:06:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WebEventCode](
	[Id] [int] NOT NULL,
	[EventCode] [nvarchar](50) NULL,
	[ShowInFilter] [bit] NULL,
 CONSTRAINT [PK_WebEventCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

