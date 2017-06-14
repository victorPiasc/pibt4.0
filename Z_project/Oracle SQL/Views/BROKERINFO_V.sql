CREATE OR REPLACE VIEW brokerInfo_v
AS
SELECT MAX(be.brokerEmployerId) brokerEmployerId, 
   be.employerId, 
   MAX(er.name) name, 
   MAX(be.effective) effective, 
   MAX(be.expiry) expiry,
   CASE WHEN be.employerId>0 THEN --eccepted employer check time frame
      CASE WHEN TRUNC(SYSDATE) BETWEEN MAX(be.effective) AND NVL(MAX(be.expiry),'31-DEC-9999') THEN 'ACTIVE'
         ELSE 'INACTIVE' END
   ELSE --proforma employer check employer plans 
      CASE WHEN MAX(ep.epId) IS NOT NULL THEN 'PENDING'
      ELSE 'INCOMPLETE' END 
   END status
FROM brokerEmployer be
JOIN employer er ON 
   be.employerId=er.employerId
LEFT JOIN employerPlans ep ON 
   be.employerId=ep.employerId AND 
   TRUNC(SYSDATE)<= NVL(ep.endDate, '31-dec-9999')
GROUP BY be.employerId;