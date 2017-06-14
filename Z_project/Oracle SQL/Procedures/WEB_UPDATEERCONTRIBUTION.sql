CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_UPDATEERCONTRIBUTION" (
   pCartId          NUMBER,
   pContribution    NUMBER,
   pContributionDep NUMBER,
   pOfBase          CHAR)
AS
BEGIN
   UPDATE web_qqEmployer
      SET contribution = pContribution,
         contributionDep = pContributionDep,
         ofBase = pOfBase
      WHERE cart=pCartId;
   COMMIT;
END;
/
