CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_summaryOFCensus(
   pEmployerId IN VARCHAR2, 
   v_refcur OUT SYS_REFCURSOR)
AS 
BEGIN 
   OPEN v_refcur FOR 
      WITH isDep AS( 
         SELECT memberId, 
            CASE WHEN memberId=employeeId THEN 0 ELSE 1 END isDep
         FROM member
         WHERE employerId=pEmployerId)
      SELECT MAX(CASE WHEN d.isDep=0 THEN 'Enrolled Employees' ELSE 'Enrolled Dependents' END)  enrolled,
         SUM(CASE WHEN p.planTypeId=1 THEN 1 END) medCount,
         SUM(CASE WHEN p.planTypeId=2 THEN 1 END) denCount,
         SUM(CASE WHEN p.planTypeId=3 THEN 1 END) visCount,
         SUM(CASE WHEN p.planTypeId=4 THEN 1 END) chiroCount,
         SUM(CASE WHEN p.planTypeId=5 THEN 1 END) mglCount,
         SUM(CASE WHEN p.planTypeId=6 THEN 1 END) vtlCount,
         SUM(CASE WHEN p.planTypeId=7 THEN 1 END) mtlCount,
         SUM(CASE WHEN p.planTypeId=8 THEN 1 END) mhCount,
         SUM(CASE WHEN p.planTypeId=9 THEN 1 END) eboCount,
         SUM(CASE WHEN p.planTypeId=10 THEN 1 END) mtlGaCount,
         SUM(CASE WHEN p.planTypeId=11 THEN 1 END) mtmtlCount
      FROM memberPlan mp
      JOIN isDep d ON 
         mp.memberId=d.memberId 
      JOIN plans p ON 
         mp.planId=p.planId AND 
         p.carrierId<>0
      JOIN employer er ON 
         mp.employerId=er.employerId AND 
         TRUNC(SYSDATE)<=NVL(er.endDate,'31-dec-9999') AND 
         er.employerId=pEmployerId
      WHERE TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-dec-9999')
      GROUP BY d.isDep
      ORDER BY 1 desc;   
END;
/
