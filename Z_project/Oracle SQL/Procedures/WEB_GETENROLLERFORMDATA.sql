CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getEnrollerFormData(
   pOeId IN VARCHAR2,
   pNotIncludeTerminate IN NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   IF pNotIncludeTerminate = 0 THEN
      OPEN v_refcur FOR
         SELECT id,
            oep.employeeId,
            oep.memberId,
            m.lastName||', '|| m.firstName||' '|| m.middleName name,
            m.employeeType,
            DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child',3,'Domestic Partner',' ') type,
            DECODE(m.male,'Y','Male','Female') gender,
            oep.planId,
            p.planName,
            oep.effectiveDate,
            oep.expiryDate,
            pt.planTypeId
         FROM web_enrollerFormPlans oep
         LEFT JOIN plans p ON 
            oep.planId = p.planId
         LEFT JOIN member m ON
            oep.memberId = m.memberId
         LEFT JOIN plantype pt ON
            p.planTypeId = pt.planTypeID
         WHERE oeid = pOeId 
         ORDER BY oep.memberId, oep.planid;    
   ELSE
      OPEN v_refcur FOR
         SELECT id,
            oep.employeeId,
            oep.memberId,
            m.lastName||', '|| m.firstName||' '|| m.middleName name,
            m.employeeType,
            DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child',3,'Domestic Partner',' ') type,
            DECODE(m.male,'Y','Male','Female') gender,
            oep.planId,
            p.planName,
            oep.effectiveDate,
            oep.expiryDate,
            pt.planTypeId
         FROM web_enrollerFormPlans oep
         LEFT JOIN plans p ON
            oep.planId = p.planId
         LEFT JOIN member m ON
            oep.memberId = m.memberId
         LEFT JOIN plantype pt ON
            p.planTypeId = pt.planTypeID
         WHERE Oeid = Poeid AND 
            NVL(oep.treasonid, 0) = 0
         ORDER BY oep.memberId, oep.Planid;
   END IF;
END;
/
