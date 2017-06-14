CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTMEMBER" (
   Pnewmemberid     Varchar2,
   pEmployerId      VARCHAR2,
   pLastName        VARCHAR2,
   pFirstName       VARCHAR2,
   pMiddleName      VARCHAR2,
   pEmployeeType    VARCHAR2,
   pMale            VARCHAR2,
   pSocsecNbr       VARCHAR2,
   pBirthDate       DATE,
   pMarriageDate    DATE,
   pHireDate        DATE,
   pAddressOne      VARCHAR2,
   pCity            VARCHAR2,
   pState           VARCHAR2,
   pZip             VARCHAR2,
   pMobilePhoneNbr  VARCHAR2,
   pHomePhoneNbr    VARCHAR2,
   pWorkPhoneNbr    VARCHAR2,
   pEmailAddress    VARCHAR2,
   pHandicapped     VARCHAR2,
   pMaritalstatusId VARCHAR2,
   pDeptId          NUMBER,
   pUpdatedBy       VARCHAR2,
   pSalaryPerPeriod NUMBER,
   pPeriodsPerYear  NUMBER,
   pHoursWorked     NUMBER,
   pSmoker          VARCHAR2)
AS
   vDeptId INTEGER;
BEGIN
   IF pDeptId IS NULL THEN --Only in the case of adding members via excel      
      SELECT deptId INTO vDeptId
      FROM department
      WHERE employerId=pEmployerId AND 
         deptCode=100;
      IF vDeptId IS NULL THEN 
         SELECT MIN(deptId) INTO vDeptId
         FROM department
         WHERE employerId=pEmployerId;
      END IF;                  
   END IF;

   INSERT INTO member(memberId, employeeId, employerId, lastName, firstName, middlename, employeeType, male, socsecNbr, birthDate,
         marriageDate, hireDate, addressOne, city, state, zip, mobilePhoneNbr, homePhoneNbr, workPhoneNbr, emailAddress, handicapped,
         suppressWarnings, medicare, medicaretype, maritalstatusId, deptId, updatedby, updated, salaryPerPeriod, periodsPerYear,
   hoursWorked, smoker)
      values(pNewMemberId, pNewMemberId, pEmployerId, pLastName, pFirstName, pMiddlename, pEmployeeType, pMale, pSocsecNbr,
         pBirthDate, pMarriageDate, pHireDate, pAddressOne, pCity, pState, pZip, pMobilePhoneNbr, pHomePhoneNbr, pWorkPhoneNbr, 
         pEmailAddress, pHandicapped, 'N', 'N', 'N', pMaritalstatusId, NVL(pDeptId,vDeptId), pUpdatedby, SYSDATE, pSalaryPerPeriod, 
         pPeriodsPerYear, pHoursWorked, pSmoker);
   COMMIT;
END;
/
