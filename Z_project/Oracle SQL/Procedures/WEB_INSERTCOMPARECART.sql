CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTCOMPARECART" (
    pCartId IN NUMBER,
    pPlanId IN NUMBER)
AS
BEGIN
   INSERT INTO web_qqCompareCart
      SELECT planid,
         planTypeId,
         pCartId
      FROM plans
      WHERE planId=pPlanId;
   COMMIT;
END;
/
