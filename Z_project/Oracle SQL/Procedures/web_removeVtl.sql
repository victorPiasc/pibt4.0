CREATE OR REPLACE PROCEDURE web_removeVtl(
   pMemberId VARCHAR2,
   pEmployeeId VARCHAR2,
   pEmployeeType VARCHAR2, 
   pOeId VARCHAR2)
AS
BEGIN

   --If employee is removed, then everyone is removed
   IF pMemberId=pEmployeeId THEN 
      DELETE FROM web_enrollerFormPlans 
      WHERE oeId=pOeId AND 
         planId IN (
            SELECT planId FROM plans WHERE planTypeId=6);
      COMMIT;            
      RETURN;            
   END IF;
   
   --Remove member with vtl where memberid matche
   DELETE FROM web_enrollerFormPlans 
   WHERE oeId=pOeId AND 
      memberId IN (
         SELECT dep.memberId 
         FROM member m 
         JOIN member dep ON 
            m.employeeId=dep.employeeId AND 
            dep.employeeType=pEmployeeType
         WHERE m.memberId=pMemberId) AND
      planId IN (
         SELECT planId FROM plans WHERE planTypeId=6);
   COMMIT;
END;               