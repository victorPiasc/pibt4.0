CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_updateRenewalCR(
   pRenewalId VARCHAR2,
   pName VARCHAR2, 
   pTitle VARCHAR2, 
   pEffectiveDate DATE)
AS 
BEGIN 
   UPDATE web_Renewal  
   SET Name=pName,
      title=pTitle, 
      effectiveDate=pEffectiveDate
   WHERE renewalId=pRenewalId;
   
   COMMIT;
END;
/
