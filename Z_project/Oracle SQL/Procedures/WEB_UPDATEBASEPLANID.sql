CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_UPDATEBASEPLANID" (
   pCartId     NUMBER,
   pPlanId     VARCHAR2,
   pPlanTypeId VARCHAR2)
AS
BEGIN
   UPDATE web_qqEmployerPlanType
      SET basePlanId = pPlanId
      WHERE cart=pCartId AND
         planTypeId=pPlanTypeId;
   IF SQL%ROWCOUNT = 0 THEN
      INSERT INTO web_qqEmployerPlanType(cart, planTypeId, ofBase, basePlanId)
         VALUES (pCartId, pPlanTypeId,'N', pPlanId);
   END IF;
   COMMIT;
END;
/
