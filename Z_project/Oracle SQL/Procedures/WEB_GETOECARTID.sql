﻿CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETOECARTID" (
   pOeId   IN  VARCHAR2,
   pCartId OUT NUMBER)
AS
BEGIN
   SELECT MIN(cart) INTO pCartId
      FROM web_oeCart
      WHERE oeId=TO_NUMBER(pOeId);
END;
/
