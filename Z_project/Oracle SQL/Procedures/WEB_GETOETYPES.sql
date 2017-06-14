CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETOETYPES(
  v_refcur OUt SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT Id,
         Description,
         Usage
      FROM Web_Oe_Types
      WHERE (Active=1)
      ORDER BY ID ASC;
END;
/
