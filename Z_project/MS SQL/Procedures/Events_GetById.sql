
ALTER PROC [dbo].[Events_GetById]
@EventId BIGINT 
AS
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
  WHERE [EventId] = @EventId
  ORDER BY
	  eventdate;


GO

