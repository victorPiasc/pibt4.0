CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_updateSignature(
   pId IN VARCHAR2,
   pType IN NUMBER, 
   pName IN VARCHAR2, 
   pTitle IN VARCHAR2, 
   pSignatureId IN NUMBER)
AS 
BEGIN 
   --TODO refactor to separate procedures
   CASE WHEN pType=1 THEN    
      UPDATE web_renewal
      SET signatureId=pSignatureId
      WHERE renewalId=pId;
   WHEN pType=2 THEN 
      UPDATE web_qqEmployer 
      SET signatureId=pSignatureId,
         signName=pName,
         dateSigned = SYSDATE,
         title=pTitle
      WHERE cart=pId;
   END CASE;       
   COMMIT;
END;
/
