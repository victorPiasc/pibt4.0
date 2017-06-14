CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETOEDETAILS" (
   pOEId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT oe.id,
         employerId,
         memberId,
         typeId,
         t.description typename,
         cafeteria,
         legalDocs,
         signatrue,
         createdBy,
         updated,
         updatedBy,
         ip,
         signatureName,
         status,
         oe.treasonId,
         TO_CHAR(created,'mm/dd/yyyy') created
      FROM web_oe oe,
         web_oe_types t
      WHERE oe.typeid=t.id and
         oe.id = pOEId;
END;
/
