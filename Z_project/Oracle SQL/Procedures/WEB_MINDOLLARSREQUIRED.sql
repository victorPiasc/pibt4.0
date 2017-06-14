CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_MINDOLLARSREQUIRED" (
   pCartId   IN  NUMBER,
   pRequired OUT NUMBER)
AS
BEGIN
   DELETE FROM web_qqEmployerPlanType WHERE cart=pCartId;

   UPDATE web_qqEmployer
      SET contribution = 50,
         contributionDep = 50,
         ofBase = 'N'
      WHERE cart=pCartId;
   COMMIT;

   writeWebSubsidy(pCartId, NULL);
   
   WITH firstCut AS(
         SELECT MAX(s.planTypeId) planTypeId,
            SUM(s.subsidy) subsidy
         FROM webSubsidy s
         JOIN web_renewalPlans wc ON
            s.cart=wc.cart AND
            s.planId=wc.planId
         WHERE s.cart=pCartId AND
            s.planTypeId IN (1,2,3,4,8)
         GROUP BY s.planId),
      secondCut AS(
         SELECT MIN(subsidy) subsidy
         FROM firstCut
         GROUP BY planTypeId)
      SELECT SUM(subsidy) INTO pRequired
      FROM secondCut;
END;
/
