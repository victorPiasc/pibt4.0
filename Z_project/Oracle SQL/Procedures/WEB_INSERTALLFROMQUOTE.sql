CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_insertAllFromQuote(
   pCart NUMBER, 
   pEmployerId VARCHAR2)
AS
   vEmployeeId INTEGER;
   vHasSpouse INTEGER;
   vDeptId INTEGER; 
BEGIN 

   SELECT deptId INTO vDeptId 
   FROM department 
   WHERE employerId=pEmployerId AND 
      deptCode = (SELECt MIN(deptCode) FROM department WHERE employerId=pEmployerId);
      
   FOR rec IN(
      SELECT SUBSTR(MAX(wc.employeeName), 1, INSTR(MAX(wc.employeeName),' ')-1) firstName, 
         REGEXP_REPLACE(SUBSTR(MAX(wc.employeeName), INSTR(MAX(wc.employeeName), ' ')+1),'[0-9]','') lastName, 
         MAX(wc.employeeTypeId) employeeType, 
         MAX(wc.male) male, 
         MAX(TRUNC(wc.birthdate)) birthdate, 
         MAX(we.zip) zip,
         familyId
      FROM web_qqcart wc
      JOIN web_qqEmployer we ON 
         wc.cart=we.cart
      WHERE wc.cart=pCart
      GROUP BY wc.familyId, wc.employeeTypeId 
      ORDER BY wc.familyId, wc.employeeTypeId)
   LOOP
      IF rec.employeeType=0 THEN 
         SELECT MEMBERID_SEQ.NEXTVAL INTO vEmployeeId FROM dual;
         
         SELECT COUNT(familyId) INTO vHasSpouse 
         FROM web_qqcart 
         WHERE cart=pCart AND 
            familyId=rec.familyId AND 
            employeeTypeId=1;            
      END IF;
      
      INSERT INTO member(employerId, memberId, employeeId, firstName, lastName, employeeType, zip, 
         maritalStatusId, marriageDate, hireDate, birthdate, updated, updatedBy, deptId, male)
         VALUES(pEmployerId,CASE WHEN rec.employeeType=0 THEN vEmployeeId ELSE MEMBERID_SEQ.NEXTVAL END,vEmployeeId,
            NVL(TRIM(rec.firstName),'firstName'),NVL(TRIM(rec.lastName),'lastName'), 
            rec.employeeType,rec.Zip,CASE WHEN rec.employeeType<2 AND vHasSpouse>0 THEN 1 ELSE 0 END,
            CASE WHEN rec.employeeType<2 AND vHasSpouse>0 THEN TRUNC(SYSDATE) END,
            CASE WHEN rec.employeeType=0 THEN TRUNC(SYSDATE) END,rec.birthDate,
            SYSDATE, pEmployerId,vDeptId, rec.male);   
   END LOOP;
   
   COMMIT;
END;
/
