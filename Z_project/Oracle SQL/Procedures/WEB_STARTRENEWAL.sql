CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_STARTRENEWAL" (
   pRenewalId  VARCHAR2,
   pEmployerId VARCHAR2,
   pCartId     NUMBER,
   pState      NUMBER)
AS
   vEffectiveDate DATE;
BEGIN
   web_getPlanEffectiveDate(pEmployerId, vEffectiveDate);

   INSERT INTO web_renewal(renewalId, employerId, cart, state, renewalDate, effectiveDate)
      VALUES(pRenewalId, pEmployerId, pCartId, pState, SYSDATE, vEffectiveDate);
   COMMIT;

   web_oe_endDate(pEmployerId, vEffectiveDate);
   web_transferErToQuote(pCartId, pEmployerId);
   web_setRates(pCartId,pEmployerId,'N');
   web_setLifeRates(pCartId,pEmployerId, vEffectiveDate);
END;
/
