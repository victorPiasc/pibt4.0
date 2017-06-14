CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_COPYMEMBERPLANSTOOEPLANS" (
   pOeId IN VARCHAR2,
   pMemberPlanId IN VARCHAR2,
   pExpiryDate IN DATE,
   pTreasonId IN NUMBER,
   pUpdatedBy IN VARCHAR2)
AS
BEGIN
   UPDATE web_oe SET tReasonId=pTreasonId WHERE id=pOeId;

   INSERT INTO web_enrollerFormplans(id, oeId, employeeId, memberId, planId, effectiveDate, planOffice1, planOffice2, insuranceAmount, planOffice3,
      expiryDate, memberPlanId, tReasonId, updatedBy, updated)
      SELECT web_enrollerFormPlans_seq.NEXTVAL,
         pOeId,
         employeeId,
         memberId,
         planid,
         effectiveDate,
         planOffice1,
         planOffice2,
         insuranceAmount,
         planOffice3,
         pExpiryDate,
         memberPlanId,
         pTreasonId,
         pUpdatedBy,
         SYSDATE
      FROM memberPlanNoBogus
      WHERE memberPlanId=pMemberPlanId;
   COMMIT;
END;
/
