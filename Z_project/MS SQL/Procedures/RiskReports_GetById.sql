CREATE PROC [dbo].[RiskReports_GetById]
(
@Id int
)
AS

SELECT
	[Id]
      ,[PublishedDate]
      ,[VolumnNumber]
      ,[FilePath]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
FROM RiskReports
WHERE Id = @Id