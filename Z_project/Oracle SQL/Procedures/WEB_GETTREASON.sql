CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getTReason(
  pSpecialReasonId IN VARCHAR2,
  v_refcur OUT SYS_REFCURSOR) 
AS
BEGIN
   IF pSpecialReasonId=6 THEN
      OPEN v_refcur FOR
         SELECT
            treasonId,
            Decode(Treasonid,
                   30,'Employee Termination Reason: ' || Reason,
                   31,'Employee Termination Reason: ' || Reason,
                   32,'Employee Termination Reason: ' || Reason) Reason
          FROM treason
          WHERE treasonId IN(30,31,32);
   ELSE
      OPEN v_refcur For
         SELECT
            treasonId,
            Decode(Treasonid,
                    6,'Plan Termination Reason: ' || Reason,
                    7,'Plan Termination Reason: ' || Reason,
                    8,'Plan Termination Reason: ' || Reason,
                    9,'Plan Termination Reason: ' || Reason,
                   15,'Plan Termination Reason: ' || Reason,
                   16,'Plan Termination Reason: ' || Reason,
                   19,'Plan Termination Reason: ' || Reason) Reason
          FROM treason
          WHERE treasonId IN(6,7,8,9,15,16,19);
   END IF;
END;
/
