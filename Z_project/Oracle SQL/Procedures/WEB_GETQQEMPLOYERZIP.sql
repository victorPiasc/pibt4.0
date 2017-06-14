CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETQQEMPLOYERZIP" (
   pCartId IN  NUMBER,
   pZip    OUT NUMBER)
AS
BEGIN
   SELECT NVL(MIN(we.zip),0) INTO pZip
      FROM web_qqEmployer we
      JOIN newZipCode nz ON
         we.zip=nz.zipcode
      WHERE cart=pCartId;
END;
/
