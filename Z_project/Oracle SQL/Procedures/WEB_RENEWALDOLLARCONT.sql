CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_RENEWALDOLLARCONT" (
   pCartId    IN  NUMBER,
   pDollar    OUT NUMBER,
   pDollarDep OUT NUMBER)
AS
BEGIN
   SELECT NVL(MAX(dollar),0),
         NVL(MAX(dollarDep),0)
      INTO pDollar, pDollarDep
      FROM web_qqEmployer
      WHERE cart=pCartId;
END;
/
