CREATE OR REPLACE PROCEDURE WEB_GETOELEGALDOCDETAILS(
   pId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT id,
         created,
         createdBy,
         modified, 
         modifiedBy,
         legalContent, 
         legalContentHtml, 
         carrierId, 
         description
      FROM web_OELegalDocs
      WHERE id=pId;
END;
/
