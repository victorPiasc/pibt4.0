
ALTER PROC [dbo].[Events_Get]
@TOP INT = NULL
AS
IF @TOP IS NULL
BEGIN
SELECT [EventId]
      ,[EventName]
      ,[EventDate]
      ,[EventTime]
      ,[Cost]
      ,[Location]
      ,[EventContent]
      ,[KeyWords] 
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [Events] 
  ORDER BY [EventDate] 
END
ELSE
BEGIN
SET Rowcount @top
SELECT [EventId]
      ,[EventName]
      ,[EventDate]
      ,[EventTime]
      ,[Cost]
      ,[Location]
      ,[EventContent]
      ,[KeyWords] 
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [Events] 
  ORDER BY [EventDate] 

END



GO

