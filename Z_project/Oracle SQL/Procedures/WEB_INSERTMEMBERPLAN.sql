CREATE OR REPLACE PROCEDURE WEB_INSERTMEMBERPLAN (
   pMemberId IN VARCHAR2,
   pEmployeeId IN NUMBER,
   pPlanId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pEnteredDate IN DATE,
   pEffectiveDate IN DATE,
   pExpirydate IN DATE,
   pPlanOffice1 IN VARCHAR2,
   pPlanOffice2 IN VARCHAR2,
   pPlanOffice3 IN VARCHAR2,
   pInsuranceAmount IN VARCHAR2,
   pUpdatedBy IN VARCHAR2,
   pMemberPlanId OUT NUMBER)
AS
BEGIN
   SELECT memberPlan_Seq.Nextval INTO pMemberPlanId FROM dual;

   INSERT INTO memberPlan(memberPlanId, memberId, employeeId, planId, employerId, enteredDate, effectiveDate, expiryDate,
      planOffice1, planOffice2, planOffice3, insuranceAmount, updated, updatedBy)
   VALUES(pMemberPlanId, pMemberId, pEmployeeId, pPlanId, pEmployerId, pEnteredDate, pEffectiveDate, pExpiryDate, pPlanOffice1,
         pPlanOffice2, pPlanOffice3, pInsuranceAmount, SYSDATE, pUpdatedBy);
   COMMIT;
END;
/
