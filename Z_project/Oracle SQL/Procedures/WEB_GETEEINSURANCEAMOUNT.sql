CREATE OR REPLACE PROCEDURE web_getEeInsuranceAmount(
   pEmployeeId IN VARCHAR2,
   pInsuranceAmount OUT NUMBER)
AS
BEGIN 
   SELECT NVL(MAX(mp.insuranceAmount),10) INTO pInsuranceAmount
   FROM memberPlan mp
   JOIN plans p ON 
      mp.planId=p.planId 
   WHERE memberId=pEmployeeId AND
      TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-DEC-9999') AND 
      p.planTypeId=6;
END;      
         
