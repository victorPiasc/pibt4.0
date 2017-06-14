CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getSingleBeneficiary(
   pRId IN VARCHAR2, 
   v_refcur OUT SYS_REFCURSOR)
AS 
BEGIN 
   OPEN v_refcur FOR 
      SELECT firstName,  
         middleInitial, 
         lastName,
         socSecNbr,
         address,
         city, 
         state, 
         zip,
         relationshipId, 
         percentage
      FROM beneficiaries 
      WHERE ROWID=pRId;
END;
/
