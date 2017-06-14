CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SEARCHENROLLERS" (
   pClue    IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT wu.id,
         ei.enrollerId,
         u.userName,
         u.userId,
         u.eMailAddress,
         wu.webName loginName,
         DECODE(wu.webName, NULL, 'false', 'true') "HasWebAccount",
         DECODE(wu.isLockout, 1, 'true', 'false') "Islockout",
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.updated,
         wu.updatedBy,
         ei.agencyId
      FROM enrollerInfo ei
      JOIN users u ON
         ei.userId=u.userId AND
         u.lockedOut='N' AND
         u.webUserRoleId=8
      JOIN web_users wu ON
         u.userId=wu.userId AND
         wu.webUserRoleId=8
      WHERE ei.active='Y' AND
         (  pClue IS NULL OR
            UPPER(u.userId) LIKE '%'||UPPER(pClue)||'%' OR
            UPPER(u.userName) LIKE '%'||UPPER(pClue)||'%' OR
            UPPER(wu.webName) LIKE '%'||UPPER(pClue)||'%' OR
            TO_CHAR(ei.enrollerId)=pClue);
END;
/