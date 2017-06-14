
CREATE PROC [dbo].[QA_Update]
@QUESTION NVARCHAR(1000),
@ANSWER NVARCHAR(MAX),
@ISTOP BIT,
@KEYWORDS NVARCHAR(256),
@UPDATEDBY NVARCHAR(50),
@QAID BIGINT  
AS
IF(@QAID IS NULL)
BEGIN
 INSERT INTO [QA]
           ([Question]
           ,[Answer]
           ,[IsTop]
           ,[KeyWords]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[ModifiedDate]
           ,[ModifiedBy])
     VALUES
           (@QUESTION
           ,@ANSWER
           ,@ISTOP
           ,@KEYWORDS
           ,GETDATE()
           ,@UPDATEDBY
           ,GETDATE()
           ,@UPDATEDBY)
           
    SELECT @@IDENTITY;
END
ELSE
BEGIN
	UPDATE  [QA]
   SET [Question] = @QUESTION
      ,[Answer] = @ANSWER
      ,[IsTop] = @ISTOP
      ,[KeyWords] = @KEYWORDS
      ,[ModifiedDate] = GETDATE()
      ,[ModifiedBy] = @UPDATEDBY
	WHERE QAID=@QAID
 
END




GO

