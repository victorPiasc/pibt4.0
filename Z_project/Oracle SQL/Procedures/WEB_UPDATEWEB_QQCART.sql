CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_updateWeb_QQCart (
   pRowid VARCHAR2,
   pName VARCHAR2,
   pMale CHAR,
   pBirthdate DATE)
AS
BEGIN
   FOR rec IN (
      SELECT *
      FROM web_qqCart
      WHERE ROWID=pRowId)
   LOOP 
      UPDATE WEB_QQCart
      SET employeeName=pName, 
         MALE = pMale,
         BIRTHDATE = pBirthdate
      WHERE cart=rec.cart AND 
         familyId=rec.familyId AND
         employeeName=rec.employeeName AND 
         employeeType=rec.employeeType AND 
         birthdate =rec.birthdate;
   END LOOP;
   COMMIT;
END;
/
