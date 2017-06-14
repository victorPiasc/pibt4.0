CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getSignatureId(
   pId IN VARCHAR2, 
   pType IN NUMBER,
   pCode IN VARCHAR2,
   pSignatureId OUT NUMBER)
AS 
BEGIN
   --TODO factor out into 3 different routines
   CASE WHEN pType=0 THEN 
         SELECT signatureId INTO pSignatureId 
         FROM web_oe
         WHERE id=pId;
      WHEN pType = 1 THEN   
         SELECT signatureId INTO pSignatureId 
         FROM web_renewal 
         WHERE renewalId=pId;
      ELSE 
         SELECT signatureId INTO pSignatureId 
         FROM web_qqEmployer 
         WHERE cart=pId AND 
            validationCode=pCode;
   END CASE;                     
END;
/
