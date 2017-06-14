CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETEESUMMARYCENSUS" (
   pOeId IN VARCHAR2,
   pEmployeeId IN VARCHAR2,
   pType IN NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   IF pType=1 THEN 
      OPEN v_refcur FOR
         SELECT efp.memberId,
            MAX(m.firstName)||' '||MAX(m.middleName)||'' || MAX(m.lastName) name,
            SUM(CASE WHEN p.planTypeId=1 THEN 1 ELSE 0 END) medCount,
            SUM(CASE WHEN p.planTypeId=2 THEN 1 ELSE 0 END) denCount,
            SUM(CASE WHEN p.planTypeId=3 THEN 1 ELSE 0 END) visCount,
            SUM(CASE WHEN p.planTypeId=4 THEN 1 ELSE 0 END) chiroCount,
            SUM(CASE WHEN p.planTypeId=6 THEN 1 ELSE 0 END) vtlCount,
            SUM(CASE WHEN p.planTypeId=7 THEN 1 ELSE 0 END) mtlCount,
            SUM(CASE WHEN p.planTypeId=8 THEN 1 ELSE 0 END) mhCount,
            SUM(CASE WHEN p.planTypeId=10 THEN 1 ELSE 0 END) mtlGaCount,
            SUM(CASE WHEN p.planTypeId=11 THEN 1 ELSE 0 END) mtmtlCount
         FROM web_enrollerFormPlans efp
         JOIN member m ON
            efp.memberId=m.memberId
         JOIN plans p ON
            efp.planId=p.planId AND
            p.carrierId<>0
         WHERE efp.oeId=pOeId AND
            NVL(efp.treasonId,0)=0
         GROUP BY efp.memberId
         ORDER BY MAX(m.employeeType), MAX(m.lastName), MAX(m.firstName);
   ELSE 
      OPEN v_refcur FOR
         SELECT mp.memberId,
            MAX(m.firstName)||' '||MAX(m.middleName)||' '|| MAX(m.lastName) name,
            SUM(CASE WHEN p.planTypeId=1 THEN 1 ELSE 0 END) medCount,
            SUM(CASE WHEN p.planTypeId=2 THEN 1 ELSE 0 END) denCount,
            SUM(CASE WHEN p.planTypeId=3 THEN 1 ELSE 0 END) visCount,
            SUM(CASE WHEN p.planTypeId=4 THEN 1 ELSE 0 END) chiroCount,
            SUM(CASE WHEN p.planTypeId=6 THEN 1 ELSE 0 END) vtlCount,
            SUM(CASE WHEN p.planTypeId=7 THEN 1 ELSE 0 END) mtlCount,
            SUM(CASE WHEN p.planTypeId=8 THEN 1 ELSE 0 END) mhCount,
            SUM(CASE WHEN p.planTypeId=10 THEN 1 ELSE 0 END) mtlGaCount,
            SUM(CASE WHEN p.planTypeId=11 THEN 1 ELSE 0 END) mtmtlCount
         FROM memberPlan mp 
         JOIN member m ON
            mp.memberId=m.memberId
         JOIN plans p ON
            mp.planId=p.planId AND
            p.carrierId<>0
         WHERE mp.employeeId=pEmployeeId AND
            TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-DEC-9999') AND
            NVL(mp.treasonId,0)=0
         GROUP BY mp.memberId
         ORDER BY MAX(m.employeeType), MAX(m.lastName), MAX(m.firstName);
   END IF;                              
END;
/
