CREATE OR REPLACE PROCEDURE WEB_INSERTOELEGALDOCS(
   pDescription  VARCHAR2,
   pLegalContentHtml VARCHAR2,
   pLegalContent VARCHAR2,
   pCarrierId VARCHAR2,
   pUpdatedBy VARCHAR2)
AS
BEGIN
   INSERT INTO web_OELegalDocs(id, created, createdBy, modified, modifiedBy, legalContent,
      legalContentHtml, carrierId, description)
   VALUES( WEB_OELEGALDOCS_SEQ.nextval, SYSDATE, pUpdatedBy, SYSDATE, pUpdatedBy, pLegalContent,
      pLegalContentHtml, pCarrierId, pDescription);
   COMMIT;
END;
/
