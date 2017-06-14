CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETPLANTYPES" (
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT pt.planTypeId,
         MAX(pt.description) description
      FROM web_erCurrentPlans_V we
      JOIN planType pt on
         we.planTypeId = pt.planTypeId AND 
         pt.planTypeId NOT IN (5,7,9)
      WHERE employerId= pEmployerId
      GROUP BY pt.planTypeId
      ORDER BY MAX(pt.sortSeq);
End;
/
