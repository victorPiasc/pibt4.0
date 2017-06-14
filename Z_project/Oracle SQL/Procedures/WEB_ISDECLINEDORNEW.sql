CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ISDECLINEDORNEW" (
   pEmployeeId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pPlanTypeID IN VARCHAR2,
   pOut OUT NUMBER)
AS
   vTmp INTEGER;
   vDate DATE;
BEGIN
   vDate:=fn_oePlanEffectiveDate(pEmployeeId, pEmployerId, 4);
   /*checks to see if the plan type is new */
   SELECT DISTINCT CASE WHEN np.planTypeId IS NOT NULL AND op.planTypeId IS NOT NULL THEN 1 END INTO vTmp
   FROM employerPlans nep
   JOIN plans np ON
      nep.planId=np.planId AND
      np.carrierId<>0 AND
      np.planTypeId=pPlanTypeId
   LEFT JOIN employerPlans oep ON
      nep.employerId=oep.employerId AND
      nep.planId=oep.planId
   LEFT JOIN plans op ON
      oep.planId=op.planId
   WHERE nep.employerId=employerId AND
      TRUNC(vDate) BETWEEN NVL(nep.startDate,'01-JAN-9999') AND NVL(nep.endDate,'31-DEC-9999');

   IF vTmp IS NULL THEN
      pOut:=0;/*the plan type is new to the employer*/
      RETURN;
   END IF;

   /*check to see if the plan type was offered by the employer but not enrolled by the member*/
   SELECT CASE WHEN MAX(mp.planId) IS NULL THEN 1 ELSE 2 END INTO pOut
   FROM employerPlans ep
   LEFT JOIN memberPlan mp ON
      ep.planId=mp.planId AND
      TRUNC(SYSDATE) BETWEEN mp.effectiveDate and NVL(expiryDate,'31-DEC-9999') AND
      mp.memberId=pEmployeeId
   JOIN plans p ON
      ep.planId=p.planId AND
      p.planTypeId NOT IN (5,9) AND
      p.planTypeId=pPlanTypeId
   WHERE ep.employerId=pEmployerId AND
      TRUNC(vDate) BETWEEN NVL(ep.startDate, '01-JAN-0001') AND NVL(ep.endDate,'31-DEC-9999')
   GROUP BY p.planTypeId;
END;
/
