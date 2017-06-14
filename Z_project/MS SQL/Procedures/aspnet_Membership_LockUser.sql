
create proc [dbo].[aspnet_Membership_LockUser]
@UserName nvarchar(256)
as
    DECLARE @UserId uniqueidentifier
	Set @UserId = (Select UserId from aspnet_Users Where LoweredUserName = LOWER(@UserName))
	Update aspnet_Membership 
	Set IsLockedOut = 1,
		LastLockoutDate = GETDATE()
	Where UserId = @UserId;
	
GO

