CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_insertRegistrationLink(
   pUniqueLink CHAR, 
   pEmployeeId VARCHAR2)
AS
BEGIN 
   UPDATE member
   SET uniqueLink=pUniqueLink
   WHERE memberId=pEmployeeId; 
   COMMIT;
END;
/
