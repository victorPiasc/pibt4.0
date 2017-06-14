CREATE OR REPLACE PROCEDURE web_bsCheck(
   pEmployerId IN  NUMBER,
   pPlanId     IN  NUMBER,
   pEffective  IN  DATE,
   pValid      OUT VARCHAR2) AS
BEGIN
   SELECT CASE WHEN COUNT(*)>0 THEN 'N' ELSE 'Y' END INTO pValid
      FROM employer e
      JOIN plans p ON
         p.planId=pPlanId AND
         p.carrierId=4 AND -- Blue Shield 
         p.isMetal='Y'
      LEFT JOIN region r ON
         r.carrierId=4 AND
         r.side='P' AND
         p.subPlanTypeId=r.subPlanTypeId AND
         pEffective BETWEEN r.effective AND NVL(r.expiry,'31-Dec-9999') AND
         e.zip=r.zip
      WHERE e.employerId=pEmployerId AND
         r.carrierId IS NULL;
END;