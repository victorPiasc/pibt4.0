CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getNewSignatureId(
   pSignatureId OUT NUMBER)
AS 
BEGIN 
   SELECT signature_SEQ.NEXTVAL INTO pSignatureId FROM dual;
END;
/
