
ALTER PROC [dbo].[Events_Update]
@EventName nvarchar(50),
@EventDate datetime,
@Cost money,
@Location nvarchar(200),
@EventContent nvarchar(max),
@KeyWords nvarchar(256),
@UpdatedBy nvarchar(50),
@EventID BIGINT  
AS
IF(@EventID IS NULL)
BEGIN
 INSERT INTO [Events]
           ([EventName]
           ,[EventDate]
           ,[Cost]
           ,[Location]
           ,[EventContent]
		   ,[KeyWords]
           ,[CreatedDate]
           ,[CreatedBy]
           ,[ModifiedDate]
           ,[ModifiedBy])
     VALUES
           (@EventName
           ,@EventDate 
           ,@Cost 
           ,@Location 
           ,@EventContent 
           ,@KeyWords
           ,GETDATE()
           ,@UpdatedBy
           ,GETDATE()
           ,@UpdatedBy)
    SELECT @@IDENTITY;
END
ELSE
BEGIN
	 UPDATE [Events]
		SET [EventName] = @EventName
		  ,[EventDate] = @EventDate 
		  ,[Cost] = @Cost 
		  ,[Location] = @Location 
		  ,[EventContent] = @EventContent 
		  ,[KeyWords] = @KeyWords 
		  ,[ModifiedDate] = GETDATE()
		  ,[ModifiedBy] = @UpdatedBy
		WHERE EventId=@EventID
 
END



GO

