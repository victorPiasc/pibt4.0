CREATE OR REPLACE PROCEDURE web_getEmployeesByEnrollerId(
   pEnrollerID IN  VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT DISTINCT er.employerId,
         er.name,
         mp.employeeId,
         m.lastname,
         m.firstname
      FROM employer er
      JOIN memberPlan mp ON
         mp.employerId = er.employerId AND
         mp.employeeId = mp.memberId AND  -- get employee only
         TRUNC(SYSDATE) BETWEEN mp.effectiveDate and NVL(mp.expiryDate,'31-Dec-9999') 
      JOIN member m ON
         mp.employeeId = m.memberid
      WHERE TRUNC(SYSDATE) BETWEEN NVL(er.startDate,'01-JAN-0001') and NVL(er.endDate,'31-Dec-9999') AND
         er.enrollerid = pEnrollerID
      ORDER BY 1,4,5;
END;
/
