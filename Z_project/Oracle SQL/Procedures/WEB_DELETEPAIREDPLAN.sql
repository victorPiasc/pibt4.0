CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_DELETEPAIREDPLAN" (
   pCartId IN NUMBER,
   pPlanId IN VARCHAR2)
AS
BEGIN
   DELETE FROM web_renewalPlans
      WHERE cart=pCartId AND
         planId IN (
            SELECT planIdTwo
            FROM pairedPlans
            WHERE planIdOne=pPlanId);
   COMMIT;
END;
/
