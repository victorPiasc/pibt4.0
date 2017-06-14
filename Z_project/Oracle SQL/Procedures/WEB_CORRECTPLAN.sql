CREATE OR REPLACE PROCEDURE web_correctPlan(
   pMemberId VARCHAR2,
   pOeId VARCHAR2,
   pPlanId VARCHAR2)
AS
   vPlanId INTEGER;
BEGIN
   SELECT planIdTwo INTO vPlanId
   FROM pairedPlans  
   WHERE planIdOne=pPlanId;
   
   IF vPlanId IS NOT NULL THEN 
      UPDATE web_enrollerFormPlans 
      SET planId=vPlanId
      WHERE oeId=pOeId AND 
         memberId=pMemberId AND 
         planId=pPlanId;
      COMMIT;         
   END IF;         
END;
/
