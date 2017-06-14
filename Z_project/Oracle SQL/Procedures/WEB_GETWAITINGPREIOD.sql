CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getWaitingPreiod(
   v_refcur OUT SYS_REFCURSOR )
AS
BEGIN
   OPEN v_refcur FOR
      SELECT WaitingPeriodId,
         Description
      FROM waitingPeriod;
END;
/
