CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_RENEWALPERCENTCONT" (
   pcartId          IN  NUMBER,
   pContribution    OUT NUMBER,
   pContributionDep OUT NUMBER)
AS
BEGIN
   SELECT NVL(MAX(contribution),0),
         NVL(MAX(contributionDep),0)
      INTO pContribution, pContributionDep
      FROM web_qqEmployer
      WHERE cart=pCartId;
END;
/
