
CREATE PROCEDURE [dbo].[Web_UpdatePassword]
(
   @userName    varchar(40),
   @oldPassword   varchar(50),
   @password     varchar(50)
)
AS
UPDATE aspnet_membership
   SET password = @password 
WHERE
  userid = (select userid from aspnet_Users where userName = @userName)  AND
  password = @oldPassword

GO

