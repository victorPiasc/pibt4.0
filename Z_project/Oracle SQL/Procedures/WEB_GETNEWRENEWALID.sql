CREATE OR REPLACE PROCEDURE web_getNewRenewalId(
   pRenewalId OUT NUMBER)
AS
BEGIN 
   SELECT renewal_sequence.NEXTVAl 
   INTO pRenewalId
   FROM dual;
END;