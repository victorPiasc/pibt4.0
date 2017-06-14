CREATE OR REPLACE PROCEDURE web_validateEnrollerEmployer(
   pEmployerId IN VARCHAR2, 
   pUserId IN VARCHAR2, 
   pCount OUT NUMBER)
AS 
BEGIN 
   SELECT COUNT(0) INTO pCount 
   FROM enrollerInfo ei 
   JOIN employer er ON       
      ei.enrollerId=er.enrollerId AND 
      er.employerId=pEmployerId
   WHERE  userId=pUserId;  
END;   