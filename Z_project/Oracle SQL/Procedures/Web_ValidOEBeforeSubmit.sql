CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_VALIDOEBEFORESUBMIT" (
   pOeId    IN  VARCHAR2,
   v_return OUT VARCHAR2)
AS
   vOetypeId               INTEGER;
   vStatus                 INTEGER;
   vCreated                DATE;
   vAcceptedLegalDoc       CHAR(1);
   vSigned                 CHAR(1);
   vSelectedPlans          INTEGER;
   vEmployerId             INTEGER;
   vOeBeneficiaries        INTEGER;
   vinvalidLife            INTEGER;
   vEmployeeId             INTEGER;
BEGIN

   -- OE types: 1=new hire; 2=newborn; 3=terminate' 4=open enrollment form; 5=new marriage
   SELECT typeId,
         status,
         created,
         NVL(legalDocs,'N'),
         CASE WHEN signatureId IS NOT NULL THEN 'Y' ELSE 'N'END CASE,
         employerId,
         memberId
      INTO vOeTypeId, vStatus, vCreated, vAcceptedLegalDoc, vSigned, vEmployerId, vEmployeeId
      FROM web_oe
      WHERE id=poeId;

   -- Check status, Only Draft Form can be submitted.
   IF vStatus>0 THEN
      v_return := 'Only a draft form can be submitted.';
      RETURN;
   END IF;

   -- Check if this OE is expired
   IF vCreated<ADD_MONTHS(SYSDATE,-1) THEN
      v_return := 'This OE was created over a month ago. Cancel it and recreate another one.';
      RETURN;
   END IF;

   -- Check if read legaldoc, Do not check for any termination forms (3,6)
   IF vOetypeId NOT IN(3,6) AND vAcceptedLegalDoc='N' THEN
      v_return := 'You did not accept the legal document. Click <a href="/oe/legaldocs.aspx?erId='|| vEmployerId ||'&eeId=' || vEmployeeId || '">Here</a>';
      RETURN;
   END IF;

   -- Check if signed
   IF vSigned='N' THEN
      v_return := 'You did not sign for this enrollment form. Click <a href="/oe/signplan.aspx?erId='|| vEmployerId ||'&eeId=' || vEmployeeId || '">Here</a>';
      RETURN;
   END IF;

   -- Check if selected plans
   SELECT COUNT(*) INTO vSelectedPlans FROM web_enrollerFormPlans WHERE oeId=pOeId;
   IF vSelectedPlans=0 THEN
      v_return := 'You did not select any plans for this enrollment form. Click <a href="/oe/plans.aspx?erId='|| vEmployerId ||'&eeId=' || vEmployeeId || '">Here</a>';
      RETURN;
   END IF;

   -- Check OE agency MTL plans
   WEB_CheckOEAgencyPINCPlans(pOeId=>pOeId, v_return=>v_return);
   IF v_return='false' THEN
      v_return := 'Employee is required to select both Medical Term Life coverage and Medical coverage.';
      RETURN;
   END IF;

   -- Check life coverages beneficiaries, not check for temination from, form type (3,6)
   IF vOeTypeId IN (1,4) THEN
      FOR rec IN (
         SELECT DISTINCT p.planTypeId,
            pt.description
         FROM web_enrollerFormPlans ev
         JOIN plans p ON
            p.planId = ev.planId AND
            p.carrierId<>0
         JOIN planType pt ON
            p.planTypeId=pt.planTypeId
         WHERE ev.oeId=pOeId AND
            p.planTypeId IN (6,7))
      LOOP
         SELECT SUM(a.percentage) INTO vOeBeneficiaries
         FROM beneficiaries a
         WHERE a.memberId=vEmployeeId and
            planTypeId=rec.planTypeId;

         IF vOeBeneficiaries IS NULL THEN
            v_return:= 'You did not add any beneficiaries to '||rec.description||' coverage. Click <a href="/OE/LifeCoverage.aspx?erId='|| vEmployerId ||'&eeId=' || vEmployeeId || '">Here</a>';
            RETURN;
         END IF;
         IF vOeBeneficiaries<>100 THEN
            v_return := rec.description|| ' coverage must total 100% for beneficiaries. Click <a href="/OE/LifeCoverage.aspx?erId='|| vEmployerId ||'&eeId=' || vEmployeeId || '">Here</a>';
            RETURN;
         END IF;
      END LOOP;
   END IF;

   -- Check fill information
   SELECT COUNT(*) INTO vInvalidLife
   FROM web_enrollerFormPlans_v v
   JOIN member m ON
      v.employeeId=m.memberId      
   WHERE v.oeId=pOeId AND      
       v.plantypeId IN(5,6,7,10,11) AND
       m.employeeType = 0 AND
       NVL(v.treasonId,0) = 0 AND
       NVL(m.hoursWorked,0)<30 AND --salary not required per stephanie, per pauline
       v.carrierId<>0 AND 
       m.memberId NOT IN 
       ( SELECT memberId
         FROM memberPlan mp 
         WHERE m.memberId=mp.memberId);

   -- Life Coverage Fill information
   IF vInvalidLife>0 THEN
      v_return := 'Life coverage requires a known salary and at least half-time work. Click <a href="/oe/plans.aspx?erId='|| vEmployerId ||'&eeId=' ||
         vEmployeeId || '">Here</a>';
      RETURN;
   END IF;

   -- Success
   v_return := 'OK';
END;
/
