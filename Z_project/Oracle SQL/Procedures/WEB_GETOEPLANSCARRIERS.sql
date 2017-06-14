CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getOEPlansCarriers(
   pOeId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR )
AS
BEGIN
   OPEN v_refcur FOR
      SELECT DISTINCT p.carrierId 
      FROM web_enrollerFormPlans oep
      JOIN plans p ON
         oep.planId=p.planId  
      WHERE oep.oeId=pOeId
      ORDER BY 1;
END;
/
