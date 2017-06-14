CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getOeEffectiveDate(
   pOeId IN VARCHAR2,
   pDate OUT DATE)
AS
   vOeType INTEGER;
   vEmployeeId INTEGER;
   vEmployerId INTEGER;
   vMemberId INTEGER;
BEGIN 
   SELECT typeId, memberId, EmployerId
   INTO vOeType, vEmployeeId, vEmployerId
   FROM web_Oe
   WHERE id=pOeId;
         
   IF vOeType IN (2,5) THEN 
      SELECT MAX(memberId) INTO vMemberId 
      FROM member WHERE 
         employeeId=vEmployeeId AND
         (  vOeType=2 AND fn_checkisnewbornandnotplans(memberId)='true' OR 
            vOeType=5 AND fn_checkIsNewMarryAndNotPlans(memberId)='true');
   END IF;      
   pDate:= fn_oePlanEffectiveDate(NVL(vMemberId,vEmployeeId), vEmployerId,vOeType);
END;
/
