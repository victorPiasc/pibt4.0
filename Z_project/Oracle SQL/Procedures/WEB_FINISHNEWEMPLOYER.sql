CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_finishNewEmployer(
   pEmployerId VARCHAR2,
   pCartId NUMBER,
   pEffective DATE,
   pName VARCHAR2, 
   pTitle VARCHAR2)
AS 
BEGIN
   UPDATE web_qqEmployer
   SET completed = 'Y'
   WHERE cart=pCartId;
      
   web_actOnRenewalPlans(pCartId, 'ER'||pEmployerId, pEmployerId, pEffective);
END;
/
