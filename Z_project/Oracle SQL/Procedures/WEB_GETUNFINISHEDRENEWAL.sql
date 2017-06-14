CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETUNFINISHEDRENEWAL" (
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
   vDate DATE;
BEGIN

   SELECT ADD_MONTHS(NVL(oe2.oeFromMonth, oe1.oeFromMonth),-2) INTO vDate
   FROM oe_window oe1
   LEFT JOIN oe_window oe2 ON
      oe2.employerId=pEmployerId
   WHERE oe1.employerId=0;

   OPEN v_refcur FOR
      SELECT *
      FROM web_renewal
      WHERE employerId = pEmployerId AND
         isComplete='N' AND
         TRUNC(renewalDate) BETWEEN vDate AND TRUNC(SYSDATE);
END;
/
