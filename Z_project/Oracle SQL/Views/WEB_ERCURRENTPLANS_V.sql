CREATE OR REPLACE FORCE VIEW PIA_ADMIN.WEB_ERCURRENTPLANS_V
AS
   SELECT c.name carrierName,
      ep.employerId,
      TRUNC (SYSDATE, 'MM') monthIn,
      p.planId,
      p.planTypeid,
      p.planName,
      c.carrierId
   FROM carrier c
   JOIN plans p ON 
      c.carrierId = p.carrierId
   LEFT JOIN employerPlans ep ON
      p.planId = ep.planId AND
      ( ep.employerId>0 AND TRUNC(SYSDATE) BETWEEN ep.startDate AND NVL (ep.endDate, '31-Dec-9999') OR
         ep.employerId<0 AND TRUNC(SYSDATE) <= NVL(ep.endDate,'31-DEC-9999')) 
   WHERE p.planName LIKE '%Declination%' OR ep.planId IS NOT NULL;
