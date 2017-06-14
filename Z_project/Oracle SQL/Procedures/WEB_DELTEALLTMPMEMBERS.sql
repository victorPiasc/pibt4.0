CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_deleteAllTmpMembers(
   pEmployerId VARCHAR2)
AS
BEGIN 
   DELETE FROM member 
   WHERE employerId=pEmployerId;
   COMMIT;
END;
/
