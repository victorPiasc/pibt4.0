CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_UPDATEOFBASE" (
   pCartId NUMBER,
   pOfBase VARCHAR2)
AS
BEGIN
   UPDATE web_qqEmployerPlanType
      SET ofBase = pOfBase
      WHERE cart=pCartId;
      
   UPDATE web_qqEmployer
      SET ofBase = pOfBase
      WHERE cart=pCartId;      
   COMMIT;
END;
/
