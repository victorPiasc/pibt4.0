CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETOEENROLLERS" (
   pEmployeeId IN  VARCHAR2,
   pOeTypeId   IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   IF pOeTypeId=1 OR pOeTypeId=4 THEN -- new hire or open enrollment
      OPEN v_refcur FOR
         SELECT m.memberId,
            m.firstname||' '||m.middleName||' '|| m.lastname name,
            m.employeeType employeeTypeId,
            DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') employeeType
         FROM member ee
         JOIN member m ON
            ee.memberId = m.employeeId
         WHERE ee.memberId = pEmployeeId AND
            (ee.memberId = m.memberId OR
            m.employeeType = 1 AND m.marriageDate= ee.marriageDate OR
            m.employeeType = 2 AND TRUNC(SYSDATE)-m.birthdate < 9490)
         ORDER BY m.employeeType;
   ELSIF pOeTypeId=2 THEN -- new born
      OPEN v_refcur FOR
         SELECT memberId,
            firstName||' '||middleName ||' '||lastName name,
            employeeType employeeTypeId,
            'Child' employeeType
         FROM member
         WHERE employeeId = pEmployeeId AND
            memberId <> employeeId AND
            employeeType = 2 AND
            fn_checkisnewbornandnotplans(memberId)='true';
   ELSIF pOeTypeId=5 THEN -- new marry
      OPEN v_refcur FOR
         SELECT memberId,
            firstName||' '||middleName ||' '|| lastName name,
            employeeType employeeTypeId,
            DECODE(employeeType,1,'Spouse','Domestic Partner') employeeType
         FROM member
         WHERE employeeId = pEmployeeId AND
            employeeId <> memberId AND
            employeeType IN (1,3) AND
            fn_checkIsNewMarryAndNotPlans(memberId)='true';
   ELSE -- Only Employee
      OPEN v_refcur FOR
         SELECT memberID,
            firstName||' '||middleName ||' '||lastName name,
            employeeType employeeTypeId,
            'Employee' employeeType
         FROM member
         WHERE memberId = pEmployeeId;
   END IF;
END;
/
