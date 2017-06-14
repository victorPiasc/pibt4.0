CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_UPDATESIGNATURENAME" (
   pOeId IN VARCHAR2,
   pSignatrueName IN VARCHAR2, 
   pSignatureId IN NUMBER)
AS
BEGIN
   UPDATE web_oe
   SET signatureName=pSignatrueName,
      signatureId=pSignatureId
   WHERE id=pOeId;
   COMMIT;
END;
/
