CREATE OR REPLACE PROCEDURE WEB_INSERTENROLLERFORM(
   pOeId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pMemberid IN VARCHAR2,
   pTypeId IN VARCHAR2,
   pCreatedBy IN VARCHAR2,
   pIP IN VARCHAR2 )
AS
BEGIN
   INSERT INTO web_OE (ID, Employerid, Memberid, typeId, Created, createdBy, ip, updated, updatedBy, updatedip)
   VALUES(pOeId, pEmployerId, pMemberid, pTypeId, SYSDATE,pCreatedBy, pIP, SYSDATE, pCreatedBy,pIP) ;
    COMMIT;
END;
/
