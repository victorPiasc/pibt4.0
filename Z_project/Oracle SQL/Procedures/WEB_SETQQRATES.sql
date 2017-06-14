CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_setQQRates(
   pCartId NUMBER,
   pMonthsAhead NUMBER,
   pIsPdf CHAR,
   pPlanType NUMBER,
   pFamilyId VARCHAR2)
AS
   vCount INTEGER;
BEGIN
   SELECT COUNT(DISTINCT familyId) INTO vCount
      FROM web_qqCart
      WHERE employeeTypeId=0 AND
         cart=pCartId;

   findWebRates(pCartId, 1, vCount,'N', ADD_MONTHS(TRUNC(SYSDATE,'MM'),pMonthsAhead), pIsPdf, pFamilyId);
   WriteWebSubsidy(pCartId, pPlanType);
   
END;
/
