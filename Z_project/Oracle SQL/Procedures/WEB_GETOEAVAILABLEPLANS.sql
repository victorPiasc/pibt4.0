CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETOEAVAILABLEPLANS" (
   pOeId IN VARCHAR2,
   pOeType IN NUMBER,
   pTerm IN CHAR,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      WITH vtlPrice AS (
         SELECT efp.planId, 
            SUM(efp.price*
               CASE WHEN m.employeeType=2 THEN CASE WHEN efp.insuranceAmount=10000 THEN 2 ELSE 1 END 
               ELSE efp.insuranceAmount/1000 END) price      
         FROM web_enrollerFormPlans efp
         JOIN member m ON 
            efp.memberId=m.memberId
         JOIN plans p ON 
            efp.planId=p.planId AND 
            p.planTypeId=6 
         WHERE oeId=pOeId
         GROUP BY efp.planId)
      SELECT efp.planId,
         MAX(p.planName) planName,
         MAX(pt.description) planType,
         MAX(p.planTypeId) planTypeId,
         NVL(SUM(CASE WHEN m.employeeType=0 THEN 1 END),0) eeCount,
         NVL(SUM(CASE WHEN m.employeeType>0 THEN 1 END),0) depCount,
         CASE WHEN MAX(p.planTypeId)=6 THEN NVL(MAX(vp.price),0) ELSE MAX(efp.price) END price,      
         MAX(efp.effectivedate) effectiveDate,
         MAX(efp.expiryDate) expiryDate
      FROM web_enrollerFormPlans efp
      JOIN member m ON
         efp.memberId=m.memberId         
      JOIN plans p ON
         efp.planId=p.planId
      JOIN planType pt ON
         p.planTypeId=pt.planTypeId 
      LEFT JOIN vtlPrice vp ON 
         efp.planId=vp.planId                           
      WHERE oeId=pOeId AND
         (pTerm='N' AND NVL(efp.treasonId,0)=0 OR 
            pTerm='Y' AND NVL(efp.treasonId,0)<>0)
      GROUP BY efp.planId
      ORDER BY MAX(p.planTypeId);
END;
/
