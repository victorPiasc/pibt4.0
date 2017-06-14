CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_RENEWALEEPLANNAMES" (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT DISTINCT s.planName,
         c.carrierId,
         c.name
      FROM webSubsidy s
      JOIN web_renewalPlans rp ON
         s.cart=rp.cart AND
         s.planId=rp.planId
      JOIN carrier c ON
         s.carrierId=c.carrierId
      WHERE s.cart=pCartId AND
         s.planTypeId=pPlanTypeId
      ORDER BY UPPER(c.name), UPPER(s.planName);
END;
/
