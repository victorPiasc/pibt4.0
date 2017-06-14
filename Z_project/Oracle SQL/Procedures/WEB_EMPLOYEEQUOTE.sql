CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_employeeQuote(
   pCartID IN NUMBER,
   pPlanType IN NUMBER,
   pSelected IN CHAR,  
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN  
   OPEN v_refcur FOR
      SELECT ws.planId,
         MAX(ws.planName) planName,
         MAX(ws.planTypeId) planTypeId,
         MAX(ws.description) description,
         SUM(ws.rates) rates,
         SUM(NVL(ws.depRates,0)) depRates,
         SUM(ws.subsidy) subsidy,
         SUM(ws.subsidyDep) subsidyDep,
         MAX(ws.carrierId) carrierId,
         'NOTE' note,
         MAX(p.subPlanTypeId) subPlanTypeId
      FROM webSubsidy ws 
      LEFT JOIN web_renewalPlans rp ON 
         ws.cart=rp.cart AND 
         ws.planId=rp.planId
      JOIN plans p on 
         ws.planId=p.planId                 
      WHERE ws.cart=pCartId AND         
         ws.planTypeId=pPlanType AND 
         (  pSelected='Y' AND rp.planId IS NOT NULL OR 
            pSelected='N' AND rp.planId IS NULL)
      GROUP BY ws.planId
      ORDER BY 3,2;
END;
/
