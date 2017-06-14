CREATE OR REPLACE PROCEDURE web_deleteBrokerEmployer(
   pBrokerId VARCHAR2, 
   pEmployerId VARCHAR2)
AS
BEGIN 
   DELETE FROM brokerEmployer 
   WHERE brokerId = pBrokerId AND 
      employerId = pEmployerID;
   COMMIT;
END;