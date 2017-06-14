CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETRENEWALTERMPLANS" (
   pCartId     IN  NUMBER,
   pEmployerId IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      WITH planCount AS(
         SELECT planId,
            COUNT(DISTINCT employeeId) eeCount,
            SUM(CASE WHEN employeeId<>memberId THEN 1 ELSE 0 END) depCount
         FROM memberPlan
         WHERE employerId = pEmployerId AND
            TRUNC(SYSDATE) BETWEEN effectiveDate AND NVL(expiryDate,'31-DEC-9999')
         GROUP BY planId)
      SELECT p.planName,
         pt.description,
         pc.eeCount,
         pc.depCount
      FROM employerPlans ep
      LEFT JOIN web_renewalPlans rp ON
         ep.planId=rp.planId AND
         rp.cart=pCartId
      JOIN plans p ON
         ep.planId=p.planId
      JOIN planType pt ON
         p.planTypeId=pt.planTypeId
      JOIN planCount pc ON
         ep.planId=pc.planId
      WHERE ep.employerId=pEmployerId AND
         TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate,'31-dec-9999') AND
         rp.planId IS NULL AND
         p.carrierId>0
      ORDER BY p.planTypeId;
END;
/
