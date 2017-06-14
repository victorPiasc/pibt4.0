CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getWebUserLoginName(
   pUserId IN VARCHAR2,
   pUserRole IN NUMBER,
   pWebName OUT VARCHAR2) 
AS
BEGIN
   SELECT MAX(Webname) INTO pWebName
   FROM web_users
   WHERE pUserId IN (userId,employerid,employeeid,memberid,brokerId) AND
      webUserRoleId=pUserRole;
END;
/
