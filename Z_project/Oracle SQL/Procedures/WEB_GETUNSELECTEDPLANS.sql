CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETUNSELECTEDPLANS" (
   pCartId     IN  NUMBER,
   pEmployerId IN  VARCHAR2,
   pPlanTypeId IN  NUMBER,
   pIsPercent  IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   IF pIsPercent='Y' THEN
      writeWebSubsidy(pCartId, pPlanTypeID);
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
               TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-jan-0001') and NVL(ep.endDate,'31-dec-9999')
            GROUP BY ep.planId)
         SELECT MAX(ws.planName) planName,
            ws.planId,
            MAX(ws.planTypeId) planTypeId,
            MAX(ws.description) description,
            SUM(ws.rates) rates,
            SUM(ws.depRates) depRates,
            SUM(ws.subsidy) subsidy,
            SUM(ws.subsidyDep) subsidyDep,
            CASE WHEN MAX(st.planId) IS NOT NULL THEN 'Current Plan(s) Removed'
               ELSE 'New Plans' END status,
            MAX(p.subPlanTypeId) subPlanTypeId,
            MAX(p.carrierId) carrierId
         FROM webSubsidy ws
         JOIN plans p ON 
            ws.planId=p.planId
         JOIN carrier c ON 
            p.carrierId=c.carrierId
         LEFT JOIN web_renewalPlans wcc ON
            ws.cart=wcc.cart AND
            ws.planId=wcc.planId
         LEFT JOIN status st ON
            ws.planId=st.planId
         WHERE ws.cart=pCartId AND
            ws.planTypeId=pPlanTypeId AND
            wcc.planId IS NULL
         GROUP BY ws.planId
         ORDER BY MAX(c.name), SUM(ws.rates);
END;
/
