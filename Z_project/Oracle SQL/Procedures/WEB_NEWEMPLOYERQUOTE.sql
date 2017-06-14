CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_newEmployerQuote(
   pCartId NUMBER, 
   pEmployerId VARCHAR2)
AS 
   vNbrEmployees INTEGER;
BEGIN
   SELECT nbrEmployees INTO vNbrEmployees 
   FROM nbrEmpHist 
   WHERE employerId=pEmployerId;
   
   DELETE FROM web_qqCart WHERE cart=pCartId;
   COMMIT;
   FOR i IN 1..11 LOOP
      INSERT INTO web_qqCart( cart, employeeName, employeeTypeId, employeeType, 
         male, birthDate, createdDate, familyId, planTypeId)
      SELECT pCartId, 
         lastName||' '|| firstName, 
         employeeType,
         DECODE(employeeType, 0, 'Employee', 2, 'Child', 'Spouse/Domestic Partner'),
         male, 
         birthDate, 
         SYSDATE, 
         employeeId, 
         i
      FROM member 
      WHERE employerId=pEmployerId;                
   END LOOP;   
   COMMIT;
END;
/
