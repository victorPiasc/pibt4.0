CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_checkMissingInfo(
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS 
BEGIN 
   OPEN v_refcur FOR 
   SELECT memberId, 
      firstName||' '||lastName name
   FROM member
   WHERE employerId=pEmployerId AND 
      (  socSecNbr IS NULL OR
         employeeType=0  AND 
		 (emailAddress IS NULL OR hoursWorked IS NULL));
END;
/
