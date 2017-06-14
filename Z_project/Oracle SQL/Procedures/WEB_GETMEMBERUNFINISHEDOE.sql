CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getMemberUnfinishedOe (
   pEmployeeId IN VARCHAR2,
   pOeId OUT NUMBER)
AS
BEGIN
   SELECT MAX(id) INTO pOeId
   FROM web_oe 
   WHERE memberId = pEmployeeId AND
      TRUNC(SYSDATE) - TRUNC(created) <= 30 AND
      NVL(status,0) = 0;
END;
/
