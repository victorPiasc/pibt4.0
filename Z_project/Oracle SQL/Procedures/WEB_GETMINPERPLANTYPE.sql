CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETMINPERPLANTYPE" (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  NUMBER,
   pMin        OUT NUMBER)
AS
BEGIN
   WITH firstCut AS(
         SELECT SUM(ws.subsidy) subsidy
         FROM webSubsidy ws
         JOIN web_renewalPlans wcc ON
            ws.cart=wcc.cart AND
            ws.planId=wcc.planId
         WHERE ws.cart=pCartId AND
            ws.planTypeId=pPlanTypeId
         GROUP BY ws.planId)
      SELECT NVL(MIN(subsidy),0) INTO pMin
      FROM firstCut;
END;
/
