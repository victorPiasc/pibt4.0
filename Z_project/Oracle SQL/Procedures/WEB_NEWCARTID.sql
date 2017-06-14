CREATE OR REPLACE PROCEDURE web_newCartId(
   pCartId OUT NUMBER
)
AS
BEGIN
   SELECT web_cart_seq.NEXTVAL INTO pCartId
   FROM dual;
END;   
   