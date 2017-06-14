
ALTER proc [dbo].[Events_Searching]
@Keyword nvarchar(256)
as
IF ISNULL(@Keyword,'') <> ''
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
  Where  [EventName] like '%'+@Keyword+'%'
     or [KeyWords] like '%'+@Keyword+'%'
     or [EventContent] like '%'+@Keyword+'%'
  ORDER BY
	  eventdate;

end