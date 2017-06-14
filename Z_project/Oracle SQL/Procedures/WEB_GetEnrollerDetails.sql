CREATE OR REPLACE PROCEDURE web_getEnrollerDetails(
   pUserId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR )
AS
BEGIN 
   OPEN v_refcur FOR 
      SELECT en.enrollerId,
         u.userName,
         u.userId,
         u.emailAddress,
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.webName loginName,
         wu.isLockout,
         wu.updated,
         wu.updatedBy
      FROM enrollerInfo en
      JOIN users u ON
         u.userId=en.userId
      JOIN web_users wu ON 
         u.userId=wu.userId AND 
         u.webUserRoleId=wu.webUserRoleId
      WHERE u.lockedOut='N' AND
         en.userId=pUserId AND 
         u.webUserRoleId=8;
End;
/