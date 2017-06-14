CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ADDPAIREDPLAN" (
   pCartId IN NUMBER,
   pPlanId IN VARCHAR2)
AS
BEGIN
   INSERT INTO web_RenewalPlans
      SELECT p1.planIdTwo,
         p.planTypeId,
         pCartId
      FROM pairedPlans p1
      LEFT JOIN web_renewalPlans rp ON
         rp.cart=pCartId AND
         p1.planIdTwo=rp.planId
      LEFT JOIN plans p ON
         p1.planIdTwo=p.planId
      WHERE p1.planIdOne=pPlanId AND
         rp.planId IS NULL;
   COMMIT;
END;
/
