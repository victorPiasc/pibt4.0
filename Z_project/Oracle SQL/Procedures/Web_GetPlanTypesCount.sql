CREATE OR REPLACE PROCEDURE Web_GetPlanTypesCount(
   pEmployerId IN  NUMBER,
   result      OUT NUMBER)
AS
BEGIN
   SELECT COUNT(DISTINCT p.planTypeId) INTO result
      FROM plans p,
         memberPlanNoBogus mp
      WHERE mp.planId=p.planId AND
         mp.employerId=pEmployerId;
END;
