CREATE OR REPLACE PROCEDURE web_updateRenewal(
   pRenewalId VARCHAR2,
   pState NUMBER,
   pIsPercent CHAR,
   pIsOverall CHAR)
AS
BEGIN 
   UPDATE web_renewal
   SET state=pState,
      isPercent = pIsPercent,
      isOverall = pIsOverall
   WHERE renewalId=pRenewalId;
   COMMIT;
End;