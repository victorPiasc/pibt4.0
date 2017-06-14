CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETOEADDITIONALINFO(
   pOeId    IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT id,
         oeId,
         memberId,
         memberName name,
         planName,
         CASE WHEN carrierId>0 THEN insuranceAmount END insuranceAmount
      FROM web_enrollerFormPlans_v
      WHERE oeId=pOeId AND
         planTypeId IN (5,6,7,10,11) AND
         NVL(treasonId,0)=0
      ORDER BY employeeId, name;
END;
/
