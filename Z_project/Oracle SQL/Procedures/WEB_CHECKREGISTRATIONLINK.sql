CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_checkRegistrationLink(
   pUniqueLink IN CHAR,
   pCount OUT NUMBER)
AS
BEGIN
   SELECT COUNT(0) INTO pCount
   FROM member
   WHERE uniqueLink=pUniqueLink;
END;
/
