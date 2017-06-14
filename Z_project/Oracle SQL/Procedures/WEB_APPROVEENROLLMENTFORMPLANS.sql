CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_approveEnrollmentFormPlans(
   pOeId IN VARCHAR2, 
   pUpdatedBy VARCHAR2)
AS
   vMemberPlanId INTEGER;
BEGIN
   --add plans that are new to the members,
   FOR rec IN(
      SELECT efp.*,
         m.employerId,
         efp.ROWID rId,
         p.carrierId
      FROM web_enrollerFormPlans efp
      LEFT JOIN memberPlan mp ON 
         efp.memberId=mp.memberId AND 
         efp.planId=mp.planId AND 
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-DEC-9999')
      JOIN member m ON 
         efp.memberId=m.memberId
      JOIN plans p ON 
         efp.planId=p.planId                 
      WHERE efp.oeId=pOeId AND 
         mp.planId IS NULL AND
      NVL(efp.treasonId,0)=0)
   LOOP
      web_insertMemberPlan(rec.memberid, rec.employeeid, rec.planid, rec.employerid, SYSDATE, rec.effectivedate, rec.expirydate,
         rec.planoffice1, rec.planoffice2, CASE WHEN rec.carrierId IN (18,143) THEN SUBSTR(rec.planoffice3,1,4) ELSE rec.planoffice3 END, 
         rec.insuranceamount, pUpdatedBy, vMemberPlanId);

      UPDATE web_enrollerFormPlans
         SET memberPlanId = vMemberPlanId,
         updated = Sysdate,
         updatedBy = pUpdatedBy
      WHERE ROWID=rec.rId;
   END LOOP;
   
   --update insurance amount where it changed   
   FOR rec IN (
      SELECT mp.ROWID rId,
         efp.insuranceAmount 
      FROM web_enrollerFormPlans efp 
      JOIN plans p ON 
         efp.planId=p.planId AND 
         p.carrierId<>0 AND 
         p.planTypeId=6
      JOIN memberPlan mp ON 
         efp.memberId=mp.memberId AND 
         efp.planId=mp.planId AND 
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-DEC-9999') AND 
         efp.insuranceAmount<>mp.insuranceAmount
      WHERE efp.oeId=pOeId AND 
         NVL(efp.treasonId,0)=0)
   LOOP
      UPDATE memberPlan 
      SET insuranceAmount=rec.insuranceAmount 
      WHERE ROWID=rec.rId;
   END LOOP;
   
   --update PCP information
   FOR rec IN(
      SELECT mp.ROWID rId, 
         efp.planOffice1, 
         efp.planOffice2, 
         efp.planOffice3
      FROM web_enrollerFormPlans efp 
      JOIN plans p on 
         efp.planId=p.planId AND 
         p.carrierId<>0 AND 
         p.planTypeId IN (1,2) 
      JOIN memberPlan mp ON
         efp.memberId=mp.memberId AND 
         efp.planId=mp.planId AND 
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-DEC-9999')
      WHERE efp.oeId=pOeID AND 
         (  efp.planOffice1 IS NOT NULL OR 
            efp.planOffice2 IS NOT NULL OR 
            efp.planOffice3 IS NOT NULL) AND 
         NVL(efp.treasonId,0)=0
   )
   LOOP
      UPDATE memberPlan
      SET planOffice1=rec.planOffice1, 
         planOffice2=rec.planOffice2, 
         planOffice3=rec.planOffice3
      WHERE ROWID=rec.rID;         
   END LOOP;
    

   -- update terminate plans
   FOR rec IN(
      SELECT efp.treasonId, 
         efp.expiryDate, 
         mp.memberPlanId
      FROM web_enrollerFormPlans efp
      JOIN memberPlan mp ON 
         efp.memberId=mp.memberId AND 
         efp.planId=mp.planId AND 
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-DEC-9999')
      WHERE oeId=pOeId AND 
         efp.treasonId IS NOT NULL)
   LOOP
      UPDATE memberPlan
      SET treasonId = rec.treasonId,
         expiryDate = rec.expirydate,
         updated = SYSDATE,
         updatedBy = pUpdatedBy
      WHERE memberPlanId = rec.memberPlanId;
   END LOOP;
   COMMIT;
End;
/
