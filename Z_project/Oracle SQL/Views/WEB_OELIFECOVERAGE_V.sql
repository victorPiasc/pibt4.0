
  CREATE OR REPLACE FORCE VIEW WEB_OELIFECOVERAGE_V
  AS
  SELECT Distinct
      web.oeId,
      p.planid,
      pt.planTypeId,
      pt.description,
      p.ratebasis
    FROM 
      WEB_EnrollerFormPlans web,
      plans p,
      planType pt
    WHERE
      web.planId = p.planId AND
      nvl(web.treasonid,0)<>3 AND
      p.planTypeId = pt.planTypeId AND
      pt.beneficiary = 'Y'  AND
      p.carrierId <> 0
    ORDER BY
      pt.description;
 
