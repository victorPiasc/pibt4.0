
  CREATE OR REPLACE FORCE VIEW WEB_CURRENTINVOICENBR
  AS 
  select max(invoiceNbr) invoiceNbr,
   employerid 
from 
  invoiceheader  ih,
  (select 
     max(logdate) logdate 
   from 
      monthend_log 
   where status = 0 ) me
where
  ih.invoicedate <= me.logdate
group by
  ih.employerid;
 
