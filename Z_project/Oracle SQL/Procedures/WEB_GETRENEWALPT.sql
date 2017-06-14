CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETRENEWALPT" (
   pCartId  IN  NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT DISTINCT p.planTypeId
      FROM web_renewalPlans rp
      JOIN plans p ON
         rp.planId=p.planId AND 
         p.subplanTypeId <> 3 AND 
         p.planTypeId NOT IN (5,9)
      WHERE rp.cart=pCartId;
END;
/
