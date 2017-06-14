CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETEEAVALIBLEPLANSBYTYPE(
   pPlanTypeId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN v_refcur FOR
       SELECT carrierName, 
          employerId, 
          monthIn, 
          planId, 
          planTypeId, 
          planName,
          carrierId
       FROM web_erCurrentPlans_v
       WHERE employerId = pEmployerId AND
       planTypeId = pPlanTypeId;
end;
/




