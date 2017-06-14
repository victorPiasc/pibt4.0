CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ADDVTL" (
   pOeId VARCHAR2,
   pOeType NUMBER,
   pPlanId VARCHAR2,
   pMemberId VARCHAR2,
   pEmployeeType VARCHAR2,
   pEffectiveDate DATE,
   pUpdatedBy VARCHAR2)
AS
BEGIN
   --if child is added then add all children
   CASE WHEN pPlanId IS NULL THEN
      INSERT INTO web_enrollerFormPlans(id, oeid, employeeId, memberId, planId, effectiveDate, updatedBy, updated)
      SELECT web_EnrollerFormPlans_SEQ.NEXTVAL,
         pOeId,
         pMemberId,
         pMemberId,
         planId,
         pEffectiveDate,
         pUpdatedBy,
         SYSDATE
      FROM plans
      WHERE planTypeId=6 AND
         carrierId=0 AND
         pOeType IN (1,4);
   WHEN pEmployeeType=2 THEN
      INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate, insuranceAmount, price, updatedBy, updated)
      SELECT web_EnrollerFormPlans_SEQ.NEXTVAL,
         pOeId,
         deps.employeeId,
         deps.memberId,
         pPlanId,
         pEffectiveDate,
         NVL(mp.insuranceAmount,5000),
         NVL(fwr.depRates,0),
         pUpdatedBy,
         SYSDATE
      FROM member m
      JOIN member deps ON
         m.employeeId=deps.employeeId AND
         deps.employeeType=2
      LEFT JOIN memberPlan mp ON
         m.memberId=mp.memberId AND
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate and NVL(mp.expiryDate,'31-DEC-9999') AND
         mp.planId=pPlanId
      JOIN web_oeCart oe ON
         oe.oeId=pOeId
      JOIN findWebRatesReport fwr ON
         oe.cart=fwr.cart AND
         fwr.employeeTypeId=2 AND
         fwr.planId=pPlanId
      WHERE m.memberId=pMemberId AND
         MONTHS_BETWEEN(SYSDATE, m.birthDate)/12<26 AND 
         (fn_checkisnewbornandnotplans(deps.memberId)='true' OR pOeType IN (1,4));
   --else add the individual employee or spouse
   ELSE
      --delete any declination plans that may exist
      DELETE FROM web_enrollerFormPlans
      WHERE oeId=pOeId AND
         planId IN (
            SELECT planId
            FROM plans
            WHERE carrierId=0 AND
            planTypeId=6);

      INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate, insuranceAmount, price, updatedBy, updated)
      SELECT web_EnrollerFormPlans_SEQ.NEXTVAL,
         pOeId,
         m.employeeId,
         pMemberId,
         pPlanId,
         pEffectiveDate,
         NVL(mp.insuranceAmount,CASE WHEN m.employeeType=0 THEN 10000 ELSE 5000 END),
         NVL(fwr.rates, fwr.depRates),
         pUpdatedBy,
         SYSDATE
      FROM member m
      JOIN web_oeCart oe ON
         oe.oeId=pOeId
      JOIN findWebRatesReport fwr ON
         oe.cart=fwr.cart AND
         m.employeeType=fwr.employeeTypeId AND
         fwr.planId=pPlanId
      LEFT JOIN memberPlan mp ON
         m.memberId=mp.memberId AND
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate and NVL(mp.expiryDate,'31-DEC-9999') AND
         mp.planId=pPlanId
      WHERE m.memberId=pMemberId;
   END CASE;
   COMMIT;


   IF pOeType=4 THEN
      --if its open enrollment and its a child, add all the child vtl records as term
      IF pEmployeeType=2 THEN
         INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate, expiryDate, memberPlanId, treasonId, updatedBy, updated)
         SELECT web_enrollerFormPlans_SEQ.NEXTVAL,
            pOeId,
            mp.employeeId,
            mp.memberId,
            mp.planId,
            pEffectiveDate,
            pEffectiveDate-1,
            mp.memberPlanId,
            3,
            pUpdatedBy,
            SYSDATE
         FROM member m
         JOIN member deps ON
            m.employeeId=deps.employeeId AND
            deps.employeeType=2
         LEFT JOIN memberPlan mp ON
            deps.memberId=mp.memberId AND
            TRUNC(SYSDATE)<= NVL(mp.expiryDate,'31-DEC-9999')
         LEFT JOIN web_enrollerFormPlans efp ON
            efp.oeId=pOeId AND
            efp.planId=mp.planId
         WHERE m.memberId=pMemberId AND
            mp.memberId IS NOT NULL AND
            efp.planId IS NULL AND
            (fn_checkisnewbornandnotplans(deps.memberId)='true' OR pOeType IN (1,4));
      --else add the individual ee or sp term record
      ELSE
         INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate, expiryDate, memberPlanId, treasonId, updatedBy, updated)
         SELECT web_enrollerFormPlans_SEQ.NEXTVAL,
            pOeId,
            mp.employeeId,
            mp.memberId,
            mp.planId,
            pEffectiveDate,
            pEffectiveDate-1,
            mp.memberPlanId,
            3,
            pUpdatedBy,
            SYSDATE
         FROM memberPlan mp
         JOIN member ee ON
            mp.employeeId=ee.memberId
         JOIN plans p ON
            mp.planid = p.planId AND
            p.planTypeId=6
         LEFT JOIN web_enrollerFormPlans efp ON --Exclude plans that are continuing.
            efp.oeId=pOeId AND
            efp.planId=mp.planId
         WHERE TRUNC(SYSDATE)<=NVL(mp.expiryDate,'31-Dec-9999') AND -- Find active plans or futrue plans
            mp.memberId=pMemberId AND
            efp.planId IS NULL;
      END IF;
   END IF;
END;
/
