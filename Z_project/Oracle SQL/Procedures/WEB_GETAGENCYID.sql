CREATE OR REPLACE PROCEDURE web_getAgencyId(
   pEmployerId IN VARCHAR2, 
   pAgencyId OUT VARCHAR2)
AS 
BEGIN 
   SELECT agencyId INTO pAgencyId 
   FROM employer 
   WHERE employerId=pEmployerId;
END;      