CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CHECKEXISTINGBE" (
   pBrokerId IN VARCHAR2,
   pEmployerId IN VARCHAR,
   pStart IN DATE,
   pEnd IN DATE,
   pCount OUT NUMBER)
AS
BEGIN
   SELECT COUNT(*) INTO pCount
   FROM brokerEmployer
   WHERE pEmployerId = employerId AND      
      pStart <= NVL(expiry, '31-DEC-9999') AND
      NVL(pEnd, '31-DEC-9999') >= effective;
END;
/
