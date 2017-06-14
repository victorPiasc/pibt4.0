CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_TRANSFERVTL" (
   pOeId IN VARCHAR2,
   pOeType IN NUMBER,
   pEmployeeId IN VARCHAR2,
   pEffectiveDate IN DATE,
   pUpdated IN VARCHAR2)
AS
BEGIN
   INSERT INTO web_enrollerFormPlans (id, oeId, employeeId, memberId, planId, planOffice1, planOffice2, planOffice3, effectiveDate, insuranceAmount, price, updatedBy, updated)
   SELECT web_EnrollerFormPlans_SEQ.NEXTVAL,
      pOeId,
      pEmployeeId,
      m.memberId,
      mp.planId,
      mp.planOffice1,
      mp.planOffice2,
      mp.planOffice3,
      pEffectiveDate,
      mp.insuranceAmount,
      NVL(fwr.rates, fwr.depRates),
      pUpdated,
      SYSDATE
   FROM member m
   JOIN memberPlan mp ON
      m.memberId=mp.memberId AND
      TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-DEC-9999') AND
      NVL(mp.treasonId,0)=0
   JOIN plans p ON
      mp.planId=p.planId AND
      p.planTypeId=6 AND
      p.carrierId<>0
   JOIN web_oeCart oe ON
         oe.oeId=pOeId
   JOIN findWebRatesReport fwr ON
      oe.cart=fwr.cart AND
      fwr.employeeTypeId=2 AND
      fwr.planId=mp.planId
   LEFT JOIN pairedPlans pp ON
      mp.planId=pp.planIdOne
   LEFT JOIN web_enrollerFormPlans efp ON
      efp.oeId=pOeId AND
      m.memberId=efp.memberId AND
      efp.planId IN (pp.planIdOne, pp.planIdTwo, mp.planId)
   WHERE m.employeeId=pEmployeeId AND
      efp.planId IS NULL AND
      (  pOeType IN (1,4) OR
         pOeType=2 AND fn_checkisnewbornandnotplans(m.memberId)='true' OR
         pOeType=5 AND fn_checkIsNewMarryAndNotPlans(m.memberId)='true');
   COMMIT;
END;
/
