CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETQQSAVEDQUOTES" (
   pUser    IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT cart,
         companyName,
         labelName,
         createdBy,
         quoteNum,
         dateSaved
      FROM WEB_QQEMPLOYER
      WHERE ISSAVED='Y' and
         CREATEDBY=pUser;
END;
/
