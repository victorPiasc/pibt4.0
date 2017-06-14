CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CHECKOEAGENCYPINCPLANS" (
   pOEId    IN  VARCHAR2,
   v_return OUT VARCHAR2)
AS
   pOEHasTermedPlan INTEGER;
   pAgentyId        INTEGER;
   pEmployerId      INTEGER;
   pErHasMTL        INTEGER;
   pMedicalPlans    INTEGER;
   pMTLPlans        INTEGER;
BEGIN
   SELECT er.agencyId,
         er.employerID
      INTO pAgentyId,pEmployerId
      FROM web_oe wo
      JOIN employer er ON
         wo.employerId=er.employerId
      WHERE id=pOeId;

   -- Check if this employer includes any MTL plan.
   -- Plan TypeID  #7 :  Medical Term Life, #10 : Medical Term Life GA
   SELECT COUNT(*) INTO pErHasMTL
      FROM employerPlans ep
      JOIN plans p ON
         ep.planId=p.planId
      WHERE ep.employerId=pEmployerId AND
         TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate,'31-Dec-9999') AND
         p.planTypeID IN(7,10);

   -- If this employer doesn't offer MTL , then do no check, exist out.
   v_return := 'true';
   IF pErHasMTL=0 THEN
      RETURN;
   END IF;

   -- Check if this is an employee termination form
   SELECT COUNT(*) INTO pOEHasTermedPlan
      FROM web_oe
      WHERE ID=pOeId AND
         typeId=6;

   -- If this is employee terminiation form , then do no check, exist out.
   IF pOEHasTermedPlan>0 THEN
      RETURN;
   END IF;

   -- Check if this OE includes any Medical plan for emloyee .
   -- Plan type ID # 1: Medical
   SELECT COUNT(*) INTO pMedicalPlans
      FROM web_enrollerFormPlans we
      JOIN plans p ON
         we.planId=p.planId
      WHERE we.oeId=pOeId AND
         we.employeeId=we.memberId AND
         p.planTypeID=1 AND
         p.carrierId<>0 AND 
         NVL(we.treasonId,0)=0;

   --Check if this OE includes any MTL plan for employee.
   -- Plan TypeID  #7 :  Medical Term Life, #10 : Medical Term Life GA
   SELECT COUNT(*) INTO pMTLPlans
      FROM web_enrollerFormPlans we
      JOIN plans p ON
         we.planId=p.planId
      WHERE we.oeId=pOeId AND
         we.employeeId=we.memberId AND
         p.planTypeID IN (7,10) AND
         p.carrierId<>0 AND 
         NVL(we.treasonId,0)=0;

   -- If it is PINC region.
   -- and if this is a termination form, then the member has to term medical and MTL both
   v_return := CASE WHEN pAgentyId<>2 OR pMedicalPlans=pMTLPlans THEN 'true' ELSE 'false' END;
END;
/
