CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_OEQUOTE" (
   pCartId      IN  NUMBER,
   pEmployeeId  IN  VARCHAR2,
   psEmployerId IN  VARCHAR2,
   pOeType      IN  NUMBER,
   pPlanTypeId  IN  VARCHAR2,
   v_refcur     OUT SYS_REFCURSOR)
AS
   vMemberId    INTEGER;
   vCount       INTEGER;
   vRenewalDate DATE;
BEGIN
   IF pOeType NOT IN (1,4) THEN
      SELECT MAX(memberId) INTO vMemberId
         FROM web_qqCart
         WHERE cart=pCartId AND
         (  pOeType=2 AND employeeTypeId=2 OR
            pOeType=5 AND employeeTypeId IN (1,3));
   END IF;

   vRenewalDate:= fn_oePlanEffectiveDate(NVL(vMemberId,pEmployeeId), psEmployerId, pOeType);
   web_getNbrEmployees(psEmployerId, vCount);
   findWebRates(pCartId, psEmployerId, vCount,'Y', vRenewalDate, 'N', null);

   writeWebSubsidy(pCartId, pPlanTypeId);

   IF pOeType IN (1,4) THEN
      OPEN v_refcur FOR
         SELECT planId,
            planName,
            planTypeId,
            carrierId,
            rates,
            depRates,
            subsidy,
            subsidyDep
         FROM webSubsidy
         WHERE cart=pCartId AND
            planTypeId = pPlanTypeId
         ORDER BY carrierId DESC, rates;
   ELSE
      OPEN v_refcur FOR
         WITH eeCurrent AS(
            SELECT mp.planId
            FROM memberPlan mp
            WHERE vRenewalDate<NVL (mp.expiryDate, '31-Dec-9999') AND
               mp.memberId = pEmployeeId)
         SELECT ws.planId,
            planName,
            planTypeId,
            carrierId,
            NVL(rates,0) rates,
            NVL(ws.depRates,0) depRates,
            NVL(subsidy,0) subsidy,
            NVL(ws.subsidyDep,0) subsidyDep
         FROM webSubsidy ws
         JOIN eeCurrent ee ON
            ws.planId=ee.planId
         WHERE cart=pCartId AND
            ws.planTypeId = pPlanTypeId;
   END IF;
END;
/
