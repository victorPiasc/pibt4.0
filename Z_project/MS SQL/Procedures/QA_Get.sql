
CREATE proc [dbo].[QA_Get]
@isTop bit = null,
@Top int = null
as
if ISNULL(@isTop,0) = 0
begin
SELECT [QAId]
      ,[Question]
      ,[Answer]
      ,[IsTop]
      ,[KeyWords]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[QA]
  ORDER BY [ModifiedDate] desc
end
else
begin

SET Rowcount @top
SELECT [QAId]
      ,[Question]
      ,[Answer]
      ,[IsTop]
      ,[KeyWords]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
  FROM [dbo].[QA]
  WHERE IsTop=1 
  ORDER BY [ModifiedDate] desc
end

GO

