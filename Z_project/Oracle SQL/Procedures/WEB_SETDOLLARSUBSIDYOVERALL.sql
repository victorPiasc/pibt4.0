CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SETDOLLARSUBSIDYOVERALL" (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  NUMBER,
   v_refcur    OUT SYS_REFCURSOR)
AS
   vEmployerId INTEGER;
BEGIN
   SELECT employerId INTO vEmployerId
      FROM web_renewal
      WHERE cart=pCartId;

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
         FROM firstCut),
      status AS (
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
         WHERE ep.employerId=vEmployerId AND
            p.planTypeId=pPlanTypeId AND
            TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-JAN-0001') and NVL(ep.endDate,'31-dec-9999')
         GROUP BY ep.planId)
      SELECT MAX(ws.planName) planName,
         ws.planId,
         MAX(ws.planTypeId) planTypeId,
         MAX(ws.description) description,
         SUM(ws.rates) rates,
         SUM(ws.depRates) depRates,
         MAX(sc.subsidy) subsidy,
         SUM(ws.subsidyDep) subsidyDep,
         CASE WHEN MAX(st.planId) IS NOT NULL THEN 'Active/Transfer'
            ELSE 'New' END status
      FROM webSubsidy ws
      JOIN web_renewalPlans wcc ON
         ws.cart=wcc.cart AND
         ws.planId=wcc.planId
      CROSS JOIN secondCut sc
      JOIN carrier c ON
         ws.carrierId = c.carrierId
      LEFT JOIN status st ON
            ws.planId=st.planId
      WHERE ws.cart=pCartId AND
         ws.plantypeId=pPlanTypeId
      GROUP BY ws.planId
      ORDER BY MAX(c.name), SUM(ws.rates);
END;
/
