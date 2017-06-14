CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTOEBENEFICIARY" (
   pMemberId VARCHAR2,
   pPlanTypeId VARCHAR2,
   pFirstName VARCHAR2,
   pMiddleName VARCHAR2,
   pLastName VARCHAR2,
   pAddress VARCHAR2,
   pCity VARCHAR2,
   pState VARCHAR2,
   pZip VARCHAR2,
   pPercentage VARCHAR2,
   pSSN VARCHAR2,
   pUpdatedBy VARCHAR2,
   pRelationshipId VARCHAR2)
AS
BEGIN
   INSERT INTO beneficiaries (memberId, planTypeId, firstname, middleInitial,
      lastName , address, city, state, zip, percentage, socsecnbr, updated, updatedBy, relationshipId,pk)
   VALUES ( pMemberId, pPlanTypeId, pFirstName, pMiddleName, pLastName, pAddress, pCity, pState,
       pZip, pPercentage, pSSN, SYSDATE, pUpdatedBy, pRelationshipId, beneficiary_seq.NEXTVAL );
    COMMIT;
END;
/
