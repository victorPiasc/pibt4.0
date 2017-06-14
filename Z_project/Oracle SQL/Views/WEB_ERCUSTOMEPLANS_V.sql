CREATE OR REPLACE FORCE VIEW WEB_ERCUSTOMEPLANS_V
AS
SELECT
   e.employerId              as employerId,
   e.planId                  as planId,
   p.planName                as planName,
   e.rateTableId             as rateTableId,
   e.effective               as effective,
   e.expiry                  as expiry,
   e.side                    as side,
   CASE WHEN e.side='P' THEN
      1
   ELSE
      2
   END                       as rateTableType,
   e.region                  as region
FROM
   employerRateTable e
INNER JOIN plans p
   ON e.planId = p.planId
WHERE
   TRUNC(SYSDATE) BETWEEN e.effective AND NVL(e.expiry,'31-Dec-9999') 