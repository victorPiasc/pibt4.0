CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ADDMTL" (
   pEmployeeId VARCHAR2,
   pEmployerId VARCHAR2,
   pOeId VARCHAR2,
   pCarrierId NUMBER,
   pUpdatedBy VARCHAR2)
AS
   vPlanId INTEGER;
   vEffectiveDate DATE;
BEGIN
   SELECT fn_oePlanEffectiveDate(pEmployeeId, pEmployerId, typeId) INTO vEffectiveDate
   FROM web_oe
   WHERE id=pOeId;

   IF pCarrierId=0 THEN
      SELECT ep.planId INTO vPlanId
      FROM employerPlans ep
      JOIN plans p ON
         ep.planId=p.planId AND
         p.planTypeId=7 AND
         p.carrierId=0
      WHERE ep.employerId=pEmployerId AND
         vEffectiveDate BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate,'31-DEC-9999');
   ELSE
      SELECT MAX(mp.planId) INTO vPlanId
      FROM memberPlan mp
      JOIN plans p ON
         mp.planId=p.planId AND
         p.planTypeId=7 AND
         p.carrierId<>0
      WHERE memberId=pEmployeeId AND
         TRUNC(SYSDATE)< NVL(mp.expiryDate,'31-DEC-9999');

      IF vPlanID IS NULL THEN
         SELECT MAX(ep.planId) INTO vPlanId
         FROM employerPlans ep
         JOIN plans p ON
            ep.planId=p.planId AND
            p.planTypeId=7 AND
            p.carrierId<>0
         WHERE ep.employerId=pEmployerId AND
            vEffectiveDate BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate, '31-DEC-9999') AND
            p.rateBasis=(
               SELECT MIN(p.rateBasis)
               FROM employerPlans ep
               JOIN plans p ON
                  ep.planId=p.planId AND
                  p.planTypeId=7 AND
                  p.carrierId<>0
               WHERE ep.employerId=pEmployerId AND
                  vEffectiveDate BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate, '31-DEC-9999'));

      END IF;
   END IF;

   INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate, insuranceAmount, price)
      SELECT web_enrollerFormPlans_SEQ.NEXTVAL,
         pOeId,
         pEmployeeId,
         pEmployeeId,
         p.planId,
         vEffectiveDate,
         p.rateBasis,
         0
      FROM employer er
      JOIN plans p ON
         p.planId=vPlanId
      LEFT JOIN web_enrollerFormPlans efp ON
         p.planId=efp.planId AND
         efp.oeId=pOeId
      WHERE er.employerId=pEmployerId AND
         efp.planId IS NULL;
END;
/
