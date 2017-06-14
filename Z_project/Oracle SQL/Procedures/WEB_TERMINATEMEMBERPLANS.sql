CREATE OR REPLACE PROCEDURE web_terminateMemberPlans(
  pOeId IN VARCHAR2,
  pUpdatedBy IN VARCHAR2)
AS
BEGIN
   UPDATE web_oe SET status=1 WHERE id=pOeId;
   
   FOR rec IN (
      SELECT memberPlanId, 
         expiryDate, 
         treasonId
      FROM web_enrollerFormPlans
      WHERE oeId=pOeId)
   LOOP
      UPDATE memberPlan 
      SET expiryDate=rec.expiryDate,
         treasonId=rec.treasonId, 
         updatedBy=pUpdatedBy,
         updated=SYSDATE
      WHERE memberPlanId=rec.memberPlanId;
   END LOOP;
  COMMIT;
END;
/
