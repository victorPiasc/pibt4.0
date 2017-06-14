CREATE OR REPLACE PROCEDURE Web_GetPlanTypesByErIdCount(
   pEmployerId IN  NUMBER,
   result      OUT NUMBER)
AS
BEGIN
   SELECT COUNT(DISTINCT planTypeId) INTO result FROM web_erCurrentPlans_v WHERE employerId=pEmployerId;
END;