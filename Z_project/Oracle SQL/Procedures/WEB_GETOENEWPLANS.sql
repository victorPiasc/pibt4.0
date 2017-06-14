CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getOeNewPlans(
   pOeId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT oep.employeeId, 
         oep.memberId, 
         m.firstName||' '||m.lastName name, 
         DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') type,
         DECODE(m.male,'Y','Male','Female') Gender,
         oep.planId,
         p.planName,
         oep.effectiveDate,
         oep.expiryDate
      FROM web_enrollerFormPlans oep
      JOIN plans p ON       
         oep.planid=p.planId
      JOIN member m ON
         oep.memberId=m.memberId
      WHERE oep.oeId=pOeId AND
         NVL(oep.treasonId,0)=0
      ORDER BY m.lastName, m.firstName,p.planName;
END;
/
