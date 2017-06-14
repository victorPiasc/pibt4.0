CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_RENEWALEELEVEL" (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      WITH depCount AS(
         SELECT familyId,
            COUNT(CASE WHEN employeeTypeId=2 THEN 1 END) children,
            COUNT(CASE WHEN employeeTypeId IN (1,3) THEN 1 END) spouse
         FROM web_qqCart
         WHERE cart=pCartId
         GROUP BY familyId),
      webCart AS(
         SELECT familyId,
            MAX(employeeName) employeeName
         FROM web_qqCart
         WHERE cart=pCartId AND
          employeeTypeId=0
         GROUP BY familyId)
      SELECT wc.familyId,
         wc.employeeName,
         0 employeeTypeId,
         dc.spouse,
         dc.children,
         s.planid,
         s.planName,
         s.rates,
         s.deprates,
         s.subsidy,
         s.subsidyDep,
         c.name
      FROM webCart wc
      JOIN webSubsidy s ON
         wc.familyId=s.familyId AND
         s.cart=pCartId AND
         s.planTypeId=pPlanTypeId
      JOIN web_renewalPlans rp ON
         rp.cart=pCartId AND
         s.planId=rp.planId
      JOIN depCount dc ON
         wc.familyId=dc.familyId
      JOIN carrier c ON
         s.carrierId=c.carrierId
      ORDER BY wc.familyId,UPPER(c.name), UPPER(s.planName);
END;
/
