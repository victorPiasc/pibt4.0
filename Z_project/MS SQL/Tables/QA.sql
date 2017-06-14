USE [pibtweb]
GO

/****** Object:  Table [dbo].[QA]    Script Date: 07/10/2013 12:48:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[QA](
	[QAId] [bigint] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](1000) NULL,
	[Answer] [nvarchar](max) NULL,
	[IsTop] [bit] NULL,
	[KeyWords] [nvarchar](256) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_QA] PRIMARY KEY CLUSTERED 
(
	[QAId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[QA] ADD  CONSTRAINT [DF_QA_IsTop]  DEFAULT ((0)) FOR [IsTop]
GO

