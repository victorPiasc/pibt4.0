CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SETEEATOA" (
   pCartId     IN NUMBER,
   pEmployerId IN VARCHAR2,
   pEmployeeId IN VARCHAR2,
   pOeType     IN NUMBER)
AS
   vMemberId INTEGER;
   vNbr INTEGER;
   vRenewalDate DATE;
BEGIN
   IF pOeType NOT IN (1,4) THEN
      SELECT MAX(m.memberId) INTO vMemberId
      FROM member m
      LEFT JOIN memberPlan mp ON
         m.memberId=mp.memberId AND
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-DEC-9999')
      WHERE m.employeeId=pEmployeeId AND
         mp.memberId IS NULL AND
         (  pOeType=2 AND m.employeeType=2 OR
            pOeType=5 AND m.employeeType IN (1,3));
   END IF;

   web_getNbrEmployees(pEmployerId, vNbr);
   vRenewalDate:=fn_oePlanEffectiveDate(CASE WHEN vMemberId IS NOT NULL THEN vMemberId ELSE pEmployeeId END,pEmployerId, pOeType);

   DELETE FROM web_qqCart
      WHERE cart=pCartId;
      COMMIT;

   INSERT INTO web_qqCart
      SELECT m.lastname || ', ' || m.firstname,
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
         CASE WHEN p.planTypeId=6 THEN mp.insuranceAmount END,
         CASE WHEN p.planTypeId=7 THEN mp.insuranceAmount END,
         p.planTypeId,
		 pCartId
      FROM member m
      JOIN memberPlan mp ON
         m.memberId = mp.memberId AND
         vRenewalDate<= NVL(mp.expiryDate, '31-DEC-9999')
      JOIN plans p ON
         mp.planId=p.planId
      WHERE m.employerid = pEmployerId AND
         m.employeeId=pEmployeeId;
   COMMIT;

   findWebRates(pCartId, pEmployerId, vNbr, 'Y', vRenewalDate, 'N', NULL);
   web_setLifeRates(pCartId, pEmployerId, vRenewalDate);
   writeWebsubsidy(pCartId,null);
END;
/
