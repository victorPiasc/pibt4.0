create or replace 
PROCEDURE WEB_DeleteOEPlansByOEID
(pOEID in VARCHAR2 )
 AS
BEGIN
   DELETE WEB_EnrollerFormPlans 
   WHERE oeId = pOEID;
    Commit;
END;