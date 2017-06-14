CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_oeRedirect(
   pOeId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pPage OUT VARCHAR2)
AS
   vCount INTEGER;
   vCount2 INTEGER;
   vEmployeeId INTEGER;
BEGIN
   pPage:='Plans';
   --count of plans added 
   SELECT COUNT(DISTINCT planId) INTO vCount
   FROM web_enrollerFormPlans
   WHERE oeId=pOeId AND
      NVL(treasonId,0)=0;
         
   IF vCount<1 THEN
      RETURN;
   END IF;      
   --count of plans offerd 
   SELECT COUNT(DISTINCT p.plantypeid) INTO vCount2
   FROM web_erCurrentPlans_v ev
   JOIN plans p ON
      p.planId = ev.planId
   WHERE employerId = pEmployerId AND
      p.planTypeId NOT IN (5,6,9);
   
   --if not enrolled in all plans    
   IF vCount2>vCount THEN
      RETURN;
   END IF;
   
   SELECT CASE WHEN signatureName IS NOT NULL THEN 'EnrollmentPreview' 
      WHEN legalDocs='Y' THEN 'SignPlan'
      ELSE 'SummaryOfChanges' END INTO pPage
   FROM web_oe 
   WHERE id=pOeId;
   
   IF pPage<>'SummaryOfChanges' THEN 
      RETURN;
   END IF;      
   --count of life plans offered
   SELECT COUNT(DISTINCT p.planTypeId) INTO vCount
   FROM web_erCurrentPlans_v ev
   JOIN plans p ON
      p.planId = ev.planId
   WHERE employerId = pEmployerId AND
      p.planTypeId IN (6,7);      
   
   --if life coverage exist         
   IF vCount>0 THEN         
      --check to see if plans chosen are not declination
      SELECT COUNT(DISTINCT p.planTypeId) INTO vCount2 
      FROM web_EnrollerFormPlans wep
      JOIN plans p ON 
         wep.planId=p.planId AND 
         p.planTypeId IN (6,7) AND
         p.carrierId=0
      WHERE oeId=pOeId AND 
         NVL(treasonId,0)=0;
         
      IF vCount>vCount2 THEN                     
         --count of life plans enrolled         
         SELECT COUNT(DISTINCT p.planTypeId) INTO vCount2 
         FROM web_EnrollerFormPlans wep
         JOIN plans p ON 
            wep.planId=p.planId AND 
            p.planTypeId IN (6,7)
         WHERE oeId=pOeId AND 
            NVL(treasonId,0)=0;
         --if not enrolled in all life coverage plans          
         IF vCount>vCount2 THEN 
            pPage:='LifeCoverage';         
            RETURN;
         END IF;
         
         SELECT memberId INTO vEmployeeId
         FROM web_oe 
         WHERE id=pOeId;
         
         SELECT COUNT(*) INTO vCount2
         FROM beneficiaries 
         WHERE memberId = vEmployeeId;      
         --if no beneficiaries added to life coverage
         IF vCount2=0 THEN 
            pPage:='LifeCoverage';
            RETURN;
         ELSE 
            SELECT SUM(NVL(percentage,0))INTO vCount2
            FROM beneficiaries 
            WHERE memberId=vEmployeeId;
            --if beneficiary percent under the amount needed
            IF vCount2<>100*vCount THEN
               pPage:='LifeCoverage';
               RETURN; 
            END IF;
         END IF; 
      END IF;                                                                 
   END IF;     
END;
/
