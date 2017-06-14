CREATE OR REPLACE PROCEDURE web_employeePlanCount(
   pEmployeeId IN VARCHAR2,
   pCount OUT NUMBER )
AS
BEGIN 
   SELECT COUNT(*) INTO pCount
   FROM member m 
   JOIN memberPlanNoBogus mp ON 
      m.memberId = mp.memberId
   WHERE m.employeeId = pEmployeeId AND
      TRUNC(SYSDATE) < NVL(mp.expiryDate,'31-DEC-9999') AND
      NVL(mp.treasonId, 0) = 0;
END;       