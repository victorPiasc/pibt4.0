CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SEARCHAGENTS" (
   pClue    IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT wu.id,
         u.userName,
         u.userId,
         u.eMailAddress,
         wu.webName loginName,
         DECODE(wu.webName, NULL, 'false', 'true') "HasWebAccount",
         DECODE(wu.isLockout, 1, 'true', 'false') "Islockout",
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.updated,
         wu.updatedBy
      FROM users u
      LEFT JOIN web_users wu ON
         u.userId=wu.userId AND
         wu.webUserRoleId=2
      WHERE u.lockedOut='N' AND
         u.webUserRoleId = 2 AND
      (  pClue IS NULL OR
         UPPER(u.userId) LIKE '%'||UPPER(pClue)||'%' OR
         UPPER(u.userName) LIKE '%'||UPPER(pClue)||'%' OR
         UPPER(wu.webName) LIKE '%'||UPPER(pClue)||'%');
END;
/
