CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_validateAgentEmployer(
   pEmployerId IN VARCHAR2, 
   pUserId IN VARCHAR2, 
   pCount OUT NUMBER)
AS 
BEGIN 
   SELECT COUNT(0) INTO pCount 
   FROM users u    
   JOIN employer er ON 
      u.agencyId=er.agencyId AND 
      er.employerId=pEmployerId
   WHERE  userId=pUserId;  
END;
/
