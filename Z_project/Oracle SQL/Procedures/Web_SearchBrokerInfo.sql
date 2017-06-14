CREATE OR REPLACE PROCEDURE PIA_ADMIN.Web_SearchBrokerInfo(
   pClue    IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR 
      SELECT wu.id,
         b.brokerId, 
         b.name,
         b.contact,
         b.eMail,
         b.phone,
         wu.webName loginName,
         DECODE(wu.webName, NULL,'false', 'true') "HasWebAccount",
         DECODE(wu.islockout, 1,'true', 'false') "Islockout",
         wu.lastLoginIp,
         wu.lastLoginTime,
         wu.updated,
         wu.updatedBy
      FROM broker b
      JOIN web_users wu ON
         b.brokerId=wu.brokerId
      WHERE pClue IS NULL OR
         UPPER(b.brokerId) LIKE '%'||pClue||'%' OR
         UPPER(b.name) LIKE '%'||UPPER(pClue)||'%' OR
         UPPER(wu.webName) LIKE '%'||UPPER(pClue)||'%';
END;