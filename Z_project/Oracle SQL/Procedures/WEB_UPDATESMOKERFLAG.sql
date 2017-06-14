CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_updateSmokerFlag(
   pMemberId IN VARCHAR2, 
   pFlag IN CHAR)
AS 
BEGIN 
   UPDATE member 
   SET smoker=pFlag
   WHERE memberId=pMemberId;
   COMMIT;  
END;
/