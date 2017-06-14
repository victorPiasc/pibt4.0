CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getOeTerminatePlans(
  pOeId IN VARCHAR2,
  v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT DISTINCT oep.employeeId,
         oep.memberId,
         m.lastName||', '|| m.firstName||' '|| m.middleName name,
         DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') type,
         DECODE(m.male,'Y','Male','Female') Gender,
         oep.planId,
         p.planName,
         oep.effectiveDate,
         oep.expiryDate
      FROM web_enrollerFormPlans oep
      JOIN plans p ON 
         oep.planId=p.planId
      JOIN member m ON
         oep.memberId=m.memberid
      WHERE Oeid=pOeId AND 
         oep.treasonId IS NOT NULL
      ORDER BY 3,7;
END;
/
