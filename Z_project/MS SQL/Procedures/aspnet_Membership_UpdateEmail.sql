
CREATE proc [dbo].[aspnet_Membership_UpdateEmail]
@UserName nvarchar(256),
@Email nvarchar(256)
as
    DECLARE @UserId uniqueidentifier
	Set @UserId = (Select UserId from aspnet_Users Where LoweredUserName = LOWER(@UserName))
	Update aspnet_Membership 
	Set Email=@Email
	Where UserId = @UserId;