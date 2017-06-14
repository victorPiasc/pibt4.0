CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETCURRENTPLANSANDCOUNT" (
   pEmployerId IN VARCHAR2,
   pPlanTypeId IN NUMBER,
   vRefcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN vRefcur FOR
      WITH planCount AS (
         SELECT mp.planId,
            SUM(CASE WHEN m.employeeType=0  THEN 1 ELSE 0 END) ee,
            SUM(CASE WHEN m.employeeType=1 THEN 1 ELSe 0 END) spouse,
            SUM(CASE WHEN m.employeeType=2 THEN 1 ELSe 0 END) children,
            SUM(CASE WHEN m.employeeType=3 THEN 1 ELSe 0 END) dp
         FROM memberPlan mp
         JOIN member m ON
            mp.memberId=m.memberId
         JOIN plans p ON
            mp.planId=p.planId
         WHERE mp.employerId=pEmployerId AND
            NVL(mp.treasonId, 0)=0 AND
            TRUNC(SYSDATE)<NVL(expiryDate, '31-DEC-9999') AND
            p.carrierId<>0
         GROUP BY mp.planId)
      SELECT ep.planId,
         c.Name carrierName,
         p.planName,
         NVL(pc.ee,0) ee,
         NVL(pc.spouse,0) spouse,
         NVL(pc.children,0) children,
         NVL(pc.dp,0) dp,
         CASE WHEN ep.endDate IS NOT NULL THEN 'Expiring as of '|| to_char(ep.endDate, 'mm/dd/yyyy')
            WHEN TRUNC(SYSDATE)< NVL(ep.startDate,'01-JAN-0001') THEN 'Effective as of '|| to_char(ep.startDate, 'mm/dd/yyyy')
            ELSE 'Active as of '|| to_char(ep.startDate, 'mm/dd/yyyy') END actExp
      FROM employerPlans ep
      LEFT JOIN planCount pc ON
         ep.planId=pc.planId
      JOIN plans p ON
         ep.planId=p.planId
      JOIN carrier c ON
         p.carrierId=c.carrierId
      WHERE ep.employerId=pEmployerId AND
         p.planTypeId=pPlanTypeId AND
         TRUNC(SYSDATE)< NVL(ep.endDate,'31-dec-9999') AND
         p.carrierId<>0
      ORDER BY 4 desc,2;
END;
/
