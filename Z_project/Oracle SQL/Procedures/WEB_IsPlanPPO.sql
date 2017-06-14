CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ISPLANPPO" (
   pOeId IN VARCHAR2,
   pPlanTypeId IN NUMBER,
   vOut OUT NUMBER)
AS
BEGIN
   SELECT COUNT(*) INTO vOut
   FROM web_enrollerFormPlans we
   JOIN plans p On
      we.planId=p.planId AND
      p.planTypeId=pPlanTypeId AND
      p.accountingPlanTypeId NOT IN ('DPO','PPO') AND
      p.carrierId NOT IN (0,1,29,142)
   WHERE we.oeId=pOeId AND
      NVL(we.treasonId,0)=0;
END;
/
