
CREATE proc [dbo].[DocumentType_Get]
@AvailableType bit=null
as
if @AvailableType is null
begin
SELECT [DocumentTypeId]
      ,[DocumentTypeName]
  FROM  [DocumentType]
end
else
begin
  SELECT 
	  D.[DOCUMENTTYPEID]
      ,T.[DOCUMENTTYPENAME]
  FROM DOCUMENTS D
  INNER JOIN DOCUMENTTYPE T
  ON D.DOCUMENTTYPEID = T.DOCUMENTTYPEID
  Group by D.[DOCUMENTTYPEID],T.[DOCUMENTTYPENAME]
end

GO

