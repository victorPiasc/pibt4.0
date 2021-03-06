
ALTER proc [dbo].[Documents_GetById]
@DocumentId bigint
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
  where DocumentId=@DocumentId