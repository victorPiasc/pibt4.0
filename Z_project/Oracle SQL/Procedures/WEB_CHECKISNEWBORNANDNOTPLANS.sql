CREATE OR REPLACE PROCEDURE web_checkIsNewBornAndNotPlans (
   pEmployeeId IN VARCHAR2,
   v_return OUT VARCHAR2)
AS
   varCount INTEGER;
BEGIN
   SELECT COUNT(1) INTO varCount
   FROM member m
   WHERE m.employeeId=pEmployeeId AND
      m.employeeType=2 AND
      m.birthDate >= TRUNC(SYSDATE)- 30 AND
      memberId NOT IN
      (  SELECT memberId
         FROM memberPlan mp
         WHERE m.employeeId= mp.employeeId AND
            m.memberId=mp.memberId);
    v_return:=CASE WHEN varCount>0 THEN'true'ELSE 'false' END;
END;
/
