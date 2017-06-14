CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_updatePlansAddl (
   pMemberId VARCHAR2,
   pPlanId VARCHAR2,
   pOeId VARCHAR2,
   pInsuranceAmount VARCHAR2)
AS
BEGIN
   UPDATE web_enrollerFormPlans
      SET insuranceAmount=pInsuranceamount
      WHERE oeId=pOeId AND
         planId=pPlanId AND 
         memberId=pMemberId;
   COMMIT;
END;
/
