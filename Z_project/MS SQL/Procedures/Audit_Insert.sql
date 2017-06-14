
CREATE Proc [dbo].[Audit_Insert]
@UserName nvarchar(256),
@EventCode smallint,
@EventDetails nvarchar(max),
@FromIP nvarchar(15)
As
INSERT INTO [dbo].[Audit]
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

