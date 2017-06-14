CREATE OR REPLACE PROCEDURE web_updateBroker (
   pBrokerId IN VARCHAR2, 
   pName     IN VARCHAR2, 
   pEmail    IN VARCHAR2)
AS
BEGIN 
   UPDATE BROKER 
   SET name = pName, 
      email = pEmail
   WHERE brokerId = pBrokerId;
   
   COMMIT;
END;         