CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETPDNAMEFORREPORT" (
   pCartId     IN  NUMBER,
   pPlanTypeId IN  NUMBER,
   v_refCur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refCur FOR
      SELECT p.planName
      FROM web_qqCompareCart wcc
      JOIN plans p ON
         wcc.planId=p.planId
      JOIN carrier c ON
         p.carrierId=c.carrierId
      JOIN planType pt ON
         p.planTypeId=pt.planTypeId
      WHERE wcc.cart=pCartId AND
         p.planTypeId=pPlanTypeId
      ORDER BY pt.sortSeq, UPPER(c.name), UPPER(p.planName);
END;
/
