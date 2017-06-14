CREATE OR REPLACE PROCEDURE web_validateEmployerRk(
   pUserId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pCount OUT NUMBER)
AS
BEGIN
   SELECT COUNT(*) INTO pCount 
   FROM employer er
   JOIN csrInfo c ON 
      er.csrId=c.csrId AND 
      c.userId=pUserId
   WHERE employerId=pEmployerId;
END;         
