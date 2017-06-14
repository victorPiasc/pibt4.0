CREATE OR REPLACE FORCE VIEW WEB_EROPENENROLLMENTPLANS_V
AS 
SELECT                                       -- Here get all regular plans
   c.name CarrierName,
   epm.employerId employerId,
   epm.monthin,
   p.planId,
   p.planTypeid,
   p.planName
FROM carrier c,
   employerPlan ep,
   plans p,
   employerPlanMonth epm
WHERE ep.planId=p.planId
   AND ep.epmId=epm.epmId
   AND p.carrierId=c.carrierId
   AND epm.monthIn>TRUNC(SYSDATE,'MM')
UNION
SELECT                                             -- Get all custom plans
   c .name CarrierName,
   ert.employerId employerId,
   expiry,
   p.planId,
   p.planTypeid,
   p.planName
FROM employerRateTable ert, carrier c, plans p
WHERE TRUNC(SYSDATE)<=expiry
   AND ERT.SIDE='P'
   AND ert.planid=p.planid
   AND p.carrierid=c.carrierid