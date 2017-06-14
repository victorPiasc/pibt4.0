CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETWEBADMINDETAILS"(
   pUserId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR) 
AS
BEGIN
   OPEN v_refcur FOR
      SELECT u.userid,
         wu.webUserRoleId,
         wu.webName loginName,
         wu.isLockout,
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.updated,
         wu.updatedby,
         u.Username,
         u.Emailaddress
      FROM users u 
      LEFT JOIN web_users wu ON 
         wu.userId=u.userId AND 
         wu.webUserRoleId=1
      WHERE u.userId=pUserId;
END;
/
