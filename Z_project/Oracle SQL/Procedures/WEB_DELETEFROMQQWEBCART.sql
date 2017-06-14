CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_DELETEFROMQQWEBCART" (
   pRowId IN VARCHAR2,
   pTypeId IN VARCHAR2)
AS
BEGIN
   IF pTypeId>0 THEN
   --TODO change from cursor to select into
      FOR rec IN (
         SELECT *
         FROM web_qqCart
         WHERE ROWID=pRowId)
      LOOP 
         DELETE FROM WEB_QQCart      
         WHERE cart=rec.cart AND 
            familyId=rec.familyId AND 
            employeeName=rec.employeeName AND 
            employeeType=rec.employeeType AND 
            birthdate =rec.birthdate;                   
      END LOOP;
   ELSE
      DELETE FROM web_qqCart
      WHERE familyId = (
         SELECT familyId
            FROM web_qqCart
            WHERE ROWID=pRowId);
   END IF;
   COMMIT;
END;
/
