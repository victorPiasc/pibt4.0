CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTMEMBERTOQUOTE" (
   pCartId   NUMBER,
   pMemberId VARCHAR2)
AS
BEGIN
   INSERT INTO web_qqCart
      SELECT MAX(m.lastname || ', ' || m.firstname),
         MAX(m.employeetype),
         MAX(DECODE(m.employeeType, 0, 'Employee', 2, 'Child', 'Spouse/Domestic Partner')),
         MAX(m.male),
         MAX(m.birthDate),
         SYSDATE,
         MAX(m.contribution),
         MAX(m.dollar),
         MAX(m.periodsPerYear),
         MAX(m.salaryPerPeriod),
         MAX(m.employeeId),
         MAX(m.contributionDep),
         MAX(m.dollarDep),
         MAX(m.memberId),
         MAX(m.employeeId),
         MAX(CASE WHEN p.planTypeId=6 THEN mp.insuranceAmount WHEN employeeType=0 THEN 10000 ELSE 5000 END),
         0,
         NULL,
		 pCartId
      FROM member m
      LEFT JOIN memberPlan mp ON
         m.memberId=mp.memberId AND
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-DEC-9999') AND
         NVL(mp.treasonId,0)=0
      LEFT JOIN plans p ON
         mp.planId=p.planId
      WHERE m.memberId=pMemberId
      GROUP BY m.memberId;
   COMMIT;
END;
/
