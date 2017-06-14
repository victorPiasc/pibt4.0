CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETCOMPARISON" (
   pCartId     IN  NUMBER,
   pEmployerId IN  VARCHAR2,
   pPlanTypeId IN  NUMBER,
   v_refcur    OUT SYS_REFCURSOR)
AS
   vInvoiceNbr INTEGER;
   vNbrEmployees INTEGER;
BEGIN

   writeWebSubsidy(pCartId, pPlanTypeId);

   SELECT MAX(invoiceNbr) INTO vInvoiceNbr
   FROM invoiceHeader
   WHERE employerId=pEmployerId;

   web_getNbrEmployees(pEmployerId, vNbrEmployees);

   OPEN v_refcur FOR
      --firstcut get the employeeids with planids
      WITH firstCut AS(
         SELECT i.employeeId,
            i.planTierId,
            i.planId oldPlanId,
            COALESCE(t50.newPlan,ft.newPlan, i.planId) newPlanId
         FROM invoiceDetail i
         LEFT JOIN futureTransfers50_100 t50 ON
            i.planId=t50.oldPlan AND
            vNbrEmployees BETWEEN 50 AND 99
         LEFT JOIN futureTransfer ft ON
            i.planId=ft.oldPlan
         WHERE i.invoiceNbr=vInvoiceNbr AND
            i.changestatusId=0),
      --secondcut get the rates for the employees on the planids from firstcut
      secondCut AS (
         SELECT fc.employeeId,
            fc.oldPlanId,
            s.planId newPlanId,
            s.planName,
            s.planTypeId,
            s.rates,
            s.depRates,
            s.subsidy,
            s.subsidyDep,
            wer.contribution,
            wer.contributionDep
         FROM webSubsidy s
         JOIN firstCut fc ON
            s.familyId=fc.employeeId AND
            s.planId=fc.newPlanId
         JOIN web_qqEmployer wer ON
            s.cart=wer.cart
         WHERE s.cart=pCartId AND
            fc.planTierId=0 AND
            (s.planTypeId=pPlanTypeId OR pPlanTypeId IS NULL)),
      --thirdCut groups employerid and planid into 1 record
      thirdCut AS(
         SELECT i.employeeId,
            MAX(m.firstName) fistname,
            MAX(m.lastName) lastName,
            i.planId,
            SUM(CASE WHEN i.planTierId=0 THEN i.amount END) eeAmount,
            SUM(CASE WHEN i.planTierId>0 THEN i.amount END) depAmount
         FROM invoiceDetail i
         JOIN member m ON
            i.employeeId=m.memberId
         WHERE i.invoiceNbr=vInvoiceNbr AND
            i.changeStatusId=0
         GROUP BY i.employeeId, i.planId)
      SELECT sc.employeeId,
         tc.fistName|| ' '||tc.lastName fullName,
         p.planName oldPlanName,
         tc.planId,
         tc.eeAmount oldRates,
         NVL(tc.depAmount,0) oldDepRates,
         TRUNC(tc.eeAmount*sc.contribution)*.01 oldSubsidy,
         NVL(TRUNC(tc.depAmount*sc.contributionDep)*.01,0) oldSubsidyDep,
         p2.planName newPlanName,
         sc.newPlanId,
         sc.rates rates,
         CASE WHEN tc.depAmount IS NOT NULL THEN sc.depRates ELSE 0 END depRates,
         sc.subsidy,
         CASE WHEN NVL(tc.depAmount,0)=0 THEN 0 ELSE sc.subsidyDep END subsidyDep
      FROM thirdCut tc
      LEFT JOIN secondCut sc ON
         sc.employeeId=tc.employeeId AND
         sc.oldPlanId=tc.planId
      JOIN plans p ON
         tc.planId=p.planId
      JOIN plans p2 ON
         sc.newPlanId=p2.planId
      ORDER BY tc.lastName,4;
END;
/
