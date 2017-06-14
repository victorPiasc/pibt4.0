CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_OE_Enddate(
   pEmployerId IN VARCHAR2, 
   pDate OUT DATE)
AS
BEGIN 
   SELECT GREATEST (
      NVL(oe2.oeToMonth, oe1.oeToMonth)+1,
      SYSDATE) INTO pDate
   FROM oe_window oe1 
   LEFT JOIN oe_window oe2 ON 
      oe2.employerId=pEmployerId
   WHERE oe1.employerId=0;    
END;
/
