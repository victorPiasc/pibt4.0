CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_HASBASEPLAN" (
   pCartId IN NUMBER,
   pOut OUT NUMBER)
AS
BEGIN
   WITH planTypes AS(
      SELECT DISTINCT rp.plantypeId
      FROM web_renewalPlans rp
      JOIN plans p ON
         rp.planId=p.planId AND
         p.subPlanTypeId<>3
      WHERE rp.cart=pCartId AND
         rp.plantypeId NOT IN (5,6,7,9))
   SELECT COUNT(*) INTO pOut
   FROM planTypes pt
   LEFT JOIN web_qqEmployerPlanType ept ON
      pt.planTypeId=ept.planTypeId AND
      ept.cart=pCartId
   WHERE ept.basePlanId IS NULL;
END;
/
