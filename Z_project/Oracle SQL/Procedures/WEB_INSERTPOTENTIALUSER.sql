CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_insertPotentialUser(
   pCart IN NUMBER,    
   pCode IN VARCHAR2,
   pEmail IN VARCHAR2,
   pCount OUT NUMBER)
AS
BEGIN
   UPDATE web_qqEmployer 
   SET validationCode=pCode, 
      email = pEmail  
   WHERE cart=pCart AND
      validationCode IS NULL;

   pCount:= SQL%ROWCOUNT;
   COMMIT;
END;
/
