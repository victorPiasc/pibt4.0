CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CHECKOEBYERID"
(
   pEmployerId in  Number,
   v_return    OUT varchar2
)
AS
   varCount number(2);
BEGIN
   SELECT
         COUNT(1) INTO Varcount
      FROM Oe_Window
      WHERE
         (employerid=pEmployerId or employerid=0) AND
         TRUNC(SYSDATE) BETWEEN oeFromMonth AND oeToMonth;

   IF Varcount= 0 THEN
      V_Return:='false';
   ELSE
      V_Return:='true';
   END IF;
END;
/