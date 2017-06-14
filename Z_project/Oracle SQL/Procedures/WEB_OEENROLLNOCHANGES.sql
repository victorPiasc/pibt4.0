CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_OEENROLLNOCHANGES" (
   pOeId IN VARCHAR2,
   pEmployeeId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pUpdatedBy IN VARCHAR2,
   pOut OUT VARCHAR2)
AS
   vNbrEmployees INTEGER;
   vCartId INTEGER;
   vRenewalDate DATE;
   vTmp INTEGER;
BEGIN
   web_getOeEffectiveDate(pOeId, vRenewalDate);
   web_getNbrEmployees(pEmployerId, vNbrEmployees);

   SELECT cart INTO vCartId
   FROM web_oeCart
   WHERE oeId=pOeId;

   DELETE FROM web_enrollerFormPlans
   WHERE oeId=pOeId;
   COMMIT;

   --Add all plans we know about
   FOR rec IN(
      SELECT DISTINCT COALESCE(f50.newPlan, ft.newPlan, mp.planId) planId,
         p.planTypeId,
         er.agencyId
      FROM memberPlan mp
      LEFT JOIN futureTransfers50_100 f50 ON
         mp.planId=f50.oldPlan AND
         vNbrEmployees>99
      LEFT JOIN futureTransfer ft ON
         mp.planId=ft.oldPlan
      JOIN plans p ON
         p.planId = COALESCE(f50.newPlan, ft.newPlan, mp.planId) AND
         p.planTypeId NOT IN (6)
      JOIN employer er ON
         mp.employerId=er.employerId
      WHERE mp.employeeId=pEmployeeId AND
         TRUNC(SYSDATE) BETWEEN NVL(mp.effectiveDate, '01-JAN-0001') AND NVL(mp.expiryDate, '31-DEC-9999'))
   LOOP
      IF rec.planTypeId<>7 THEN
         web_insertEnrollerFormPlans(pOeId, vCartId, pEmployeeId, rec.planId, pUpdatedBy, 'Y', pOut);
         IF rec.agencyId=2 AND rec.plantypeId=1 THEN
            web_addMtl(pEmployeeId, pEmployerId, pOeId, NULL, pUpdatedBy);
         END IF;
      ELSE
         IF rec.agencyId<>2 THEN
            web_addMtl(pEmployeeId, pEmployerId, pOeId, NULL, pUpdatedBy);
         END IF;
      END IF;

      IF pOut IS NOT NULL THEN
        RETURN;
      END IF;
   END LOOP;

   --get enrollment type
   SELECT typeId INTO vTmp
   FROM web_oe
   WHERE id=pOeId;

   --add each member to vtl again if it exist
   FOR rec IN (
      SELECT mp.memberId,
         m.employeeType,
         mp.planId
      FROM memberPlan mp
      JOIN member m ON
         mp.memberId=m.memberId
      JOIN plans p ON
         mp.planId=p.planId AND
         p.planTypeId=6
      WHERE mp.employeeId=pEmployeeId AND
         TRUNC(SYSDATE) BETWEEN NVL(mp.effectiveDate, '01-JAN-0001') AND NVL(mp.expiryDate, '31-DEC-9999') AND
         NVL(mp.treasonId,0)=0)
   LOOP
      web_addVtl(pOeId, vTmp, rec.planId, rec.memberId, rec.employeeType, vRenewalDate, pUpdatedBy);
   END LOOP;

   --Add declination plans for all missing plan types
   FOR rec IN(
      SELECT MAX(dp.planId) planId
      FROM employerPlans ep
      LEFT JOIN memberPlan mp ON
         ep.planId=mp.planId AND
         TRUNC(SYSDATE) BETWEEN NVL(mp.effectiveDate, '01-JAN-0001') and NVL(expiryDate,'31-DEC-9999') AND
         mp.memberId=pEmployeeId
      JOIN plans p ON
         ep.planId=p.planId AND
         p.planTypeId NOT IN (5,7,9)
      JOIN plans dp ON
         dp.planTypeId=p.planTypeId AND
         dp.carrierId=0 AND
         UPPER(dp.planName) LIKE '%DECLINATION%'
      WHERE ep.employerId=pEmployerId AND
         TRUNC(vRenewalDate) BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate,'31-DEC-9999')
      GROUP BY p.planTypeId
      HAVING COUNT(mp.planId)=0)
   LOOP
      INSERT INTO web_enrollerFormPlans(id, oeId, employeeId, memberId, planId, effectiveDate, price)
         VALUES(web_enrollerFormPlans_SEQ.NEXTVAL, pOeId, pEmployeeId, pEmployeeId, rec.planId, vRenewalDate, 0);
   END LOOP;
END;
/
