CREATE PROCEDURE [Web_PWrecovery]
(@loginName nvarchar(20))
WITH EXECUTE AS CALLER
AS
   SELECT am.password,
         UPPER(SUBSTRING(am.LoweredEmail,1,1))+ '******@' + RIGHT(am.LoweredEmail, LEN(am.LoweredEmail) - CHARINDEX('@', am.LoweredEmail)) emailAddress  
      FROM aspnet_membership am,
         aspnet_users au
      WHERE am.userId=au.userId AND
         au.loweredUserName=LOWER(@loginName);
GO