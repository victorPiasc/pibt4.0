CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CUSTOMPLANCOUNT" (
   pEmployerId IN VARCHAR2,
   pCount OUT NUMBER)
AS
BEGIN
   SELECT COUNT(*) INTO pCount
   FROM employerRateTable ert
   JOIN plans p ON
      ert.planId=p.planId
   WHERE ert.employerId=pEmployerId AND
      TRUNC(SYSDATE) BETWEEN ert.effective AND NVL(ert.expiry,'31-DEC-9999') AND
      ert.employerId<1000000;

   IF pCount=0 THEN
      SELECT COUNT(*) INTO pCount
      FROM employerPlans ep
      JOIN plans p ON
         ep.planId=p.planId
      WHERE ep.employerId=pEmployerId AND
         TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate,'31-DEC-9999') AND
         p.subPlanTypeId=3;
   END IF;
END;
/
