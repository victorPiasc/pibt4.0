CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_oeTotalCost (
   pOeId IN VARCHAR2,
   pTotal OUT NUMBER)
AS
BEGIN
   SELECT SUM(DISTINCT efp.price) INTO pTotal
   FROM web_enrollerFormPlans efp
   JOIN plans p ON 
      efp.planId=p.planId AND 
      p.planTypeId<>6 
   WHERE oeId=pOeId AND 
      NVL(treasonId,0)=0;
END;
/
