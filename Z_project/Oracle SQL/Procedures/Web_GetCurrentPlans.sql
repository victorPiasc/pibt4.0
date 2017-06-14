CREATE OR REPLACE PROCEDURE PIA_ADMIN.Web_GetCurrentPlans(
   pPlanTypeId IN  VARCHAR2,
   pEmployerId IN  VARCHAR2,
   pMemberid   IN  VARCHAR2,
   pWebRoleId  IN  NUMBER,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   IF pWebRoleId NOT IN(5,6) THEN
      OPEN v_refcur FOR 
          SELECT *
          FROM web_erCurrentPlans_V
          WHERE employerId=pEmployerid AND
             planTypeId=pPlanTypeId AND
             carrierId <>0;
   ELSE
      OPEN v_refcur FOR
      SELECT DISTINCT wv.carrierName,
         wv.employerId,
         wv.monthIn,
         wv.planId,
         wv.plantypeid,
         wv.planName
      FROM web_eeCurrentPlans_V wv
      JOIN plans p ON
         p.planid = wv.planid 
      WHERE wv.memberId=pMemberid AND
         wv.planTypeId=pPlanTypeId AND
         p.carrierId <>0;
   END IF;
END;
/
