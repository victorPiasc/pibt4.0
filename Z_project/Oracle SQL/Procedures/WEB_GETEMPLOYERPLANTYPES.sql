CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETEMPLOYERPLANTYPES(
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN 
   OPEN v_refcur FOR
      SELECT DISTINCT p.plantypeid
      FROM employerPlans ep 
      JOIN plans p ON 
         ep.planId=p.planId 
      WHERE employerId=pEmployerId AND 
         TRUNC(SYSDATE) < NVL(ep.endDate,'31-dec-9999');
END;
/
