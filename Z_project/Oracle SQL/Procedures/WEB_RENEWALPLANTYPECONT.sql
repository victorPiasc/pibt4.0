CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_RENEWALPLANTYPECONT" (
   pcartId  IN  NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT contribution,
         contributionDep
      FROM web_qqEmployerPlanType
      WHERE cart=pCartId AND
         planTypeId IN (1,2,3,4,8)
      ORDER BY plantypeId;
END;
/
