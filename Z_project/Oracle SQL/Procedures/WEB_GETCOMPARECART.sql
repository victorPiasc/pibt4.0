﻿CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETCOMPARECART"(
    pCARTID  IN  NUMBER,
    v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
OPEN v_refcur FOR
    SELECT PLANID
       FROM WEB_QQCOMPARECART
       WHERE CART=pCARTID;
END;
/
