
ALTER proc Documents_Searching
@Keyword nvarchar(256)
as
IF ISNULL(@Keyword,'') <> ''
BEGIN  
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
  Where  [DocumentName] like '%'+@Keyword+'%'
		or [DocumentURL] like '%'+@Keyword+'%'
		or [KeyWords] like '%'+@Keyword+'%' 
 
END


 



