CREATE OR REPLACE PROCEDURE WEB_UPDATEOELEGALDOCS(
   pDescription VARCHAR2,
   pLegalContentHtml VARCHAR2,
   pLegalContent VARCHAR2,
   pCarrierId VARCHAR2,
   pUpdatedBy VARCHAR2,
   pId VARCHAR2)
AS
BEGIN
   UPDATE web_OELegalDocs
   SET legalContent=pLegalContent,
      legalContentHtml=pLegalContentHtml,
      description=pDescription,
      carrierId=pCarrierId,
      modified=SYSDATE,
      modifiedBy=pUpdatedBy
   WHERE id=pId;
   COMMIT;
END;
/
