CREATE OR REPLACE FUNCTION renewalDate(
   startDate DATE)
RETURN DATE AS
   vDate DATE; 
BEGIN 
   vDate:= startDate;
   WHILE vDate < TRUNC(SYSDATE) LOOP
      vDate:= ADD_MONTHS(vDate, 12);
   END LOOP;
   RETURN vDate;
END;               
        