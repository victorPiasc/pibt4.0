
  CREATE OR REPLACE FORCE VIEW WEB_CURRENTOTHERCHARGE_V
  AS
  SELECT
   a.employerId,
   b.Description,
   b.ChargeAmount
FROM
  (SELECT 
      invoiceNbr,
      employerId 
   FROM web_currentInvoiceNbr_v) a,
  (SELECT 
      invoiceNbr,
      Description,
      ChargeAmount 
   FROM archarges) b
WHERE
  a.invoiceNbr = b.invoiceNbr;
 
