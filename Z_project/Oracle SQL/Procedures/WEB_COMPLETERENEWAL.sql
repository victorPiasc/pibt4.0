CREATE OR REPLACE PROCEDURE web_completeRenewal(
   pRenewalId VARCHAR2,
   pState NUMBER,
   pIsComplete VARCHAR2)
AS
BEGIN 
   UPDATE web_renewal 
   SET state=pState, 
      isComplete=pIsComplete
   WHERE renewalId=pRenewalId;
END;