CREATE OR REPLACE PROCEDURE Web_SearchCsrInfo(
   pClue    IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR 
      SELECT wu.id,
         ci.csrId, 
         u.userName,
         ci.extension,
         u.eMailAddress,
         ci.cobraRep,
         DECODE(ci.active, 'Y', 'true', 'false') active, 
         ci.userId,
         ci.leaderId,
         ci.name || ' Ext. ' || ci.extension rk,
         ci2.name || ' Ext. ' || ci2.extension teamLead,
         wu.webName loginName,
         DECODE(wu.webName, NULL, 'false', 'true') "HasWebAccount",
         DECODE(wu.islockout, 1, 'true', 'false') "Islockout",
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.updated,
         wu.updatedBy
      FROM csrInfo ci
      JOIN  csrInfo ci2 ON
         ci.leaderId=ci2.csrId
      JOIN users u ON
         ci.userId=u.userId AND
         u.lockedOut='N' AND
         u.webUserRoleId=3
      JOIN web_users wu ON
         u.userId=wu.userId AND
         wu.webUserRoleId=3
      WHERE ci.active='Y' AND
         (  pClue IS NULL OR
            UPPER(u.userId) LIKE '%'||UPPER(pClue)||'%' OR
            UPPER(u.userName) LIKE '%'||UPPER(pClue)||'%' OR
            UPPER(wu.webName) LIKE '%'||UPPER(pClue)||'%' OR
            TO_CHAR(ci.csrId)=pClue);
END;
