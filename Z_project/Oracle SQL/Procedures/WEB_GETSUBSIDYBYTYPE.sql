CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETSUBSIDYBYTYPE" (
   pCartId     IN  NUMBER,
   pEmployerId IN  VARCHAR2,
   pPlanTypeId IN  NUMBER,
   pIsPercent  IN  VARCHAR2,
   v_refcur    OUT  SYS_REFCURSOR)
AS
BEGIN
   IF pIsPercent='Y' THEN
      writeWebSubsidy(pCartId, pPlanTypeId);
   END IF;
   OPEN v_refcur FOR
      WITH status AS (
         SELECT MAX(COALESCE(f50.newPlan, ft.newPlan, ws.PlanId)) planId
         FROM employerPlans ep
         JOIN plans p ON
            ep.planId=p.planId
         JOIN web_qqEmployer er on
            er.cart=pCartId
         LEFT JOIN webSubsidy ws ON
            ep.planId=ws.planId AND
            ws.cart=pCartId
         LEFT JOIN futureTransfer ft ON
            ep.planId=ft.oldPlan
         LEFT JOIN futureTransfers50_100 f50 ON
            ep.planId=f50.oldPlan AND
            er.nbrEmployees>=100
         WHERE ep.employerId=pEmployerId AND
            p.planTypeId=pPlanTypeId AND
            TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-JAN-0001') and NVL(ep.endDate,'31-dec-9999')
         GROUP BY ep.planId)
      SELECT MAX(ws.planName) planName,
         ws.planId,
         MAX(ws.description) description,
         SUM(ws.rates) rates,
         SUM(ws.depRates) depRates,
         SUM(ws.subsidy) subsidy,
         SUM(ws.subsidyDep) subsidyDep,
         MAX(ept.basePlanId) basePlanId,
         CASE WHEN MAX(st.planId) IS NOT NULL THEN 'Active/Transfer'
            ELSE 'New' END status,
         MAX(p.subPlanTypeId) subPlanTypeId,
         MAX(c.carrierId) carrierId
      FROM webSubsidy ws
      JOIN web_renewalPlans wcc ON
         ws.cart=wcc.cart AND
         ws.planId=wcc.planId
      JOIN carrier c ON
         ws.carrierId=c.carrierId
      JOIN plans p ON 
         ws.planId=p.planId      
      LEFT JOIN web_qqEmployerPlanType ept ON
         ws.cart=ept.cart AND
         ws.planTypeId=ept.planTypeId
      LEFT JOIN status st ON
         ws.planId=st.planId
      WHERE ws.cart=pCartId AND
         ws.planTypeId=pPlanTypeId
      GROUP BY ws.planId
      ORDER BY 9,MAX(c.name), SUM(ws.rates);
END;
/
