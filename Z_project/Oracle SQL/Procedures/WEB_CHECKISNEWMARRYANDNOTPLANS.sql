CREATE OR REPLACE PROCEDURE web_checkIsNewMarryAndNotPlans (
   pEmployeeId IN VARCHAR2,
   v_return OUT VARCHAR2)
AS
   varCount NUMBER;
BEGIN
   SELECT COUNT(1) INTO varCount
   FROM member m
   WHERE m.employeeId=pEmployeeId AND
      m.employeeType IN (1,3) AND
      m.marriageDate >= TRUNC(SYSDATE)- 30 AND
      memberId NOT IN
      (  SELECT memberId
         FROM memberPlan mp
         WHERE m.employeeId= mp.employeeId AND
            m.memberId=mp.memberId);
    v_return:=CASE WHEN varCount>0 THEN 'true' ELSE 'false' END;
END;
/
