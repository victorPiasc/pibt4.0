CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTENROLLERFORMPLANS" (
   pOeId       IN  VARCHAR2,
   pCartId     IN  NUMBER,
   pEmployeeId IN  VARCHAR2,
   pPlanId     IN  NUMBER,
   pUpdatedBy  IN  VARCHAR2,
   pKeepCur    IN  CHAR,
   pOut        OUT VARCHAR2 )
AS
   vAgencyId       INTEGER;
   vOeType         INTEGER;
   vPlanTypeId     INTEGER;
   vEffectiveDate  DATE;
   vEmployerId     INTEGER;
   vEmployeeTypeId INTEGER;
   vCarrierId      INTEGER;
   vTotal          NUMBER(6,2) DEFAULT 0;
   vTmp            INTEGER DEFAULT 0;
BEGIN
   --get enrollment type
   SELECT typeID INTO vOeType
      FROM web_oe
      WHERE id=pOeId;

   --get employee information
   SELECT employerId,
         employeeType
      INTO vEmployerId,vEmployeeTypeId
      FROM member
      WHERE memberId=pEmployeeId;

   --get plan information
   SELECT planTypeId,
         carrierId
      INTO vPlantypeId,vCarrierId
      FROM plans
      WHERE planid = pPlanId;

   --get agency Id
   SELECT agencyId INTO vAgencyId
      FROM employer
      WHERE employerId=vEmployerId;

   web_getOeEffectiveDate(pOeId, vEffectiveDate);

   --if keep cur is checked then
   --   remove everyone from the cart
   --   add members currently on plan
   IF pKeepCur='Y' THEN
      web_setEEAtoA(pCartId, vEmployerId, pEmployeeId, voeType);
   END IF;

   --get the total of all the members on the plan
   SELECT NVL(rates,0)+NVL(depRates,0)-NVL(subsidy,0)-NVL(subsidyDep,0) INTO vTotal
      FROM webSubsidy
      WHERE cart=pCartId AND
         planId=pPlanId;

   --inserts into the enrollerFormPlans table
   INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate,price)
      WITH insertMembers AS(
         SELECT DISTINCT memberId
         FROM web_qqCart
         WHERE cart=pCartId AND
            (  vCarrierId<>0 OR pEmployeeId=memberId) AND
            (  planTypeId=vPlanTypeId OR pKeepCur='N') AND
            (  vOeType IN (1,4) OR
               vOeType=2 AND fn_checkisnewbornandnotplans(memberId)='true'  OR
               vOeType=5 AND fn_checkIsNewMarryAndNotPlans(memberId)='true'))
      SELECT web_enrollerFormPlans_SEQ.NEXTVAL,
         pOeId,
         pEmployeeId,
         memberId,
         pPlanId,
         vEffectiveDate,
         vTotal
      FROM insertMembers;
   COMMIT;

   --if NC and adding medical, then add MTL
   IF vAgencyId=2 AND vPlanTypeId=1 AND vOeType IN (1,4) THEN
      web_addMtl(pEmployeeId, vEmployerId, pOeId, vCarrierId, pUpdatedBy);
   END IF;

   --if OE and choosing different medical plan, add old medical plan as a terminated plan
   IF vOeType=4 THEN
      INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate, planOffice1, planOffice2,
            insuranceAmount, planOffice3, expiryDate, memberPlanId, treasonId, updatedBy, updated)
         SELECT web_enrollerFormPlans_SEQ.NEXTVAL,
            pOeId,
            mp.employeeId,
            mp.memberId,
            mp.planId,
            vEffectiveDate,
            mp.planOffice1,
            mp.planOffice2,
            mp.insuranceAmount,
            mp.planOffice3,
            vEffectiveDate-1,
            mp.memberPlanId,
            3,
            pUpdatedBy,
            SYSDATE
         FROM memberPlan mp
         JOIN plans p ON
            mp.planid = p.planId AND
            p.planTypeId = vPlanTypeId
         LEFT JOIN web_enrollerFormPlans efp ON --Exclude plans that are continuing.
            efp.oeId=pOeId AND
            efp.planId=mp.planId
         WHERE TRUNC(SYSDATE)<=NVL(mp.expiryDate,'31-Dec-9999') AND -- Find active plans or futrue plans
            mp.employeeId=pEmployeeId AND
            efp.planId IS NULL;                               -- find employee family when it is employee
      COMMIT;
   END IF;
END;
/
