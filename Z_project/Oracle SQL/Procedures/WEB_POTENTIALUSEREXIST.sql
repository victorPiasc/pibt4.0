CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_potentialUserExist(
   pCode IN VARCHAR2,
   pResult OUT NUMBER)
AS 
BEGIN
    SELECT cart INTO pResult
    FROM web_qqEmployer 
    WHERE validationCode=pCode;
END;
/

