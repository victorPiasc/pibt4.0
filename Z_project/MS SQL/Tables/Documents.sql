USE [pibtweb]
GO

/****** Object:  Table [dbo].[Documents]    Script Date: 07/04/2013 19:05:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Documents](
	[DocumentId] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentName] [nvarchar](100) NULL,
	[DocumentURL] [nvarchar](256) NULL,
	[DocumentTypeId] [int] NULL,
	[Sort] [int] NULL,
	[KeyWords] [nvarchar](256) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

