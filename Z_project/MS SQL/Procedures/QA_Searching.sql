
create proc [dbo].[QA_Searching]
 @Keyword nvarchar(256)
as
IF ISNULL(@Keyword,'') <> ''
BEGIN  
 SELECT [QAId]
      ,[Question]
      ,[Answer]
      ,[IsTop]
      ,[KeyWords]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [QA]
  Where  [Question] like '%'+@Keyword+'%'
		or [Answer] like '%'+@Keyword+'%'
		or [KeyWords] like '%'+@Keyword+'%' 
END

GO

