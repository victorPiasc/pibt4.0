
  CREATE OR REPLACE FORCE VIEW WEB_CURRENTINVOICENBR_V
  AS 
  SELECT
  ih1.invoicedate,
  ih2.invoiceNbr,
  ih2.employerId
FROM
    invoiceheader ih1,
    (SELECT MAX(invoiceNbr) invoiceNbr,
       employerId 
    FROM 
      invoiceheader  ih,
      (SELECT 
         MAX(logdate) logdate 
       FROM 
          monthend_log 
       WHERE status = 0 ) me
    WHERE
      ih.invoicedate <= me.logdate
    GROUP BY
      ih.employerid) ih2
WHERE
  ih1.invoiceNbr= ih2.invoiceNbr;
 
