CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETQQEMPLOYER" (
   pCARTID  IN  NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT CART,
         COMPANYNAME,
         ADDRESS,
         CITY,
         ST,
         ZIP,
         FAX,
         CNAME,
         PHONE,
         EMAIL,
         ISPC,
         CONTRIBUTION,
         CONTRIBUTIONDEP
      FROM WEB_QQEMPLOYER
      WHERE CART=pCARTID;
END;
/
