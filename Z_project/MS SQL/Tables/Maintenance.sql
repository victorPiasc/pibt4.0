USE [pibtweb]
GO

/****** Object:  Table [dbo].[Maintenance]    Script Date: 07/04/2013 19:06:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Maintenance](
	[IsMaintenance] [bit] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Maintenance] ADD  CONSTRAINT [DF_Maintenance_IsMaintenance]  DEFAULT ((0)) FOR [IsMaintenance]
GO

