
create proc [dbo].[QA_GetById]
 @QAId bigint
as
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
  Where  [QAId] = @QAId
END

GO

