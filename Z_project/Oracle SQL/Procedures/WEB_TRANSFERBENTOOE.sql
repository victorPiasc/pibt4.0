CREATE OR REPLACE PROCEDURE web_transferBenToOe(
   pOeId IN VARCHAR2,
   pMemberId IN VARCHAR2, 
   pPlanTypeId IN NUMBER)
AS 
BEGIN 
   DELETE FROM web_OeBeneficiaries
   WHERE oeId=pOeId;
   --NO COMMIT

   INSERT INTO web_OeBeneficiaries
   SELECT pOeId,
      b.*
   FROM beneficiaries b 
   WHERE memberId=pMemberId AND
      planTypeId=pPlanTypeId; 
   COMMIT;      
END;