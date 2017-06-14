CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTRENEWALPLAN" (
   pCartId NUMBER,
   pPlanId VARCHAR2)
AS
BEGIN
   INSERT INTO web_RenewalPlans
      SELECT p.planId,
         p.planTypeId,
		 pCartId
      FROM plans p
      LEFT JOIN web_renewalPlans rp ON
         rp.cart=pCartId AND
         p.planId=rp.planId
      WHERE p.planId=pPlanId AND
         rp.planId IS NULL;
   COMMIT;

   web_addPairedPlan(pCartId,pPlanId);
END;
/
