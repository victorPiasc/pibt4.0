CREATE OR REPLACE PROCEDURE WEB_GETOELEGALDOCBYCARRIERIDS (
   pCarrierid IN VARCHAR2,
   pHTML IN NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT CASE pHTML WHEN 1 THEN legalContentHtml ELSE legalContent END
      FROM web_oeLegalDocs
      WHERE carrierId=pCarrierId;
END;
/
