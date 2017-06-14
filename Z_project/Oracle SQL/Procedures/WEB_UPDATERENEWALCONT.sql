CREATE OR REPLACE PROCEDURE web_updateRenewalCont(
   pRenewalId VARCHAR2, 
   pState NUMBER,
   pContributionType NUMBER)
AS
BEGIN 
   UPDATE web_renewal 
   SET state = pState,
      contributionTypeId = pContributionType
   WHERE renewalId = pRenewalId;
   COMMIT;
END;