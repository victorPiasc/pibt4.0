CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETOECOMPARISON" (
   pCartId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pEmployeeId IN VARCHAR2,
   pPlanTypeId IN NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
   vInvoiceNbr INTEGER;
   vNbrEmployees INTEGER;
BEGIN

   SELECT MAX(invoiceNbr) INTO vInvoiceNbr
   FROM invoiceHeader
   WHERE employerId=pEmployerId;

   web_getNbrEmployees(pEmployerId, vNbrEmployees);

   OPEN v_refcur FOR
      WITH firstCut AS(
         SELECT DISTINCT i.employeeId,
            i.planId oldPlanId,
            p.planName oldPlanName,
            ws.planId newPlanId,
            ws.planName newPlanName,
            NVL(ws.rates,0) rates,
            NVL(ws.depRates,0) depRates
         FROM invoiceDetail i
         JOIN plans p ON
            i.planId=p.planId
         LEFT JOIN futureTransfer ft ON
            i.planId=ft.oldPlan
         LEFT JOIN futureTransfers50_100 f50 ON
            i.planId=f50.oldPlan AND
            vNbrEmployees>=100
         LEFT JOIN webSubsidy ws ON
            COALESCE(f50.newPlan, ft.newPlan,i.planId)=ws.planId AND
            ws.cart=pCartId
         WHERE i.invoiceNbr=vInvoiceNbr AND
            i.employeeId=pEmployeeId AND
            p.planTypeId=pPlanTypeId)
      SELECT i.employeeId,
         i.planId oldPlanId,
         MAX(fc.oldPlanName) oldPlanName,
         SUM(CASE WHEN i.planTierId=0 THEN i.amount END) oldRates,
         NVL(SUM(CASE WHEN i.planTierId>0 THEN i.amount END),0) oldDepRates,
         MAX(fc.newPlanId) planId,
         MAX(fc.newPlanName) planName,
         MAX(fc.rates) rates,
         MAX(fc.depRates) depRates
      FROM invoiceDetail i
      JOIN firstCut fc ON
         i.planId=fc.oldPlanId AND
         i.employeeId=fc.employeeId
      WHERE invoiceNbr=vInvoiceNbr
      GROUP BY i.employeeId, i.planId;
END;
/
