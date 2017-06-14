CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETBASEPLANID" (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  VARCHAR2,
   pPlanId     OUT NUMBER)
AS
BEGIN
   SELECT NVL(MAX(basePlanId),0) INTO pPlanId
      FROM web_qqEmployerPlanType
      WHERE cart=pCartId AND
         planTypeId=pPlanTypeId;
END;
/
