CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETEECURRENT" (
   pCartId IN VARCHAR2,
   pOeId IN VARCHAR2,
   pEmployeeId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT MAX(m.firstname)|| ' ' || MAX(m.lastname) name,
         mp.planId,
         MAX(p.planName) planName,
         MAX(pt.description) description,
         SUM(NVL(s.rates,0)) rates,
         SUM(NVL(s.subsidy,0)) subsidy,
         SUM(NVL(s.depRates,0)) depRates,
         SUM(NVL(s.subsidyDep,0)) subsidyDep,
         CASE WHEN MAX(s.planId) IS NULL THEN 'Expiring' ELSE 'Active' END status,
         SUM(CASE WHEN efp.planId IS NOT NULL THEN 1 ELSE 0 END) keepCur
      FROM member m
      JOIN memberPlan mp ON
         m.memberId=mp.memberId AND
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-dec-9999') AND
         NVL(mp.treasonId,0)=0
      JOIN plans p ON
         mp.planId=p.planId
      JOIN planType pt ON
         p.planTypeId=pt.planTypeId AND
         pt.planTypeId NOT IN (5,6,7,9)
      LEFT JOIN webSubsidy s ON
         mp.planId=s.planId AND
         s.cart=pCartId
      LEFT JOIN web_enrollerFormPlans efp ON
         efp.oeId=pOeId AND
         m.memberId=efp.memberId AND
         mp.planId=efp.planId AND
         NVL(efp.treasonId,0)=0
      WHERE m.employerId=pEmployerId AND
         m.memberId=pEmployeeId
      GROUP BY mp.planId
      ORDER BY MAX(pt.planTypeId);
END;
/
