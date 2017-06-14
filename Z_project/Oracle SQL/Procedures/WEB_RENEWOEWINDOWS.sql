CREATE OR REPLACE PROCEDURE Web_RenewOEWindows(pUpdatedBy IN VARCHAR2) AS
BEGIN
   UPDATE oe_window
      SET oeFromMonth = ADD_MONTHS(oeFromMonth,12),
         oeToMonth = ADD_MONTHS(oeToMonth,12),
         planEffectiveDate = ADD_MONTHS(planEffectiveDate,12)
      WHERE LAST_DAY(oeToMonth)<TRUNC(SYSDATE);
   COMMIT;
END;
/