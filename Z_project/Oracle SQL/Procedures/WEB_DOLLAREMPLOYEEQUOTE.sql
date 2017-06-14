CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_DollarEmployeeQuote (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  NUMBER,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      WITH firstCut AS(
         SELECT SUM(ws.subsidy) subsidy
         FROM webSubsidy ws
         JOIN web_renewalPlans wcc ON
            ws.cart=wcc.cart AND
            ws.planId=wcc.planId
         WHERE ws.cart=pCartId
            AND ws.planTypeId=pPlanTypeID
         GROUP BY ws.planId),
      secondCut AS(
         SELECT MIN(subsidy) subsidy
         FROM firstCut)     
      SELECT MAX(ws.planName) planName,
         ws.planId,
         MAX(ws.planTypeId) planTypeId,
         MAX(ws.description) description,
         SUM(ws.rates) rates,
         SUM(ws.depRates) depRates,
         MAX(sc.subsidy) subsidy,
         SUM(ws.subsidyDep) subsidyDep,
         MAX(c.carrierId) carrierId, 
         MAX(p.subPlantypeId) subPlanTypeId
      FROM webSubsidy ws
      JOIN web_renewalPlans wcc ON
         ws.cart=wcc.cart AND
         ws.planId=wcc.planId
      CROSS JOIN secondCut sc
      JOIN carrier c ON
         ws.carrierId = c.carrierId
      JOIN plans p ON
         wcc.planId=p.planId          
      WHERE ws.cart=pCartId AND
         ws.plantypeId=pPlanTypeId
      GROUP BY ws.planId
      ORDER BY MAX(c.name), SUM(ws.rates);
END;
/
