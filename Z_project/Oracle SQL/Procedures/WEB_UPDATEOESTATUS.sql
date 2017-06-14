CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_updateOEStatus(
  pOeId IN VARCHAR2,
  pStatus IN NUMBER,
  pUpdatedBy IN VARCHAR2,
  pIp IN VARCHAR2)
AS
BEGIN
  UPDATE web_Oe
    SET status=pStatus,
    updated = SYSDATE,
    updatedby= pUpdatedBy,
    updatedip = pIp
  WHERE id=pOeId;

   IF pStatus=1 THEN 
         web_approveEnrollmentFormPlans(pOeId,pUpdatedby);
   END IF;         
   COMMIT;
END;
/
