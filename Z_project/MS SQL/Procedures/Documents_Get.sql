
ALTER proc [dbo].[Documents_Get]
as
SELECT [DocumentId]
      ,[DocumentName]
      ,[DocumentURL]
      ,[Sort]
      ,d.DocumentTypeId
      ,t.DocumentTypeName
      ,KeyWords 
      ,[CREATEDDATE]
      ,[CREATEDBY]
      ,[MODIFIEDDATE]
      ,[MODIFIEDBY]
  FROM [Documents] d
  inner join [DocumentType] t
  on d.DocumentTypeId = t.DocumentTypeId
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

