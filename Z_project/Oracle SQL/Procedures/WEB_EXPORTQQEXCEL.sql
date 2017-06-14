CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_EXPORTQQEXCEL" (
   pCartId  IN  NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT familyId,
         employeeName,
         employeeType,
         planName,
         rates,
         depRates,
         birthdate,
         age
      FROM findWebRatesReport
      WHERE cart=pCartId
      ORDER BY 1,employeeTypeId,7,2,planTypeId, carrierId, planId;
END;
/
