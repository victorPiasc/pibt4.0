CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SETRATES" (
   pCartId     NUMBER,
   pEmployerId VARCHAR2,
   pForOe      CHAR)
AS
   vNbr         INTEGER;
   vOeId        INTEGER;
   vRenewalDate DATE;
BEGIN
   web_getNbrEmployees(pEmployerId, vNbr);

   IF pForOe='Y' THEN
      SELECT oeId INTO vOeId
         FROM web_oeCart
         WHERE cart=pCartId;
      web_getOeEffectiveDate(vOeId, vRenewalDate);
   ELSE
      web_oe_endDate(pEmployerId, vRenewalDate);
   END IF;

   findWebRates(pCartId, pEmployerId, vNbr, pForOe, vRenewalDate, 'N', null);
END;
/
