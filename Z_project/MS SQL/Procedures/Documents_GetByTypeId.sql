
CREATE proc [dbo].[Documents_GetByTypeId]
@DocumentTypeId int
as
SELECT [DocumentId]
      ,[DocumentName]
      ,[DocumentURL]
      ,[Sort]
      ,[CREATEDDATE]
      ,[CREATEDBY]
      ,[MODIFIEDDATE]
      ,[MODIFIEDBY]
  FROM [Documents] 
  where DocumentTypeId=@DocumentTypeId
  --group by 
  --     d.DocumentTypeId
  --    ,t.DocumentTypeName
	 -- ,[DocumentId]
  --    ,[DocumentName]
  --    ,[DocumentURL]
  --    ,[Sort]
  --    ,[CREATEDDATE]
  --    ,[CREATEDBY]
  --    ,[MODIFIEDDATE]
  --    ,[MODIFIEDBY]
  order by Sort

GO

