CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTQQEMPLOYERPLANTYPE" (
    pCartId          NUMBER,
    pPlantypeId      NUMBER,
    pContribution    NUMBER,
    pContributionDep NUMBER,
    pOfBase          CHAR)
AS
BEGIN
   UPDATE web_qqEmployerPlanType
      SET contribution = pContribution,
         contributionDep = pContributionDep,
         ofBase = pOfBase
      WHERE planTypeId=pPlantypeId AND
         cart=pCartId;
   IF SQL%ROWCOUNT = 0  THEN
       INSERT INTO web_qqEmployerPlanType VALUES(pPlantypeId, pContribution, pContributionDep, pOfBase, NULL, pCartId);
   END IF;
   COMMIT;
END;
/
