CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_RESETRATES" (
   pCartId     NUMBER,
   pEmployerId VARCHAR2)
AS
   vRenewalDate DATE;
BEGIN
   UPDATE web_qqCart
      SET vtl_insuranceAmount = NULL,
         mtl_insuranceAmount = NULL
      WHERE cart=pCartId;

   web_oe_endDate(pEmployerId, vRenewalDate);
   web_setRates(pCartId, pEmployerId, 'N');
   web_setLifeRates(pCartId,pEmployerId, vRenewalDate);
END;
/
