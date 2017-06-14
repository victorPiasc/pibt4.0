CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CHECKQQCART" (
    pCartId         IN  NUMBER,
    pEmployeeTypeId IN  NUMBER,
    pCount          OUT NUMBER)
AS
BEGIN
   SELECT COUNT(DISTINCT familyId) INTO pCount
   FROM web_qqCart
   WHERE employeeTypeId=pEmployeeTypeId AND
      cart=pCartId;
END;
/
