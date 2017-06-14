
CREATE Proc [dbo].[ErrorLog_Insert]
@UserName nvarchar(256),
@EventCode smallint,
@EventDetails nvarchar(max),
@FromIP nvarchar(15)
As
INSERT INTO [dbo].[ErrorLog]
           ([UserName]
           ,[EventCode]
           ,[EventDetails]
           ,[EventTime]
           ,[FromIP])
     VALUES
           (@UserName
           ,@EventCode
           ,@EventDetails
           ,GETDATE()
           ,@FromIP)





GO

