CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_hasWebAccount(
   pUniqueLink IN CHAR,
   pCount OUT NUMBER)
AS 
BEGIN
   SELECT COUNT(*) INTO pCount 
   FROM member m 
   JOIN web_users wu ON
      m.employeeId=wu.employeeId
   WHERE m.uniqueLink=pUniqueLink AND 
      wu.webName IS NOT NULL;
END;
/