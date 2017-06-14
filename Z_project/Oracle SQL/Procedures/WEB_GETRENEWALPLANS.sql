CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETRENEWALPLANS" (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  NUMBER,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT p.planName,
         pt.description
      FROM web_renewalPlans rp
      JOIN plans p ON
         rp.planId=p.planId
      JOIN planType pt ON
         p.planTypeId=pt.planTypeId
      WHERE cart=pCartId AND
         rp.planTypeId=pPlanTypeId
      ORDER BY pt.planTypeId;
END;
/
