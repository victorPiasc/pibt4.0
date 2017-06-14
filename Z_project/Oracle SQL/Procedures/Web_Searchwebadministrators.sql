CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SEARCHWEBADMINISTRATORS" (
   pClue    IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT wu.id,
         u.userId,
         u.userName,
         wu.webName loginName,
         u.eMailAddress,
         DECODE(wu.webName, NULL, 'false', 'true') "HasWebAccount",
         DECODE(wu.isLockOut, 1, 'true', 'false') "Islockout",
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.updated,
         wu.updatedBy
      FROM users u 
      LEFT JOIN web_users wu ON 
         wu.userId=u.userId AND
         wu.webUserRoleId=u.webUserRoleId
      WHERE u.lockedOut='N' AND
         u.roleId=1 AND
         (  pClue IS NULL OR
            UPPER(u.userId) LIKE '%'||UPPER(pClue)||'%' OR
            UPPER(u.userName) LIKE '%'||UPPER(pClue)||'%' OR
            UPPER(wu.webName) LIKE '%'||UPPER(pClue)||'%');
END;
/
