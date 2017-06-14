CREATE PROC [dbo].[Lifelines_GetById]
(
@Id int
)
AS

SELECT
	[Id]
      ,[PublishedDate]
      ,[VolumeNumber]
      ,[FilePath]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
FROM Lifelines
WHERE Id = @Id
