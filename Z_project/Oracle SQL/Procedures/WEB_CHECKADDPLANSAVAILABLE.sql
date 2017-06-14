CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_checkAddPlansAvailable(
   pEmployerId IN VARCHAR2,
   pHireDate IN VARCHAR2,
   v_return OUT VARCHAR2)
AS
vCount NUMBER;
BEGIN
   v_return := 'false';
   SELECT COUNT(1) INTO vCount
   FROM employer  er
   JOIN waitingPeriod wp ON 
      er.waitingPeriodId=wp.waitingPeriodId 
   WHERE employerId=pEmployerId AND
      (er.waitingPeriodId=6 OR TO_DATE(pHireDate,'mm/dd/RRRR') BETWEEN ADD_MONTHS(SYSDATE,-wp.months) AND ADD_MONTHS(SYSDATE,wp.months));
  IF vCount>0 THEN
     v_return := 'true';
  END IF;
END;
/