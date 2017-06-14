CREATE OR REPLACE Procedure Web_GetOELEGALDOCS(
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
      FROM web_OELegalDocs;
END;
 