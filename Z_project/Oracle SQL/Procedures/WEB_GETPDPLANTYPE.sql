CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETPDPLANTYPE" (
   pCartId  IN  NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT pt.description,
          MAX(p.planTypeID) plantypeID
      FROM web_qqCompareCart wcc
      JOIN plans p ON
         wcc.planId=p.planId
      JOIN plantype pt ON
         p.planTypeId=pt.planTypeId
      WHERE wcc.cart=pCartId
      GROUP BY pt.description
      ORDER BY MAX(pt.sortSeq);
END;
/
