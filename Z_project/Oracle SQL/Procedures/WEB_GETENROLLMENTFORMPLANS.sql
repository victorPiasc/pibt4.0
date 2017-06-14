CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETENROLLMENTFORMPLANS" (
   pOeId IN VARCHAR2,
   pPlanTypeId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT id,
         oeid,
         oep.memberId,
         m.employeeType,
         memberName name,
         planName,
         planTypeId,
         planOffice1,
         planOffice2,
         planOffice3,
         insuranceAmount,
         expiryDate,
         memberPlanId,
         carrierId
      FROM web_enrollerFormPlans_v oep
      JOIN member m ON
         oep.memberId=m.memberId
      WHERE NVL(oep.treasonId,0)<>3 AND
         oeid=pOeId AND
         (  planTypeId=pPlanTypeId Or pPlanTypeId IS NULL) AND
         (  pPlanTypeId=1 AND oep.carrierId NOT IN(0,1) OR 
            pPlanTypeId<>1 AND oep.carrierId<>0)
      ORDER BY 4;
END;
/
