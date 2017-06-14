CREATE OR REPLACE PROCEDURE WEB_GETENROLLERS(
   pActive IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR )
AS
BEGIN 
    OPEN  v_refcur FOR 
      SELECT wu.Id,
         en.enrollerId,
         u.userName,
         u.userId,
         u.emailAddress,
         wu.webName loginName,
         DECODE(wu.webName, NULL, 'false', 'true') "HasWebAccount",
         DECODE(wu.islockout, 1, 'true', 'false') "Islockout",
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.updated,
         wu.updatedBy,
         en.agencyId
      FROM enrollerInfo en
      JOIN Users U ON 
         u.userId=en.userId
      JOIN web_users wu ON
         en.userId=wu.userId AND
         u.webUserRoleId=wu.webUserRoleId
      WHERE wu.webUserRoleId=2 AND 
         u.lockedOut='N' AND 
         (en.active=pActive OR pActive IS NULL);
End;
/