CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_DELETERENEWALPLAN" (
   pCartId IN NUMBER,
   pPlanId IN VARCHAR2)
AS
BEGIN
   DELETE FROM web_RenewalPlans
      WHERE cart=pCartId AND
         planId=pPlanId;
   COMMIT;
   
   UPDATE web_qqEmployerPlanType
      SET basePlanId = NULL
      WHERE cart=pCartId AND
         basePlanId=pPlanId;
   COMMIT;

   web_deletePairedPlan(pCartId, pPlanId);
END;
/
