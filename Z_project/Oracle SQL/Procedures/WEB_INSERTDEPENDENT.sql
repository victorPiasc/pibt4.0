CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTDEPENDENT" (
   pNewMemberId    VARCHAR2,
   pEmployeeId     VARCHAR2,
   pEmployerId     VARCHAR2,
   pLastName       VARCHAR2,
   pFirstName      VARCHAR2,
   pMiddleName     VARCHAR2,
   pEmployeeType   VARCHAR2,
   pMale           VARCHAR2,
   pSocsecNbr      VARCHAR2,
   pBirthDate      DATE,
   pMarriageDate   DATE,
   pAddressOne     VARCHAR2,
   pCity           VARCHAR2,
   pState          VARCHAR2,
   pZip            VARCHAR2,
   pMobilePhoneNbr VARCHAR2,
   pHomePhoneNbr   VARCHAR2,
   pWorkPhoneNbr   VARCHAR2,
   pEmailAddress   VARCHAR2,
   pHandicapped    VARCHAR2,
   pAdoptionDate   DATE,
   pUpdatedby      VARCHAR2)
AS
   pMaritalstatusId INTEGER DEFAULT 0;
   pDeptId          INTEGER;
BEGIN
   IF pEmployeeType=1 THEN
      UPDATE member
         SET marriageDate = pMarriageDate,
            maritalstatusId = 1
         WHERE memberid=pEmployeeId;
      pMaritalstatusId := 1;
   END IF;

   SELECT deptId INTO pDeptId FROM member WHERE memberid=pEmployeeId;

   INSERT INTO member(memberId, employeeId, employerId, lastName, firstName, middlename, employeeType, male, socSecNbr, birthdate, marriageDate, addressOne,
         city, state, zip, mobilePhoneNbr, homePhoneNbr, workPhoneNbr, emailAddress, handicapped, suppressWarnings, medicare, medicaretype, maritalstatusId,
         deptId, adoptionDate, updatedby, updated)
      VALUES(pNewMemberId, pEmployeeId, pEmployerId, pLastName, pFirstName, pMiddlename, pEmployeeType, pMale, pSocSecNbr, pBirthdate,
         pMarriageDate, pAddressOne, pCity, pState, pZip, pMobilePhoneNbr, pHomePhoneNbr, pWorkPhoneNbr, pEmailAddress, pHandicapped, 'N',
         'N', 'N', pMaritalstatusId, pDeptId, pAdoptionDate, pUpdatedby, SYSDATE);
   COMMIT;
END;
/
