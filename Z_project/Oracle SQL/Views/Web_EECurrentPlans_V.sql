CREATE OR REPLACE FORCE VIEW WEB_EECURRENTPLANS_V
AS
SELECT
   c.name CarrierName,
   Mp.employerId ,
   Mp.Employeeid ,
   trunc(sysdate,'month') monthIn,
   p.planId    ,
   P.Plantypeid,
   P.Planname ,
   Mp.Memberid
FROM
   Carrier C,
   memberPlanNoBogus mp,
   plans p
WHERE
   Mp.planId=p.planId AND
   P.Carrierid = C.Carrierid AND
   TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-Dec-9999')
ORDER BY
   p.planName