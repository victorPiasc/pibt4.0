CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_EMPLOYERTOTAL" (
   pCartID           IN  CHAR,
   pEmployerZip      IN  NUMBER,
   pEeCount          IN  NUMBER,
   pMonthsAhead      IN  NUMBER,
   pEEContributionP  IN  NUMBER, -- Employee contribution percentage, require 50% or more.
   pEEContributionA  IN  NUMBER, -- Employee contribution amount.
   pDepContributionP IN  NUMBER, -- Dependent contribution percentage.
   pDepContributionA IN  NUMBER, -- Dependent contribution amount.
   pPlanTypeId       IN  NUMBER,
   pIsPdf            IN  CHAR,
   v_refcur          OUT SYS_REFCURSOR)
AS
BEGIN
   findWebRates(pCartId, pEmployerZip, pEeCount, pPlanTypeId, ADD_MONTHS(TRUNC(SYSDATE,'MM'),pMonthsAhead), pIsPdf);

   OPEN v_refCur FOR
      SELECT MAX(carrierId) carrierId,
         planId,
         MAX(planName) planName,
         SUM(rates) ratesTotal,
         SUM(CASE WHEN piaPlanTierId=0 THEN GREATEST(rates-pEEContributionP/100,rates-pEEContributionA,0)
                  ELSE GREATEST(rates-pDepContributionP/100,rates-pDepContributionA,0) END) employeeRatesTotal,
         COUNT(*) bodyCount
      FROM findWebRatesReport
      GROUP BY planId
      ORDER BY 3;
END;
/