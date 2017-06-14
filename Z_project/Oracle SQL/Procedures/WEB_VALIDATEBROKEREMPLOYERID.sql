CREATE OR REPLACE PROCEDURE web_validateBrokerEmployerId(
   pBrokerId IN VARCHAR2, 
   pEmployerId IN VARCHAR2, 
   pCount OUT NUMBER)
AS
BEGIN 
   SELECT COUNT(*) INTO pCOUNT
   FROM brokerEmployer
   WHERE brokerId = pBrokerId AND 
      employerId = pEmployerId AND 
      TRUNC(SYSDATE) < NVL(expiry,'31-DEC-9999');
END;         