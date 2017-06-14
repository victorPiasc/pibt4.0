ALTER proc [dbo].[News_Searching]
@Keyword nvarchar(256)
as
IF ISNULL(@Keyword,'') <> ''
BEGIN  
 
SELECT [NewsId]
      ,[NewsTitle]
      ,[NewsContent]
      ,[NewsDate]
      ,[KeyWords]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [News]
  Where  [NewsTitle] like '%'+@Keyword+'%'
		or [NewsContent] like '%'+@Keyword+'%'
		or [KeyWords] like '%'+@Keyword+'%' 
END