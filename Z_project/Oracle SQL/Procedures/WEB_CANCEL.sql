CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CANCELBEN" (
   pOeId IN VARCHAR2,
   pMemberId IN VARCHAR2,
   pPlanTypeId IN NUMBER)
AS
BEGIN
   DELETE FROM beneficiaries
   WHERE memberId=pMemberId AND
      planTypeId=pPlanTypeId;
   COMMIT;

   INSERT INTO beneficiaries
   SELECT memberId,
      planTypeId,
      firstName,
      middleInitial,
      lastName,
      address,
      city,
      state,
      zip,
      percentage,
      socSecNbr,
      updated,
      updatedBy,
      relationShipId,
      beneficiary_seq.NEXTVAL
   FROM web_oeBeneficiaries
   WHERE oeId=pOeId AND
      memberId=pMemberId AND
      planTypeId=pPlanTypeId;
   COMMIT;
END;
/
