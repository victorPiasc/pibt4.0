CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_UPDATEERDOLLAR" (
    pCartId    NUMBER,
    pDollar    NUMBER,
    pDollarDep NUMBER)
AS
BEGIN
   UPDATE web_qqEmployer
      SET dollar = pDollar,
         dollarDep = pDollarDep
      WHERE cart=pCartId;
   COMMIT;
END;
/
