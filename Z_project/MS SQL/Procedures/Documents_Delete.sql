
CREATE PROC [dbo].[Documents_Delete]
@DOCUMENTID BIGINT  
AS
 DELETE FROM Documents WHERE DocumentId=@DOCUMENTID



GO

