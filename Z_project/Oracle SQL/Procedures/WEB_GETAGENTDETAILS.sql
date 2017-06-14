CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getAgentDetails(
   pUserId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR )
AS
BEGIN 
   OPEN v_refcur FOR 
      SELECT u.userName,
         u.userId,
         u.emailAddress,
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.webName loginName,
         wu.isLockout,
         wu.updated,
         wu.updatedBy
      FROM users u
      JOIN web_users wu ON 
         u.userId=wu.userId AND 
         u.webUserRoleId=wu.webUserRoleId
      WHERE u.lockedOut='N' AND
         u.userId=pUserId AND 
         u.webUserRoleId=2;
End;
/
