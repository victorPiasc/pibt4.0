CREATE OR REPLACE PROCEDURE WEB_GETNEWOEID(
   pOeId OUT NUMBER)
AS
BEGIN
   SELECT web_OE_Seq.nextval INTO pOeId
   FROM dual;
END ;
/