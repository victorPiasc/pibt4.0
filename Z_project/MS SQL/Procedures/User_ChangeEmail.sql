-- Changes the email  @NewEmail 
-- Returns: 
-- 0 if success 


 CREATE PROCEDURE [User_ChangeEmail]
(@UserName nvarchar(256), @NewEmail nvarchar(256))
WITH 
EXECUTE AS CALLER
AS
BEGIN 

	UPDATE aspnet_Membership SET	
		Email = @NewEmail,
		LoweredEmail = LOWER(@NewEmail) 
	WHERE 
		UserId = (SELECT u.UserId 
							FROM aspnet_Users u 
							WHERE u.UserName=@UserName) 

    RETURN(0) 
 END
GO