CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETOEPLANTYPE" (
   pOeId IN VARCHAR2,
   pOeType IN NUMBER,
   pEmployerId IN VARCHAR2,
   pPlanTypeId OUT NUMBER)
AS
   vEffectiveDate DATE;
BEGIN

   web_getOeEffectiveDate(pOeId, vEffectiveDate);

   IF pOeType IN (1,4) THEN
      WITH currentTypes AS(
         SELECT p.planTypeid
         FROM employerPlans ep
         JOIN plans p ON
            ep.planId=p.planId AND
            p.carrierId>0
         WHERE ep.employerId=pEmployerId AND
            vEffectiveDate between NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate,'31-DEC-9999')
         UNION
         SELECT p.planTypeid
         FROM employerRateTable ert
         JOIN plans p ON
            ert.planid=p.planid
         WHERE ert.employerId=pEmployerId AND
            vEffectiveDate BETWEEN ert.effective AND ert.expiry AND
            ert.side='P')
      SELECT NVL(MIN(ct.planTypeId),0) INTO pPlanTypeId
      FROM currentTypes ct
      WHERE ct.planTypeId NOT IN (5,6,7,9) AND
         ct.planTypeId NOT IN(
         SELECT /*+ INDEX(efp) INDEX(p) */ p.planTypeId
         FROM web_enrollerFormPlans efp
         JOIN plans p ON
            efp.planid=p.planid
         WHERE efp.oeId=pOeId AND
            efp.treasonId IS NULL);
   ELSE
      WITH currentTypes AS(
         SELECT DISTINCT p.planTypeId
         FROM memberPlanNoBogus mp
         JOIN web_oe wo ON
            wo.Id = pOeId AND
            mp.memberId = wo.memberId
         JOIN plans p ON
            mp.planId = p.planId AND
            p.planTypeId NOT IN (5,6,7,9)
         WHERE vEffectiveDate<NVL(mp.expiryDate,'31-DEC-9999'))
      SELECT NVL(MIN(ct.planTypeId),0) INTO pPlanTypeId
      FROM currentTypes ct
      WHERE ct.planTypeId NOT IN(
         SELECT /*+ INDEX(efp) INDEX(p) */ p.planTypeId
         FROM web_enrollerFormPlans efp
         JOIN plans p ON
            efp.planid=p.planid
         WHERE efp.oeId=pOeId AND
            efp.treasonId IS NULL);
   END IF;
END;
/
