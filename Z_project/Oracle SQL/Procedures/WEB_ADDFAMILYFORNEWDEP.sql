CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ADDFAMILYFORNEWDEP" (
   pEmployeeId VARCHAR2,
   pCartId NUMBER,
   pPlanTypeId NUMBER)
AS
BEGIN
   DELETE FROM web_qqCart
   WHERE cart=pCartId AND
      memberId IN(
         SELECT DISTINCT memberId
         FROM memberPlan
         WHERE employeeId=pEmployeeId AND
         TRUNC(SYSDATE) BETWEEN effectiveDate AND NVL(expiryDate,'31-DEC-9999'));
   COMMIT;

   INSERT INTO web_qqCart(cart, employeeName,employeeTypeId, employeeType, male, birthdate, createdDate, contribution, 
      dollar, periodsPerYear, salaryPerPeriod, employeeId, contributionDep, dollarDep, memberId, familyId, 
      vtl_insuranceAmount) 
      SELECT pCartId, 
         m.lastname || ', ' || m.firstname,
         m.employeetype,
         DECODE(m.employeeType, 0, 'Employee', 2, 'Child', 'Spouse/Domestic Partner'),
         m.male,
         m.birthDate,
         SYSDATE,
         m.contribution,
         m.dollar,
         m.periodsPerYear,
         m.salaryPerPeriod,
         m.employeeId,
         m.contributionDep,
         m.dollarDep,
         m.memberId,
         m.employeeId,
         CASE WHEN m.employeeType=0 THEN 10000 ELSE 5000 END        
      FROM memberPlan mp
      JOIN member m ON
         mp.memberId=m.memberId
      JOIN plans p ON
         mp.planId=p.planId AND
         p.planTypeId=pPlanTypeId
      WHERE mp.employeeId=pEmployeeId AND
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-DEC-9999') AND
         NVL(mp.treasonId,0)=0;
   COMMIT;
END;
/
